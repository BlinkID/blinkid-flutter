package com.microblink.blinkid.flutter

import android.content.Context
import android.os.Handler
import android.os.Looper
import android.view.View
import android.view.ViewGroup
import androidx.camera.core.CameraSelector
import androidx.camera.core.ImageAnalysis
import androidx.camera.core.Preview
import androidx.camera.core.UseCaseGroup
import androidx.camera.core.resolutionselector.AspectRatioStrategy
import androidx.camera.core.resolutionselector.ResolutionSelector
import androidx.camera.core.resolutionselector.ResolutionStrategy
import androidx.camera.view.PreviewView
import androidx.core.content.ContextCompat
import androidx.lifecycle.DefaultLifecycleObserver
import androidx.lifecycle.Lifecycle
import androidx.lifecycle.LifecycleOwner
import androidx.lifecycle.LifecycleRegistry
import com.microblink.blinkid.entities.recognizers.Recognizer
import com.microblink.blinkid.flutter.recognizers.RecognizerSerializers
import com.microblink.blinkid.metadata.detection.quad.DisplayableQuadDetection
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.embedding.engine.plugins.lifecycle.FlutterLifecycleAdapter
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.platform.PlatformView
import org.json.JSONObject
import java.util.concurrent.ExecutorService
import java.util.concurrent.Executors


class MicroblinkScannerView(
    context: Context,
    id: Int,
    private val creationParams: MicroblinkCreationParams,
    messenger: BinaryMessenger,
    activityPluginBinding: ActivityPluginBinding,
) : PlatformView, LifecycleOwner, DefaultLifecycleObserver {
    private val scanner: MicroblinkScanner
    private val dispatcher = MicroblinkEventDispatcher(messenger, id)
    private val view = PreviewView(context)
        .also {
            it.implementationMode = PreviewView.ImplementationMode.COMPATIBLE
            it.layoutParams = ViewGroup.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.MATCH_PARENT
            )
        }
    private val cameraExecutor: ExecutorService = Executors.newSingleThreadExecutor()
    private val cameraSelector: CameraSelector
        get() = creationParams.overlaySettings.useFrontCamera
            .let { if (it) CameraSelector.DEFAULT_FRONT_CAMERA else CameraSelector.DEFAULT_BACK_CAMERA }
    private val lifecycleRegistry = LifecycleRegistry(this)
    override val lifecycle: Lifecycle
        get() = lifecycleRegistry
    private val activityLifecycle = FlutterLifecycleAdapter.getActivityLifecycle(activityPluginBinding)
        .also { it.addObserver(this) }

    init {
        scanner = MicroblinkScanner(context,
            creationParams,
            object : MicroblinkScanner.Callbacks {
                override fun onFirstSideScanned() {
                    dispatcher.reportFirstSideScanned()
                }

                override fun onDetectionStatusUpdated(displayableQuadDetection: DisplayableQuadDetection) {
                    dispatcher.reportQuadDetection(displayableQuadDetection)
                }

                override fun onScanningDone(state: Recognizer.Result.State) {
                    dispatcher.reportScanningDone(state)
                }

                override fun onScanned(recognizers: Array<Recognizer<Recognizer.Result>>) {
                    dispatcher.reportFinishedScanning(recognizers)
                }

                override fun onError(throwable: Throwable) {
                    dispatcher.reportError(throwable)
                }

            })
        dispatcher.resumeScanningHandler = scanner::resume
        Camera(
            context,
            this,
            ContextCompat.getMainExecutor(context),
            createPreviewAndAnalysisUseCaseGroup(view),
            cameraSelector,
            object : Camera.InitializationCallbacks {
                override fun onError(throwable: Throwable) {
                    dispatcher.reportError(throwable)
                }
            }
        )

        view.previewStreamState.observe(this) { state ->
            if (state == PreviewView.StreamState.STREAMING && creationParams.overlaySettings.flipFrontCamera) {
                view.scaleX = -1F
            }
        }

    }


    override fun getView(): View {
        return view
    }

    override fun onResume(owner: LifecycleOwner) {
        super.onResume(owner)
        lifecycleRegistry.handleLifecycleEvent(Lifecycle.Event.ON_RESUME)
    }

    override fun onPause(owner: LifecycleOwner) {
        super.onPause(owner)
        lifecycleRegistry.handleLifecycleEvent(Lifecycle.Event.ON_PAUSE)
    }

    override fun onStop(owner: LifecycleOwner) {
        super.onStop(owner)
        lifecycleRegistry.handleLifecycleEvent(Lifecycle.Event.ON_STOP)
    }

    override fun onFlutterViewAttached(flutterView: View) {
        super.onFlutterViewAttached(flutterView)
        lifecycleRegistry.handleLifecycleEvent(Lifecycle.Event.ON_CREATE)
        lifecycleRegistry.handleLifecycleEvent(Lifecycle.Event.ON_START)
        lifecycleRegistry.handleLifecycleEvent(Lifecycle.Event.ON_RESUME)
    }

    override fun dispose() {
        lifecycleRegistry.handleLifecycleEvent(Lifecycle.Event.ON_DESTROY)
        activityLifecycle.removeObserver(this)
        cameraExecutor.shutdown()
        scanner.dispose()

    }

    private fun createPreviewAndAnalysisUseCaseGroup(
        view: PreviewView,
    ): UseCaseGroup {
        val resolutionSelector = ResolutionSelector.Builder()
            .setAllowedResolutionMode(ResolutionSelector.PREFER_HIGHER_RESOLUTION_OVER_CAPTURE_RATE)
            .setAspectRatioStrategy(AspectRatioStrategy.RATIO_16_9_FALLBACK_AUTO_STRATEGY)
            .setResolutionStrategy(ResolutionStrategy.HIGHEST_AVAILABLE_STRATEGY)
            .build()

        val previewUseCase = Preview.Builder()
            .setResolutionSelector(resolutionSelector)
            .build()
            .also { it.setSurfaceProvider(view.surfaceProvider) }

        val imageAnalysisUseCase = ImageAnalysis.Builder()
            .setResolutionSelector(resolutionSelector)
            .setImageQueueDepth(1)
            .setBackpressureStrategy(ImageAnalysis.STRATEGY_KEEP_ONLY_LATEST)
            .build()
            .also { it.setAnalyzer(cameraExecutor, scanner) }

        return UseCaseGroup.Builder()
            .addUseCase(previewUseCase)
            .addUseCase(imageAnalysisUseCase)
            .build()
    }

}

