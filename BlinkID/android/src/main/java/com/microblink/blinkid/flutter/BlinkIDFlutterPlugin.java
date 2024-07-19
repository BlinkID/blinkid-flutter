package com.microblink.blinkid.flutter;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import androidx.annotation.NonNull;
import android.util.Base64;
import java.util.*;

import io.flutter.embedding.engine.plugins.activity.ActivityAware;
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding;
import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.PluginRegistry;
import io.flutter.plugin.common.PluginRegistry.Registrar;

import com.microblink.blinkid.MicroblinkSDK;
import com.microblink.blinkid.entities.recognizers.Recognizer;
import com.microblink.blinkid.entities.recognizers.RecognizerBundle;
import com.microblink.blinkid.intent.IntentDataTransferMode;
import com.microblink.blinkid.uisettings.UISettings;
import com.microblink.blinkid.uisettings.ActivityRunner;
import com.microblink.blinkid.locale.LanguageUtils;
import com.microblink.blinkid.directApi.DirectApiErrorListener;
import com.microblink.blinkid.directApi.RecognizerRunner;
import com.microblink.blinkid.entities.recognizers.RecognizerBundle;
import com.microblink.blinkid.hardware.orientation.Orientation;
import com.microblink.blinkid.metadata.MetadataCallbacks;
import com.microblink.blinkid.metadata.recognition.FirstSideRecognitionCallback;
import com.microblink.blinkid.recognition.RecognitionSuccessType;
import com.microblink.blinkid.view.recognition.ScanResultListener;
import com.microblink.blinkid.licence.exception.LicenceKeyException;

import com.microblink.blinkid.flutter.recognizers.RecognizerSerializers;
import com.microblink.blinkid.flutter.overlays.OverlaySettingsSerializers;

import org.json.JSONException;
import org.json.JSONObject;
import org.json.JSONArray;


public class BlinkIDFlutterPlugin implements FlutterPlugin, MethodCallHandler, PluginRegistry.ActivityResultListener, ActivityAware {

  private static final String CHANNEL = "blinkid_scanner";

  private static final int SCAN_REQ_CODE = 1904;
  private static final String METHOD_SCAN_CAMERA = "scanWithCamera";
  private static final String METHOD_SCAN_DIRECT_API = "scanWithDirectApi";

  private static final String ARG_LICENSE = "license";
  private static final String ARG_LICENSE_KEY = "licenseKey";
  private static final String ARG_LICENSEE = "licensee";
  private static final String ARG_SHOW_LICENSE_WARNING = "showTimeLimitedLicenseKeyWarning";
  private static final String ARG_RECOGNIZER_COLLECTION = "recognizerCollection";
  private static final String ARG_OVERLAY_SETTINGS = "overlaySettings";
  private static final String ARG_FRONT_IMAGE = "frontImage";
  private static final String ARG_BACK_IMAGE = "backImage";
  private boolean mFirstSideScanned = false;
  private RecognizerBundle mRecognizerBundle;
  private RecognizerRunner mRecognizerRunner;

  private MethodChannel channel;
  private Context context;
  private Activity activity;

  private Result pendingResult;

  // This static function is optional and equivalent to onAttachedToEngine. It supports the old
  // pre-Flutter-1.12 Android projects.
  public static void registerWith(Registrar registrar) {
    final BlinkIDFlutterPlugin plugin = new BlinkIDFlutterPlugin();
    plugin.setupPlugin(registrar.activity(), registrar.messenger());
    registrar.addActivityResultListener(plugin);
  }

  @Override
  public void onAttachedToEngine(@NonNull FlutterPluginBinding binding) {
      setupPlugin(
              binding.getApplicationContext(),
              binding.getBinaryMessenger()
      );
  }

  private void setupPlugin(Context context, BinaryMessenger messenger) {
    if (context != null) {
      this.context = context;
    }

    this.channel = new MethodChannel(messenger, CHANNEL);
    this.channel.setMethodCallHandler(this);
  }

