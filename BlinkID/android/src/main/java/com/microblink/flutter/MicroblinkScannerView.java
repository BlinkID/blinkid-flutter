package com.microblink.flutter;

import android.content.Context;
import android.graphics.Rect;
import android.view.View;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;

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
import io.flutter.embedding.engine.plugins.lifecycle.HiddenLifecycleReference;
import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.platform.PlatformView;


class MicroblinkScannerView implements PlatformView {
    MicroblinkScannerView(@NonNull Context context, int id, @Nullable Map<String, Object> creationParams, BinaryMessenger messenger, ActivityPluginBinding activityPluginBinding) {
        methodChannel = new MethodChannel(messenger, "MicroblinkScannerWidget/" + id);

        MicroblinkSDK.setLicenseKey((String) creationParams.get("licenseKey"), activityPluginBinding.getActivity());

        recognizerRunnerView = new RecognizerRunnerView(activityPluginBinding.getActivity());

        recognizerBundle = getRecognizerBundle(creationParams);

        recognizerRunnerView.setRecognizerBundle(recognizerBundle);
        recognizerRunnerView.setScanResultListener(scanResultListener);
        recognizerRunnerView.setCameraEventsListener(cameraEventsListener);
        recognizerRunnerView.setLifecycle(((HiddenLifecycleReference) activityPluginBinding.getLifecycle()).getLifecycle());
    }

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
            // this method is from CameraEventsListener and will be called when camera preview stops
        }

        @Override
        public void onError(Throwable exc) {
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
    }
}
