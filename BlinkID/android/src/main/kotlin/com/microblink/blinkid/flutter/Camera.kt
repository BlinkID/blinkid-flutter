package com.microblink.blinkid.flutter

import android.annotation.SuppressLint
import android.content.Context
import androidx.camera.core.CameraSelector
import androidx.camera.core.CameraXConfig
import androidx.camera.core.UseCaseGroup
import androidx.camera.lifecycle.ExperimentalCameraProviderConfiguration
import androidx.camera.lifecycle.ProcessCameraProvider
import androidx.lifecycle.LifecycleOwner
import java.util.concurrent.ExecutionException
import java.util.concurrent.Executor

class Camera(
    context: Context,
    lifecycleOwner: LifecycleOwner,
    mainThreadExecutor: Executor,
    useCaseGroup: UseCaseGroup,
    cameraSelector: CameraSelector,
    callbacks: InitializationCallbacks
) {
    init {
        val processCameraProviderFuture = ProcessCameraProvider.getInstance(context)
        processCameraProviderFuture.addListener({
            try {
                val cameraProvider = processCameraProviderFuture.get()
                cameraProvider.unbindAll()
                cameraProvider.bindToLifecycle(lifecycleOwner, cameraSelector, useCaseGroup)
            } catch (e: ExecutionException) {
                callbacks.onError(e) // This should never be reached.
            } catch (e: InterruptedException) {
                callbacks.onError(e)
            }
        }, mainThreadExecutor)
    }

    interface InitializationCallbacks {
        fun onError(throwable: Throwable)
    }
}