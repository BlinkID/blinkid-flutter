package com.microblink.flutter;

import android.annotation.SuppressLint;
import android.content.Context;

import androidx.camera.core.CameraSelector;
import androidx.camera.core.UseCaseGroup;
import androidx.camera.lifecycle.ProcessCameraProvider;
import androidx.lifecycle.LifecycleOwner;

import com.google.common.util.concurrent.ListenableFuture;

import java.util.concurrent.ExecutionException;
import java.util.concurrent.Executor;

public final class Camera {
    private Camera() {
    }

    @SuppressLint("NewApi")
    public static void init(
            Context context,
            final LifecycleOwner lifecycleOwner,
            Executor mainThreadExecutor,
            final UseCaseGroup useCaseGroup,
            final CameraSelector cameraSelector,
            final Camera.InitializationCallbacks callbacks
    ) {
        final ListenableFuture<ProcessCameraProvider> processCameraProviderFuture =
                ProcessCameraProvider.getInstance(context);

        processCameraProviderFuture.addListener(new Runnable() {
            @Override
            public void run() {
                try {
                    ProcessCameraProvider cameraProvider = processCameraProviderFuture.get();

                    cameraProvider.unbindAll();
                    cameraProvider.bindToLifecycle(lifecycleOwner, cameraSelector, useCaseGroup);

                    callbacks.onBoundToLifecycle();
                } catch (ExecutionException | InterruptedException e) {
                    callbacks.onError(e); // This should never be reached.
                }
            }
        }, mainThreadExecutor);
    }

    interface InitializationCallbacks {
        void onBoundToLifecycle();

        void onError(Throwable throwable);
    }
}
