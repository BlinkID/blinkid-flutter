package com.microblink.blinkid.flutter

import android.annotation.SuppressLint
import android.content.Context
import android.graphics.Bitmap
import androidx.camera.core.ImageAnalysis
import androidx.camera.core.ImageProxy
import com.microblink.blinkid.MicroblinkSDK
import com.microblink.blinkid.directApi.RecognizerRunner
import com.microblink.blinkid.entities.recognizers.RecognizerBundle
import com.microblink.blinkid.flutter.recognizers.RecognizerSerializers
import com.microblink.blinkid.hardware.orientation.Orientation
import com.microblink.blinkid.intent.IntentDataTransferMode
import com.microblink.blinkid.metadata.MetadataCallbacks
import com.microblink.blinkid.metadata.detection.quad.QuadDetectionCallback
import com.microblink.blinkid.metadata.recognition.FirstSideRecognitionCallback
import com.microblink.blinkid.recognition.RecognitionSuccessType
import com.microblink.blinkid.view.recognition.DetectionStatus
import com.microblink.blinkid.view.recognition.ScanResultListener
import org.json.JSONObject

class MicroblinkScanner internal constructor(
    context: Context,
    creationParams: MicroblinkCreationParams,
    callbacks: Callbacks
) : ImageAnalysis.Analyzer {
    private val recognizerRunner: RecognizerRunner
    private val recognizerBundle: RecognizerBundle
    private val callbacks: Callbacks

    init {
        setLicense(context, creationParams.licenseKey)
        this.callbacks = callbacks
        recognizerBundle = createRecognizerBundle(creationParams.recognizerCollection as Map<String?, Any?>?)
        recognizerRunner = createRecognizer(context, recognizerBundle)
        recognizerRunner.setMetadataCallbacks(createMetadataCallbacks(callbacks))
    }

    @SuppressLint("NewApi")
    override fun analyze(image: ImageProxy) {
        if (recognizerRunner.currentState == RecognizerRunner.State.READY) {
            val rgbaBytes = ByteArray(image.planes[0].buffer.limit())
            image.planes[0].buffer[rgbaBytes]
            val bitmap = bitmapFromRgba(rgbaBytes, image.width, image.height)
            recognizerRunner.recognizeBitmap(
                bitmap, Orientation.ORIENTATION_LANDSCAPE_RIGHT,
                createScanResultListener(image)
            )
        } else {
            image.close()
        }
    }

    private fun createScanResultListener(imageProxy: ImageProxy): ScanResultListener {
        return object : ScanResultListener {
            @SuppressLint("NewApi")
            override fun onScanningDone(recognitionSuccessType: RecognitionSuccessType) {
                callbacks.onScanningDone(recognitionSuccessType)
                if (recognitionSuccessType != RecognitionSuccessType.UNSUCCESSFUL) {
                    val resultJsonArray = RecognizerSerializers.INSTANCE.serializeRecognizerResults(
                        recognizerBundle.recognizers
                    )
                    callbacks.onScanned(resultJsonArray.toString(), object : Callbacks.Callback {
                        override fun onResumeScanning() {
                            imageProxy.close()
                        }
                    })
                } else {
                    recognizerRunner.resetRecognitionState()
                    imageProxy.close()
                }
            }

            override fun onUnrecoverableError(throwable: Throwable) {
                callbacks.onError(throwable)
                recognizerRunner.resetRecognitionState()
            }
        }
    }

    private fun bitmapFromRgba(bytes: ByteArray, width: Int, height: Int): Bitmap {
        val colorPixels = IntArray(width * height)
        var j = 0
        for (i in colorPixels.indices) {
            val R = bytes[j++]
            val G = bytes[j++]
            val B = bytes[j++]
            val A = bytes[j++]
            colorPixels[i] =
                A.toInt() and 0xff shl 24 or (R.toInt() and 0xff shl 16) or (G.toInt() and 0xff shl 8) or (B.toInt() and 0xff)
        }
        val bitmap = Bitmap.createBitmap(width, height, Bitmap.Config.ARGB_8888)
        bitmap.setPixels(colorPixels, 0, width, 0, 0, width, height)
        return bitmap
    }

    private fun setLicense(context: Context, licenseKey: String?) {
        MicroblinkSDK.setShowTrialLicenseWarning(false)
        MicroblinkSDK.setLicenseKey(licenseKey!!, context)
        MicroblinkSDK.setIntentDataTransferMode(IntentDataTransferMode.PERSISTED_OPTIMISED)
    }

    private fun createRecognizerBundle(recognizerCollection: Map<String?, Any?>?): RecognizerBundle {
        val jsonRecognizerCollection = JSONObject(
            recognizerCollection
        )
        return RecognizerSerializers.INSTANCE.deserializeRecognizerCollection(
            jsonRecognizerCollection
        )
    }

    private fun createRecognizer(context: Context, recognizerBundle: RecognizerBundle): RecognizerRunner {
        val recognizerRunner = RecognizerRunner.getSingletonInstance()
        recognizerRunner.initialize(context, recognizerBundle) { throwable -> callbacks.onError(throwable) }
        return recognizerRunner
    }

    private fun createMetadataCallbacks(callbacks: Callbacks): MetadataCallbacks {
        val metadataCallbacks = MetadataCallbacks()
        metadataCallbacks.quadDetectionCallback = QuadDetectionCallback { displayableQuadDetection ->
            callbacks.onDetectionStatusUpdated(displayableQuadDetection.detectionStatus)
        }
        metadataCallbacks.firstSideRecognitionCallback = FirstSideRecognitionCallback { callbacks.onFirstSideScanned() }
        return metadataCallbacks
    }

    fun dispose() {
        recognizerRunner.terminate()
    }

    internal interface Callbacks {
        interface Callback {
            fun onResumeScanning()
        }

        fun onFirstSideScanned()
        fun onDetectionStatusUpdated(detectionStatus: DetectionStatus?)
        fun onScanningDone(recognitionSuccessType: RecognitionSuccessType?)
        fun onScanned(result: String?, callback: Callback?)
        fun onError(throwable: Throwable?)
    }
}