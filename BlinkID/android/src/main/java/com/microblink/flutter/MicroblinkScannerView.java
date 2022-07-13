package com.microblink.flutter;

import android.annotation.SuppressLint;
import android.content.Context;
import android.os.Handler;
import android.os.Looper;
import android.util.Size;
import android.view.View;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.camera.core.AspectRatio;
import androidx.camera.core.CameraSelector;
import androidx.camera.core.ImageAnalysis;
import androidx.camera.core.Preview;
import androidx.camera.core.UseCaseGroup;
import androidx.camera.view.PreviewView;
import androidx.lifecycle.Lifecycle;
import androidx.lifecycle.LifecycleOwner;
import androidx.lifecycle.LifecycleRegistry;
import androidx.lifecycle.Observer;

import com.microblink.view.recognition.DetectionStatus;

import java.util.concurrent.Executor;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;

import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding;
import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.platform.PlatformView;


class MicroblinkScannerView implements PlatformView, LifecycleOwner, MicroblinkScanner.Callbacks,
        Camera.InitializationCallbacks {
    private final LifecycleRegistry lifecycleRegistry = new LifecycleRegistry(this);
    private final MethodChannel methodChannel;
    private final PreviewView view;
    private final MicroblinkScanner scanner;
    private final ScheduledExecutorService backgroundExecutor =
            Executors.newSingleThreadScheduledExecutor();
    private final Executor mainThreadExecutor = new Executor() {
        private final Handler handler = new Handler(Looper.getMainLooper());

        @Override
        public void execute(@NonNull Runnable runnable) {
            handler.post(runnable);
        }
    };

    /**
     * @param creationParams structure: { "overlaySettings": { "useFrontCamera": false,
     *                       "flipFrontCamera": false }, "licenseKey": "...",
     *                       "recognizerCollection": {...} }
     */
    @SuppressLint("NewApi")
    MicroblinkScannerView(@NonNull Context context, int id,
            final MicroblinkCreationParams creationParams, BinaryMessenger messenger,
            ActivityPluginBinding activityPluginBinding) {
        methodChannel = new MethodChannel(messenger, "MicroblinkScannerWidget/" + id);

        MicroblinkScanner.Callbacks scannerCallbacks = this;
        scanner = new MicroblinkScanner(
                activityPluginBinding.getActivity(),
                creationParams,
                scannerCallbacks
        );

        view = new PreviewView(context);
        PreviewView.LayoutParams matchParent = new PreviewView.LayoutParams(
                PreviewView.LayoutParams.MATCH_PARENT,
                PreviewView.LayoutParams.MATCH_PARENT
        );
        view.setLayoutParams(matchParent);

        // For proper layout and possibility to mirror the preview.
        // See https://stackoverflow.com/a/65583947/7408927.
        view.setImplementationMode(PreviewView.ImplementationMode.COMPATIBLE);

        if (shouldFlipView(creationParams.overlaySettings)) mirrorPreview();

        LifecycleOwner lifecycleOwner = this;
        Camera.InitializationCallbacks initializationCallbacks = this;
        Camera.init(
                context,
                lifecycleOwner,
                mainThreadExecutor,
                createPreviewAndAnalysisUseCaseGroup(view, backgroundExecutor, scanner),
                getCameraSelector(creationParams.overlaySettings),
                initializationCallbacks
        );
    }

    @SuppressLint("NewApi")
    private void mirrorPreview() {
        view.getPreviewStreamState().observe(this, new Observer<PreviewView.StreamState>() {
            @Override
            public void onChanged(PreviewView.StreamState streamState) {
                if (streamState == PreviewView.StreamState.STREAMING) view.setScaleX(-1F);
            }
        });
    }

    @SuppressLint("NewApi")
    private CameraSelector getCameraSelector(OverlaySettings settings) {
        if (settings.useFrontCamera) {
            return CameraSelector.DEFAULT_FRONT_CAMERA;
        } else {
            return CameraSelector.DEFAULT_BACK_CAMERA;
        }
    }

    private boolean shouldFlipView(OverlaySettings settings) {
        return settings.useFrontCamera && settings.flipFrontCamera;
    }

    @SuppressLint("NewApi")
    UseCaseGroup createPreviewAndAnalysisUseCaseGroup(
            PreviewView view,
            Executor analysisExecutor,
            ImageAnalysis.Analyzer analyzer
    ) {
        Preview previewUseCase = new Preview.Builder()
                .setTargetAspectRatio(AspectRatio.RATIO_16_9)
                .build();
        previewUseCase.setSurfaceProvider(view.getSurfaceProvider());

        ImageAnalysis imageAnalysisUseCase = new ImageAnalysis.Builder()
                .setBackpressureStrategy(ImageAnalysis.STRATEGY_KEEP_ONLY_LATEST)
                .setOutputImageFormat(ImageAnalysis.OUTPUT_IMAGE_FORMAT_RGBA_8888)
                // actual resolution selected by CameraX may differ, but it will be close to it
                .setTargetResolution(new Size(1920, 1080))
                .build();
        imageAnalysisUseCase.setAnalyzer(analysisExecutor, analyzer);

        return new UseCaseGroup.Builder()
                .addUseCase(previewUseCase)
                .addUseCase(imageAnalysisUseCase)
                .build();
    }

    @NonNull
    @Override
    public View getView() {
        return view;
    }

    @Override
    public void dispose() {
        lifecycleRegistry.handleLifecycleEvent(Lifecycle.Event.ON_DESTROY);
        scanner.dispose();
        backgroundExecutor.shutdown();
    }

    @NonNull
    @Override
    public Lifecycle getLifecycle() {
        return lifecycleRegistry;
    }

    @Override
    public void onBoundToLifecycle() {
        lifecycleRegistry.handleLifecycleEvent(Lifecycle.Event.ON_CREATE);
        lifecycleRegistry.handleLifecycleEvent(Lifecycle.Event.ON_START);
        lifecycleRegistry.handleLifecycleEvent(Lifecycle.Event.ON_RESUME);
    }

    @Override
    public void onFirstSideScanned() {
        sendToMethodChannel("onFirstSideScanned", null);
    }

    @Override
    public void onDetectionStatusUpdated(final DetectionStatus detectionStatus) {
        sendToMethodChannel(
                "onDetectionStatusUpdate",
                String.format("{\"%s\": \"%s\"}", "detectionStatus", detectionStatus.name())
        );
    }

    @Override
    public void onScanned(final String result) {
        sendToMethodChannel("onFinishScanning", result);
    }

    @Override
    public void onError(final Throwable throwable) {
        sendToMethodChannel("onError", throwable.toString());
    }

    private void sendToMethodChannel(final String method, @Nullable final Object argument) {
        mainThreadExecutor.execute(
                new Runnable() {
                    @Override
                    public void run() {
                        methodChannel.invokeMethod(method, argument);
                    }
                }
        );
    }
}