  @Override
  public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {

    if (call.method.equals(METHOD_SCAN_CAMERA)) {
      pendingResult = result;
      boolean isLicenseKeyValid = setLicense((Map)call.argument(ARG_LICENSE));

      JSONObject jsonOverlaySettings = new JSONObject((Map)call.argument(ARG_OVERLAY_SETTINGS));
      JSONObject jsonRecognizerCollection = new JSONObject((Map)call.argument(ARG_RECOGNIZER_COLLECTION));
      if (isLicenseKeyValid) {
          setLanguage(jsonOverlaySettings);
          mRecognizerBundle = RecognizerSerializers.INSTANCE.deserializeRecognizerCollection(jsonRecognizerCollection);
          UISettings uiSettings = OverlaySettingsSerializers.INSTANCE.getOverlaySettings(context, jsonOverlaySettings, mRecognizerBundle);
          startScanning(SCAN_REQ_CODE, uiSettings);
      }
    } else if (call.method.equals(METHOD_SCAN_DIRECT_API)) {
        pendingResult = result;
        boolean isLicenseKeyValid = setLicense((Map)call.argument(ARG_LICENSE));

        JSONObject jsonRecognizerCollection = new JSONObject((Map)call.argument(ARG_RECOGNIZER_COLLECTION));
        String frontImage = call.argument(ARG_FRONT_IMAGE);
        String backImage = call.argument(ARG_BACK_IMAGE);
        if (isLicenseKeyValid) {
            scanWithDirectApi(jsonRecognizerCollection, frontImage, backImage);
        }

    } else {
      result.notImplemented();
    }
  }


  @SuppressWarnings("unchecked")
  private boolean setLicense(Map licenseMap) {
      boolean isLicenseKeyValid = true;
      if (licenseMap.get(ARG_SHOW_LICENSE_WARNING) != null) {
          MicroblinkSDK.setShowTrialLicenseWarning((boolean) licenseMap.get(ARG_SHOW_LICENSE_WARNING));
      } else {
          MicroblinkSDK.setShowTrialLicenseWarning(true);
      }

      String licenseKey = (String) licenseMap.get(ARG_LICENSE_KEY);
      String licensee = (String) licenseMap.get(ARG_LICENSEE);

      if (licensee == null) {
          try {
              MicroblinkSDK.setLicenseKey(licenseKey, context);
          } catch (LicenceKeyException licenceKeyException) {
              isLicenseKeyValid = false;
              pendingResult.error("Android license key error", licenceKeyException.getMessage(), null);
          }
      } else {
          try {
              MicroblinkSDK.setLicenseKey(licenseKey, licensee, context);
          } catch (LicenceKeyException licenceKeyException) {
              isLicenseKeyValid = false;
              pendingResult.error("Android license key error", licenceKeyException.getMessage(), null);
          }
      }
      MicroblinkSDK.setIntentDataTransferMode(IntentDataTransferMode.PERSISTED_OPTIMISED);
      return isLicenseKeyValid;
  }

  private void setLanguage(JSONObject jsonOverlaySettings) {
      try {
          LanguageUtils.setLanguageAndCountry(jsonOverlaySettings.getString("language"),
                  jsonOverlaySettings.getString("country"),
                  context);
      } catch (Exception e) {}
  }

  private void startScanning(int requestCode, UISettings uiSettings) {
      if (context instanceof Activity) {
          ActivityRunner.startActivityForResult(((Activity) context), requestCode, uiSettings);
      } else if (activity != null) {
          ActivityRunner.startActivityForResult(activity, requestCode, uiSettings);
      } else {
          pendingResult.error("Context can't be casted to Activity", null, null);
      }
  }

  private void scanWithDirectApi(JSONObject jsonRecognizerCollection, String frontImage, String backImage) {
      ScanResultListener mScanResultListenerBackSide = new ScanResultListener() {
          @Override
          public void onScanningDone(@NonNull RecognitionSuccessType recognitionSuccessType) {
              mFirstSideScanned = false;
              handleDirectApiResult(recognitionSuccessType);
          }
          @Override
          public void onUnrecoverableError(@NonNull Throwable throwable) {
            handleDirectApiError(throwable.getMessage());
          }
      };

      FirstSideRecognitionCallback mFirstSideRecognitionCallback = new FirstSideRecognitionCallback() {
          @Override
          public void onFirstSideRecognitionFinished() {
              mFirstSideScanned = true;
          }
      };

      ScanResultListener mScanResultListenerFrontSide = new ScanResultListener() {
          @Override
          public void onScanningDone(@NonNull RecognitionSuccessType recognitionSuccessType) {
              if (mFirstSideScanned) {
                  //multiside recognizer used
                  if (!backImage.isEmpty() && backImage != null) {
                      processImage(backImage, mScanResultListenerBackSide);
                  } else if (recognitionSuccessType != RecognitionSuccessType.UNSUCCESSFUL) {
                      handleDirectApiResult(recognitionSuccessType);
                  } else {
                      handleDirectApiError("Could not extract the information from the front side and back side is empty!");
                  }
              } else if (!mFirstSideScanned && recognitionSuccessType != RecognitionSuccessType.UNSUCCESSFUL){
                  //singleside recognizer used
                  handleDirectApiResult(recognitionSuccessType);
              } else {
                  mFirstSideScanned = false;
                  handleDirectApiError("Could not extract the information with DirectAPI!");
              }
          }
          @Override
          public void onUnrecoverableError(@NonNull Throwable throwable) {
            handleDirectApiError(throwable.getMessage());
          }
      };

      setupRecognizerRunner(jsonRecognizerCollection, mFirstSideRecognitionCallback);

      if (!frontImage.isEmpty()) {
          processImage(frontImage, mScanResultListenerFrontSide);
      } else {
          handleDirectApiError("The provided image for the 'frontImage' parameter is empty!");
      }
  }

