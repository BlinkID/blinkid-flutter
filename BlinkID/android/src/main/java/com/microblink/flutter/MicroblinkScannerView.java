package com.microblink.flutter;

import android.content.Context;
import android.graphics.Rect;
import android.view.View;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.lifecycle.DefaultLifecycleObserver;
import androidx.lifecycle.Lifecycle;
import androidx.lifecycle.LifecycleObserver;
import androidx.lifecycle.LifecycleOwner;
import androidx.lifecycle.LifecycleRegistry;

import com.microblink.MicroblinkSDK;
import com.microblink.entities.recognizers.RecognizerBundle;
import com.microblink.flutter.recognizers.RecognizerSerializers;
import com.microblink.recognition.RecognitionSuccessType;
import com.microblink.view.CameraEventsListener;
import com.microblink.view.recognition.RecognizerRunnerView;
import com.microblink.view.recognition.ScanResultListener;

import org.json.JSONArray;
import org.json.JSONObject;

import java.util.Map;

import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding;
import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.platform.PlatformView;


class MicroblinkScannerView implements PlatformView, LifecycleOwner {
    MicroblinkScannerView(@NonNull Context context, int id, @Nullable Map<String, Object> creationParams, BinaryMessenger messenger, ActivityPluginBinding activityPluginBinding) {
        methodChannel = new MethodChannel(messenger, "MicroblinkScannerWidget/" + id);

        MicroblinkSDK.setLicenseKey((String) creationParams.get("licenseKey"), activityPluginBinding.getActivity());

        recognizerBundle = getRecognizerBundle(creationParams);

        recognizerRunnerView = new RecognizerRunnerView(activityPluginBinding.getActivity());

        lifecycleRegistry = new LifecycleRegistry(this);

        recognizerRunnerView.setRecognizerBundle(recognizerBundle);

        recognizerRunnerView.setScanResultListener(scanResultListener);
        recognizerRunnerView.setCameraEventsListener(cameraEventsListener);

        recognizerRunnerView.setLifecycle(lifecycleRegistry);

        lifecycleRegistry.handleLifecycleEvent(Lifecycle.Event.ON_CREATE);
        lifecycleRegistry.handleLifecycleEvent(Lifecycle.Event.ON_START);
        lifecycleRegistry.handleLifecycleEvent(Lifecycle.Event.ON_RESUME);
    }

    private final LifecycleRegistry lifecycleRegistry;
    private final MethodChannel methodChannel;
    private final RecognizerRunnerView recognizerRunnerView;
    private final RecognizerBundle recognizerBundle;

    private final ScanResultListener scanResultListener = new ScanResultListener() {
        @Override
        public void onScanningDone(@NonNull RecognitionSuccessType recognitionSuccessType) {
            JSONArray resultJsonArray = RecognizerSerializers.INSTANCE.serializeRecognizerResults(recognizerBundle.getRecognizers());

            methodChannel.invokeMethod("onFinishScanning", resultJsonArray.toString());
        }

        @Override
        public void onUnrecoverableError(@NonNull Throwable throwable) {
        }
    };

    private final CameraEventsListener cameraEventsListener = new CameraEventsListener() {
        @Override
        public void onCameraPreviewStarted() {
        }

        @Override
        public void onCameraPreviewStopped() {
        }

        @Override
        public void onError(@NonNull Throwable throwable) {
        }

        @Override
        public void onCameraPermissionDenied() {
        }

        @Override
        public void onAutofocusFailed() {
        }

        @Override
        public void onAutofocusStarted(Rect[] areas) {
        }

        @Override
        public void onAutofocusStopped(Rect[] areas) {
        }
    };

    private RecognizerBundle getRecognizerBundle(Map<String, Object> creationParams) {
        JSONObject jsonRecognizerCollection = new JSONObject((Map) creationParams.get("recognizerCollection"));

        return RecognizerSerializers.INSTANCE.deserializeRecognizerCollection(jsonRecognizerCollection);
    }

    @NonNull
    @Override
    public View getView() {
        return recognizerRunnerView;
    }

    @Override
    public void dispose() {
        lifecycleRegistry.handleLifecycleEvent(Lifecycle.Event.ON_DESTROY);
    }

    @NonNull
    @Override
    public Lifecycle getLifecycle() {
        return lifecycleRegistry;
    }
}
