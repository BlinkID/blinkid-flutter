package com.microblink.flutter;

import android.content.Context;
import android.graphics.Rect;
import android.os.Handler;
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
import com.microblink.metadata.MetadataCallbacks;
import com.microblink.metadata.recognition.FirstSideRecognitionCallback;
import com.microblink.recognition.RecognitionSuccessType;
import com.microblink.util.RecognizerCompatibility;
import com.microblink.util.RecognizerCompatibilityStatus;
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
    MicroblinkScannerView(@NonNull final Context context, int id, @Nullable Map<String, Object> creationParams, BinaryMessenger messenger, ActivityPluginBinding activityPluginBinding) {
        methodChannel = new MethodChannel(messenger, "MicroblinkScannerWidget/" + id);

        checkSupportForBlinkId(activityPluginBinding.getActivity());

        MicroblinkSDK.setLicenseKey((String) creationParams.get("licenseKey"), activityPluginBinding.getActivity());

        recognizerBundle = getRecognizerBundle(creationParams);

        recognizerRunnerView = new RecognizerRunnerView(activityPluginBinding.getActivity());

        lifecycleRegistry = new LifecycleRegistry(this);

        recognizerRunnerView.setRecognizerBundle(recognizerBundle);

        recognizerRunnerView.setScanResultListener(createScanResultListener(context));
        recognizerRunnerView.setCameraEventsListener(cameraEventsListener);

        recognizerRunnerView.setLifecycle(lifecycleRegistry);
        MetadataCallbacks callbacks = new MetadataCallbacks();
        callbacks.setFirstSideRecognitionCallback(new FirstSideRecognitionCallback() {
            @Override
            public void onFirstSideRecognitionFinished() {
                Handler mainHandler = new Handler(context.getMainLooper());
                Runnable myRunnable = new Runnable() {
                    @Override
                    public void run() {
                        methodChannel.invokeMethod("onFirstSideRecognitionFinished", null);
                    }
                };
                mainHandler.post(myRunnable);
            }
        });
        recognizerRunnerView.setMetadataCallbacks(callbacks);

        lifecycleRegistry.handleLifecycleEvent(Lifecycle.Event.ON_CREATE);
        lifecycleRegistry.handleLifecycleEvent(Lifecycle.Event.ON_START);
        lifecycleRegistry.handleLifecycleEvent(Lifecycle.Event.ON_RESUME);
    }

    private final LifecycleRegistry lifecycleRegistry;
    private final MethodChannel methodChannel;
    private final RecognizerRunnerView recognizerRunnerView;
    private final RecognizerBundle recognizerBundle;

    private ScanResultListener createScanResultListener(final Context context) {
        return new ScanResultListener() {
        @Override
        public void onScanningDone(@NonNull RecognitionSuccessType recognitionSuccessType) {
            Handler mainHandler = new Handler(context.getMainLooper());
            Runnable myRunnable = new Runnable() {
                @Override
                public void run() {
                    JSONArray resultJsonArray = RecognizerSerializers.INSTANCE.serializeRecognizerResults(recognizerBundle.getRecognizers());
//                    sendMessage(resultJsonArray.toString());
                    methodChannel.invokeMethod("onFinishScanning", resultJsonArray.toString());
                }
            };
            mainHandler.post(myRunnable);
        }

        @Override
        public void onUnrecoverableError(@NonNull Throwable throwable) {
            sendMessage("onUnrecoverableError: " + throwable.toString());
        }
    };
    }

    private final CameraEventsListener cameraEventsListener = new CameraEventsListener() {
        @Override
        public void onCameraPreviewStarted() {
            sendMessage("onCameraPreviewStarted");
        }

        @Override
        public void onCameraPreviewStopped() {
            sendMessage("onCameraPreviewStopped");
        }

        @Override
        public void onError(@NonNull Throwable throwable) {
            sendMessage("onError " + throwable.toString());
        }

        @Override
        public void onCameraPermissionDenied() {
            sendMessage("onCameraPermissionDenied");
        }

        @Override
        public void onAutofocusFailed() {
            sendMessage("onAutofocusFailed");
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
        recognizerRunnerView.resumeScanning(true);

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
    
    private void sendMessage(String message) {
        methodChannel.invokeMethod("sendMessage", message);
    }
    
    private void checkSupportForBlinkId(Context context) {
        RecognizerCompatibilityStatus status = RecognizerCompatibility.getRecognizerCompatibilityStatus(context);
        
        if (status == RecognizerCompatibilityStatus.RECOGNIZER_SUPPORTED) {
            sendMessage("BlinkID is supported!");
        } else if (status == RecognizerCompatibilityStatus.NO_CAMERA) {
            sendMessage("BlinkID is supported only via Direct API!");
        } else if (status == RecognizerCompatibilityStatus.PROCESSOR_ARCHITECTURE_NOT_SUPPORTED) {
            sendMessage("BlinkID is not supported on current processor architecture!");
        } else {
            sendMessage("BlinkID is not supported! Reason: " + status.name());
        }
    }
}
