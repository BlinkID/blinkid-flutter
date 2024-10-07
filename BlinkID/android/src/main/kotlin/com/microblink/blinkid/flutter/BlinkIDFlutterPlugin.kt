package com.microblink.blinkid.flutter

import android.app.Activity
import android.content.Context
import android.content.Intent
import android.graphics.Bitmap
import android.graphics.BitmapFactory
import android.util.Base64
import com.microblink.blinkid.MicroblinkSDK
import com.microblink.blinkid.directApi.DirectApiErrorListener
import com.microblink.blinkid.directApi.RecognizerRunner
import com.microblink.blinkid.entities.recognizers.RecognizerBundle
import com.microblink.blinkid.flutter.overlays.OverlaySettingsSerializers
import com.microblink.blinkid.flutter.recognizers.RecognizerSerializers
import com.microblink.blinkid.hardware.orientation.Orientation
import com.microblink.blinkid.intent.IntentDataTransferMode
import com.microblink.blinkid.licence.exception.LicenceKeyException
import com.microblink.blinkid.locale.LanguageUtils
import com.microblink.blinkid.metadata.MetadataCallbacks
import com.microblink.blinkid.metadata.recognition.FirstSideRecognitionCallback
import com.microblink.blinkid.recognition.RecognitionSuccessType
import com.microblink.blinkid.uisettings.ActivityRunner
import com.microblink.blinkid.uisettings.UISettings
import com.microblink.blinkid.view.recognition.ScanResultListener
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.FlutterPlugin.FlutterPluginBinding
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.PluginRegistry.ActivityResultListener
import io.flutter.plugin.common.PluginRegistry.Registrar
import org.json.JSONObject

