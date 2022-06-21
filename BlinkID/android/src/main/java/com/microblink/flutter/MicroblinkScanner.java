package com.microblink.flutter;

import android.annotation.SuppressLint;
import android.content.Context;
import android.graphics.Bitmap;

import androidx.annotation.NonNull;
import androidx.camera.core.ImageAnalysis;
import androidx.camera.core.ImageProxy;

import com.microblink.MicroblinkSDK;
import com.microblink.directApi.DirectApiErrorListener;
import com.microblink.directApi.RecognizerRunner;
import com.microblink.entities.recognizers.RecognizerBundle;
import com.microblink.flutter.recognizers.RecognizerSerializers;
import com.microblink.hardware.orientation.Orientation;
import com.microblink.intent.IntentDataTransferMode;
import com.microblink.metadata.MetadataCallbacks;
import com.microblink.metadata.detection.quad.DisplayableQuadDetection;
import com.microblink.metadata.detection.quad.QuadDetectionCallback;
import com.microblink.metadata.recognition.FirstSideRecognitionCallback;
import com.microblink.recognition.RecognitionSuccessType;
import com.microblink.view.recognition.DetectionStatus;
import com.microblink.view.recognition.ScanResultListener;

import org.json.JSONArray;
import org.json.JSONObject;

import java.util.Map;

public class MicroblinkScanner implements ImageAnalysis.Analyzer {
    private final RecognizerRunner recognizerRunner;
    private final RecognizerBundle recognizerBundle;
    private final MicroblinkScanner.Callbacks callbacks;

    MicroblinkScanner(
            Context context,
            MicroblinkCreationParams creationParams,
            MicroblinkScanner.Callbacks callbacks
    ) {
        setLicense(context, creationParams.licenseKey);

        this.callbacks = callbacks;
        recognizerBundle = createRecognizerBundle((Map<String, Object>) creationParams.recognizerCollection);
        recognizerRunner = createRecognizer(context, recognizerBundle);
        recognizerRunner.setMetadataCallbacks(createMetadataCallbacks(callbacks));
    }

    @SuppressLint("NewApi")
    @Override
    public void analyze(@NonNull ImageProxy image) {
        if (recognizerRunner.getCurrentState() == RecognizerRunner.State.READY) {
            byte[] rgbaBytes = new byte[image.getPlanes()[0].getBuffer().limit()];
            image.getPlanes()[0].getBuffer().get(rgbaBytes);
            Bitmap bitmap = bitmapFromRgba(rgbaBytes, image.getWidth(), image.getHeight());

            recognizerRunner.recognizeBitmap(bitmap, Orientation.ORIENTATION_LANDSCAPE_RIGHT,
                    createScanResultListener(image));
        } else {
            image.close();
        }
    }

    private ScanResultListener createScanResultListener(final ImageProxy imageProxy) {
        return new ScanResultListener() {
            @SuppressLint("NewApi")
            @Override
            public void onScanningDone(@NonNull RecognitionSuccessType recognitionSuccessType) {
                JSONArray resultJsonArray =
                        RecognizerSerializers.INSTANCE.serializeRecognizerResults(
                                recognizerBundle.getRecognizers());
                callbacks.onScanned(resultJsonArray.toString());
                imageProxy.close();
            }

            @Override
            public void onUnrecoverableError(@NonNull Throwable throwable) {
                callbacks.onError(throwable);
                recognizerRunner.resetRecognitionState();
            }
        };
    }

    private Bitmap bitmapFromRgba(byte[] bytes, int width, int height) {
        int[] colorPixels = new int[width * height];
        int j = 0;

        for (int i = 0; i < colorPixels.length; i++) {
            byte R = bytes[j++];
            byte G = bytes[j++];
            byte B = bytes[j++];
            byte A = bytes[j++];

            colorPixels[i] = (A & 0xff) << 24 | (R & 0xff) << 16 | (G & 0xff) << 8 | (B & 0xff);
        }

        Bitmap bitmap = Bitmap.createBitmap(width, height, Bitmap.Config.ARGB_8888);
        bitmap.setPixels(colorPixels, 0, width, 0, 0, width, height);
        return bitmap;
    }

    private void setLicense(Context context, String licenseKey) {
        MicroblinkSDK.setShowTrialLicenseWarning(false);
        MicroblinkSDK.setLicenseKey(licenseKey, context);
        MicroblinkSDK.setIntentDataTransferMode(IntentDataTransferMode.PERSISTED_OPTIMISED);
    }

    private RecognizerBundle createRecognizerBundle(Map<String, Object> recognizerCollection) {
        JSONObject jsonRecognizerCollection = new JSONObject(
                recognizerCollection);

        return RecognizerSerializers.INSTANCE.deserializeRecognizerCollection(
                jsonRecognizerCollection);
    }

    private RecognizerRunner createRecognizer(Context context, RecognizerBundle recognizerBundle) {
        RecognizerRunner recognizerRunner = RecognizerRunner.getSingletonInstance();

        recognizerRunner.initialize(context, recognizerBundle, new DirectApiErrorListener() {
            @Override
            public void onRecognizerError(@NonNull Throwable throwable) {
                callbacks.onError(throwable);
            }
        });

        return recognizerRunner;
    }

    private MetadataCallbacks createMetadataCallbacks(final MicroblinkScanner.Callbacks callbacks) {
        MetadataCallbacks metadataCallbacks = new MetadataCallbacks();

        metadataCallbacks.setQuadDetectionCallback(new QuadDetectionCallback() {
            @Override
            public void onQuadDetection(
                    final @NonNull DisplayableQuadDetection displayableQuadDetection) {
                callbacks.onDetectionStatusUpdated(displayableQuadDetection.getDetectionStatus());
            }
        });

        metadataCallbacks.setFirstSideRecognitionCallback(new FirstSideRecognitionCallback() {
            @Override
            public void onFirstSideRecognitionFinished() {
                callbacks.onFirstSideScanned();
            }
        });

        return metadataCallbacks;
    }

    public void dispose() {
        recognizerRunner.terminate();
    }

    interface Callbacks {
        void onFirstSideScanned();

        void onDetectionStatusUpdated(DetectionStatus detectionStatus);

        void onScanned(String result);

        void onError(Throwable throwable);
    }
}