internal class MicroblinkEventDispatcher(binaryMessenger: BinaryMessenger, id: Int) {
    private val methodChannel = MethodChannel(
        binaryMessenger,
        "com.microblink.blinkid.flutter/MicroblinkScannerWidget/$id"
    )
    private val handler: Handler = Handler(Looper.getMainLooper())
    var resumeScanningHandler: () -> Unit = {}

    init {
        methodChannel.setMethodCallHandler { call, result ->
            when (call.method) {
                "resumeScanning" -> {
                    resumeScanningHandler()
                    result.success(null)
                }

                else -> result.notImplemented()
            }
        }
    }

    fun reportQuadDetection(displayableQuadDetection: DisplayableQuadDetection) {
        val jsonObject = JSONObject()
            .put("status", displayableQuadDetection.detectionStatus.name)

        sendToMethodChannel("onDetectionStatusUpdate", jsonObject.toString())
    }

    fun reportFirstSideScanned() {
        sendToMethodChannel("onFirstSideScanned", null)
    }

    private fun sendToMethodChannel(method: String, arguments: Any?) {
        handler.post {
            methodChannel.invokeMethod(method, arguments)
        }
    }

    fun reportScanningDone(resultState: Recognizer.Result.State) {
        sendToMethodChannel(
            "onScanDone", when (resultState) {
                Recognizer.Result.State.Empty -> "empty"
                Recognizer.Result.State.Uncertain -> "uncertain"
                Recognizer.Result.State.Valid -> "valid"
                Recognizer.Result.State.StageValid -> "stageValid"
            }
        )
    }

    fun reportFinishedScanning(recognizers: Array<Recognizer<Recognizer.Result>>) {
        val resultJsonArray = RecognizerSerializers.INSTANCE.serializeRecognizerResults(recognizers)
        sendToMethodChannel("onFinishScanning", resultJsonArray.toString())
    }

    fun reportError(throwable: Throwable) {
        sendToMethodChannel("onError", throwable.toString())
    }
}