class BlinkIDFlutterPlugin : FlutterPlugin, MethodCallHandler,
    ActivityResultListener, ActivityAware {
    private var mFirstSideScanned = false
    private var mRecognizerBundle: RecognizerBundle? = null
    private var mRecognizerRunner: RecognizerRunner? = null

    private var channel: MethodChannel? = null
    private var context: Context? = null
    private var activity: Activity? = null

    private var pendingResult: MethodChannel.Result? = null
    private var flutterPluginBinding: FlutterPluginBinding? = null

    override fun onAttachedToEngine(binding: FlutterPluginBinding) {
        flutterPluginBinding = binding
        setupPlugin(
            binding.applicationContext,
            binding.binaryMessenger
        )
    }

    private fun setupPlugin(context: Context?, messenger: BinaryMessenger) {
        if (context != null) {
            this.context = context
        }

        this.channel = MethodChannel(messenger, CHANNEL)
        channel!!.setMethodCallHandler(this)
    }

    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        if (call.method == METHOD_SCAN_CAMERA) {
            pendingResult = result
            val isLicenseKeyValid = setLicense((call.argument<Any>(ARG_LICENSE) as Map<*, *>?)!!)

            val jsonOverlaySettings = JSONObject(call.argument<Any>(ARG_OVERLAY_SETTINGS) as Map<*, *>?)
            val jsonRecognizerCollection = JSONObject(call.argument<Any>(ARG_RECOGNIZER_COLLECTION) as Map<*, *>?)
            if (isLicenseKeyValid) {
                setLanguage(jsonOverlaySettings)
                mRecognizerBundle =
                    RecognizerSerializers.INSTANCE.deserializeRecognizerCollection(jsonRecognizerCollection)
                val uiSettings = OverlaySettingsSerializers.INSTANCE.getOverlaySettings(
                    context,
                    jsonOverlaySettings,
                    mRecognizerBundle
                )
                startScanning(SCAN_REQ_CODE, uiSettings)
            }
        } else if (call.method == METHOD_SCAN_DIRECT_API) {
            pendingResult = result
            val isLicenseKeyValid = setLicense((call.argument<Any>(ARG_LICENSE) as Map<*, *>?)!!)

            val jsonRecognizerCollection = JSONObject(call.argument<Any>(ARG_RECOGNIZER_COLLECTION) as Map<*, *>?)
            val frontImage = call.argument<String>(ARG_FRONT_IMAGE)
            val backImage = call.argument<String>(ARG_BACK_IMAGE)
            if (isLicenseKeyValid) {
                scanWithDirectApi(jsonRecognizerCollection, frontImage!!, backImage!!)
            }
        } else {
            result.notImplemented()
        }
    }


    private fun setLicense(licenseMap: Map<*, *>): Boolean {
        var isLicenseKeyValid = true
        if (licenseMap[ARG_SHOW_LICENSE_WARNING] != null) {
            MicroblinkSDK.setShowTrialLicenseWarning(licenseMap[ARG_SHOW_LICENSE_WARNING] as Boolean)
        } else {
            MicroblinkSDK.setShowTrialLicenseWarning(true)
        }

        val licenseKey = licenseMap[ARG_LICENSE_KEY] as String?
        val licensee = licenseMap[ARG_LICENSEE] as String?

        if (licensee == null) {
            try {
                MicroblinkSDK.setLicenseKey(licenseKey!!, context!!)
            } catch (licenceKeyException: LicenceKeyException) {
                isLicenseKeyValid = false
                pendingResult!!.error("Android license key error", licenceKeyException.message, null)
            }
        } else {
            try {
                MicroblinkSDK.setLicenseKey(licenseKey!!, licensee, context!!)
            } catch (licenceKeyException: LicenceKeyException) {
                isLicenseKeyValid = false
                pendingResult!!.error("Android license key error", licenceKeyException.message, null)
            }
        }
        MicroblinkSDK.setIntentDataTransferMode(IntentDataTransferMode.PERSISTED_OPTIMISED)
        return isLicenseKeyValid
    }

    private fun setLanguage(jsonOverlaySettings: JSONObject) {
        try {
            LanguageUtils.setLanguageAndCountry(
                jsonOverlaySettings.getString("language"),
                jsonOverlaySettings.getString("country"),
                context!!
            )
        } catch (e: Exception) {
        }
    }

    private fun startScanning(requestCode: Int, uiSettings: UISettings<*>) {
        if (context is Activity) {
            ActivityRunner.startActivityForResult((context as Activity), requestCode, uiSettings)
        } else if (activity != null) {
            ActivityRunner.startActivityForResult(activity!!, requestCode, uiSettings)
        } else {
            pendingResult!!.error("Context can't be casted to Activity", null, null)
        }
    }

    private fun scanWithDirectApi(jsonRecognizerCollection: JSONObject, frontImage: String, backImage: String) {
        val mScanResultListenerBackSide: ScanResultListener = object : ScanResultListener {
            override fun onScanningDone(recognitionSuccessType: RecognitionSuccessType) {
                mFirstSideScanned = false
                handleDirectApiResult(recognitionSuccessType)
            }

            override fun onUnrecoverableError(throwable: Throwable) {
                handleDirectApiError(throwable.message)
            }
        }

        val mFirstSideRecognitionCallback =
            FirstSideRecognitionCallback { mFirstSideScanned = true }

        val mScanResultListenerFrontSide: ScanResultListener = object : ScanResultListener {
            override fun onScanningDone(recognitionSuccessType: RecognitionSuccessType) {
                if (mFirstSideScanned) {
                    //multiside recognizer used
                    if (!backImage.isEmpty() && backImage != null) {
                        processImage(backImage, mScanResultListenerBackSide)
                    } else if (recognitionSuccessType != RecognitionSuccessType.UNSUCCESSFUL) {
                        handleDirectApiResult(recognitionSuccessType)
                    } else {
                        handleDirectApiError("Could not extract the information from the front side and back side is empty!")
                    }
                } else if (!mFirstSideScanned && recognitionSuccessType != RecognitionSuccessType.UNSUCCESSFUL) {
                    //singleside recognizer used
                    handleDirectApiResult(recognitionSuccessType)
                } else {
                    mFirstSideScanned = false
                    handleDirectApiError("Could not extract the information with DirectAPI!")
                }
            }

            override fun onUnrecoverableError(throwable: Throwable) {
                handleDirectApiError(throwable.message)
            }
        }

        setupRecognizerRunner(jsonRecognizerCollection, mFirstSideRecognitionCallback)

        if (!frontImage.isEmpty()) {
            processImage(frontImage, mScanResultListenerFrontSide)
        } else {
            handleDirectApiError("The provided image for the 'frontImage' parameter is empty!")
        }
    }

    private fun setupRecognizerRunner(
        jsonRecognizerCollection: JSONObject,
        mFirstSideRecognitionCallback: FirstSideRecognitionCallback
    ) {
        if (mRecognizerRunner != null) {
            mRecognizerRunner!!.terminate()
        }
        val mRecognizerBundle = RecognizerSerializers.INSTANCE.deserializeRecognizerCollection(jsonRecognizerCollection)
        try {
            mRecognizerRunner = RecognizerRunner.getSingletonInstance()
        } catch (e: Exception) {
            handleDirectApiError("DirectAPI not supported: $e")
        }

        val metadataCallbacks = MetadataCallbacks()
        metadataCallbacks.firstSideRecognitionCallback = mFirstSideRecognitionCallback
        mRecognizerRunner!!.setMetadataCallbacks(metadataCallbacks)
        mRecognizerRunner!!.initialize(
            context!!,
            mRecognizerBundle,
            DirectApiErrorListener { throwable: Throwable -> handleDirectApiError("Failed to initialize recognizer with DirectAPI: " + throwable.message) })
    }

    private fun processImage(base64Image: String, scanResultListener: ScanResultListener) {
        val image = base64ToBitmap(base64Image)
        if (image != null) {
            mRecognizerRunner!!.recognizeBitmap(
                base64ToBitmap(base64Image),
                Orientation.ORIENTATION_LANDSCAPE_RIGHT,
                scanResultListener
            )
        } else {
            handleDirectApiError("Could not decode the Base64 image!")
        }
    }

    private fun handleDirectApiResult(recognitionSuccessType: RecognitionSuccessType) {
        if (recognitionSuccessType != RecognitionSuccessType.UNSUCCESSFUL) {
            if (pendingResult == null) {
                return
            }
            val resultList = RecognizerSerializers.INSTANCE.serializeRecognizerResults(
                mRecognizerBundle!!.recognizers
            )
            pendingResult!!.success(resultList.toString())
        }
        pendingResult = null
    }

    private fun base64ToBitmap(base64String: String): Bitmap {
        val decodedBytes = Base64.decode(base64String, Base64.DEFAULT)
        return BitmapFactory.decodeByteArray(decodedBytes, 0, decodedBytes.size)
    }

    private fun handleDirectApiError(errorMessage: String?) {
        pendingResult!!.error("", errorMessage, null)
        if (mRecognizerRunner != null) {
            mRecognizerRunner!!.resetRecognitionState(true)
        }
    }

    override fun onDetachedFromActivity() {}

    override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
        onAttachedToActivity(binding)
    }

    override fun onAttachedToActivity(binding: ActivityPluginBinding) {
        activity = binding.activity
        binding.addActivityResultListener(this)
        flutterPluginBinding!!.platformViewRegistry.registerViewFactory(
            "MicroblinkScannerView",
            MicroblinkScannerViewFactory(flutterPluginBinding!!.binaryMessenger, binding)
        )
    }

    override fun onDetachedFromActivityForConfigChanges() {}

    override fun onDetachedFromEngine(binding: FlutterPluginBinding) {
        this.context = null
        this.activity = null
        this.flutterPluginBinding = null

        channel!!.setMethodCallHandler(null)
        this.channel = null
    }



    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?): Boolean {
        if (pendingResult == null) {
            return true
        }

        if (resultCode == Activity.RESULT_OK && data != null) {
            if (requestCode == SCAN_REQ_CODE && mRecognizerBundle != null) {
                mRecognizerBundle!!.loadFromIntent(data)
                val resultList = RecognizerSerializers.INSTANCE.serializeRecognizerResults(
                    mRecognizerBundle!!.recognizers
                )

                pendingResult!!.success(resultList.toString())
            }
        } else if (resultCode == Activity.RESULT_CANCELED) {
            pendingResult!!.success("null")
        } else {
            pendingResult!!.error("Unexpected error", null, null)
        }

        pendingResult = null
        return true
    }

    companion object {
        private const val CHANNEL = "blinkid_scanner"

        private const val SCAN_REQ_CODE = 1904
        private const val METHOD_SCAN_CAMERA = "scanWithCamera"
        private const val METHOD_SCAN_DIRECT_API = "scanWithDirectApi"

        private const val ARG_LICENSE = "license"
        private const val ARG_LICENSE_KEY = "licenseKey"
        private const val ARG_LICENSEE = "licensee"
        private const val ARG_SHOW_LICENSE_WARNING = "showTimeLimitedLicenseKeyWarning"
        private const val ARG_RECOGNIZER_COLLECTION = "recognizerCollection"
        private const val ARG_OVERLAY_SETTINGS = "overlaySettings"
        private const val ARG_FRONT_IMAGE = "frontImage"
        private const val ARG_BACK_IMAGE = "backImage"

        // This static function is optional and equivalent to onAttachedToEngine. It supports the old
        // pre-Flutter-1.12 Android projects.
        fun registerWith(registrar: Registrar) {
            val plugin = BlinkIDFlutterPlugin()
            plugin.setupPlugin(registrar.activity(), registrar.messenger())
            registrar.addActivityResultListener(plugin)
        }
    }


}