    private void setupRecognizerRunner(JSONObject jsonRecognizerCollection, FirstSideRecognitionCallback mFirstSideRecognitionCallback) {
      if (mRecognizerRunner != null) {
          mRecognizerRunner.terminate();
      }
      mRecognizerBundle = RecognizerSerializers.INSTANCE.deserializeRecognizerCollection(jsonRecognizerCollection);
      try {
          mRecognizerRunner = RecognizerRunner.getSingletonInstance();
      } catch (Exception e) {
          handleDirectApiError("DirectAPI not supported: " + e);
      }

      MetadataCallbacks metadataCallbacks = new MetadataCallbacks();
      metadataCallbacks.setFirstSideRecognitionCallback(mFirstSideRecognitionCallback);
      mRecognizerRunner.setMetadataCallbacks(metadataCallbacks);
      mRecognizerRunner.initialize(context, mRecognizerBundle, throwable -> handleDirectApiError("Failed to initialize recognizer with DirectAPI: " + throwable.getMessage()));
    }

    private void processImage(String base64Image, ScanResultListener scanResultListener) {
        Bitmap image = base64ToBitmap(base64Image);
        if (image != null) {
            mRecognizerRunner.recognizeBitmap(
                    base64ToBitmap(base64Image),
                    Orientation.ORIENTATION_LANDSCAPE_RIGHT,
                    scanResultListener
            );
        } else {
            handleDirectApiError("Could not decode the Base64 image!");
        }
    }

    private void handleDirectApiResult(RecognitionSuccessType recognitionSuccessType) {
        if (recognitionSuccessType != RecognitionSuccessType.UNSUCCESSFUL) {
            if (pendingResult == null) {
                return;
            }
            JSONArray resultList = RecognizerSerializers.INSTANCE.serializeRecognizerResults(mRecognizerBundle.getRecognizers());
            pendingResult.success(resultList.toString());
        }
        pendingResult = null;
    }
    private Bitmap base64ToBitmap(String base64String) {
        byte[] decodedBytes = android.util.Base64.decode(base64String, Base64.DEFAULT);
        return BitmapFactory.decodeByteArray(decodedBytes, 0, decodedBytes.length);
    }

    private void handleDirectApiError(String errorMessage) {
        pendingResult.error("", errorMessage, null);
        if (mRecognizerRunner != null) {
            mRecognizerRunner.resetRecognitionState(true);
        }
    }

  @Override
  public void onDetachedFromActivity() {}

  @Override
  public void onReattachedToActivityForConfigChanges(ActivityPluginBinding binding) {
      onAttachedToActivity(binding);
  }

  @Override
  public void onAttachedToActivity(ActivityPluginBinding binding) {
      activity = binding.getActivity();
      binding.addActivityResultListener(this);
  }

  @Override
  public void onDetachedFromActivityForConfigChanges() {}

  @Override
  public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
    this.context = null;
    this.activity = null;

    this.channel.setMethodCallHandler(null);
    this.channel = null;
  }


  @Override
  public boolean onActivityResult(int requestCode, int resultCode, Intent data) {
      if (pendingResult == null) {
          return true;
      }
      
      if (resultCode == Activity.RESULT_OK) {
          if (requestCode == SCAN_REQ_CODE  && mRecognizerBundle != null) {
              mRecognizerBundle.loadFromIntent(data);
              JSONArray resultList = RecognizerSerializers.INSTANCE.serializeRecognizerResults(mRecognizerBundle.getRecognizers());

              pendingResult.success(resultList.toString());

          }


      } else if (resultCode == Activity.RESULT_CANCELED) {
          pendingResult.success("null");

      } else {
          pendingResult.error("Unexpected error", null, null);
      }

      pendingResult = null;
      return true;
  }
}