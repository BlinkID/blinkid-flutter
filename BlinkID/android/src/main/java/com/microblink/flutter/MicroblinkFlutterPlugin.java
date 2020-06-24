package com.microblink.flutter;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import androidx.annotation.NonNull;
import java.util.*;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.PluginRegistry;
import io.flutter.plugin.common.PluginRegistry.Registrar;

import com.microblink.MicroblinkSDK;
import com.microblink.entities.recognizers.Recognizer;
import com.microblink.entities.recognizers.blinkid.generic.*;
import com.microblink.entities.recognizers.RecognizerBundle;
import com.microblink.intent.IntentDataTransferMode;
import com.microblink.uisettings.UISettings;
import com.microblink.uisettings.BlinkIdUISettings;
import com.microblink.uisettings.ActivityRunner;

import com.microblink.flutter.recognizers.RecognizerSerializers;
import com.microblink.flutter.overlays.OverlaySettingsSerializers;

import org.json.JSONException;
import org.json.JSONObject;
import org.json.JSONArray;


public class MicroblinkFlutterPlugin implements FlutterPlugin, MethodCallHandler, PluginRegistry.ActivityResultListener {

  private static final String CHANNEL = "microblink_scanner";

  private static final int SCAN_REQ_CODE = 1904;
  private static final String METHOD_SCAN = "scanWithCamera";

  private static final String ARG_LICENSE = "license";
  private static final String ARG_LICENSE_KEY = "licenseKey";
  private static final String ARG_LICENSEE = "licensee";
  private static final String ARG_SHOW_LICENSE_WARNING = "showTimeLimitedLicenseKeyWarning";
  private static final String ARG_RECOGNIZER_COLLECTION = "recognizerCollection";
  private static final String ARG_OVERLAY_SETTINGS = "overlaySettings";

  private RecognizerBundle mRecognizerBundle;

  private MethodChannel channel;
  private Context context;

  private Result pendingResult;

  public static void registerWith(Registrar registrar) {
    final MicroblinkFlutterPlugin plugin = new MicroblinkFlutterPlugin();
    plugin.setupPlugin(registrar.activity(), registrar.messenger());
    registrar.addActivityResultListener(plugin);
  }

  @Override
  public void onAttachedToEngine(@NonNull FlutterPluginBinding binding) {
      // not used
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
    setLicense((Map)call.argument(ARG_LICENSE));

    if (call.method.equals(METHOD_SCAN)) {
      pendingResult = result;

      JSONObject jsonOverlaySettings = new JSONObject((Map)call.argument(ARG_OVERLAY_SETTINGS));
      JSONObject jsonRecognizerCollection = new JSONObject((Map)call.argument(ARG_RECOGNIZER_COLLECTION));

      mRecognizerBundle = RecognizerSerializers.INSTANCE.deserializeRecognizerCollection(jsonRecognizerCollection);
      UISettings uiSettings = OverlaySettingsSerializers.INSTANCE.getOverlaySettings(context, jsonOverlaySettings, mRecognizerBundle);

      startScanning(context, SCAN_REQ_CODE, uiSettings);

    } else {
      result.notImplemented();
    }
  }


  @SuppressWarnings("unchecked")
  private void setLicense(Map licenseMap) {
      MicroblinkSDK.setShowTimeLimitedLicenseWarning((boolean)licenseMap.getOrDefault(ARG_SHOW_LICENSE_WARNING, true));

      String licenseKey = (String)licenseMap.get(ARG_LICENSE_KEY);
      String licensee = (String)licenseMap.getOrDefault(ARG_LICENSEE, null);

      if (licensee == null) {
          MicroblinkSDK.setLicenseKey(licenseKey, context);
      } else {
          MicroblinkSDK.setLicenseKey(licenseKey, licensee, context);
      }

      MicroblinkSDK.setIntentDataTransferMode(IntentDataTransferMode.PERSISTED_OPTIMISED);
  }

  private void startScanning(Context context, int requestCode, UISettings uiSettings) {
      if (context instanceof Activity) {
          ActivityRunner.startActivityForResult(((Activity) context), requestCode, uiSettings);
      } else {
          pendingResult.error("Context can't be casted to Activity", null, null);
      }
  }

  @Override
  public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
    this.context = null;

    this.channel.setMethodCallHandler(null);
    this.channel = null;
  }


  @Override
  public boolean onActivityResult(int requestCode, int resultCode, Intent data) {
      if (resultCode == Activity.RESULT_OK) {
          if (requestCode == SCAN_REQ_CODE) {
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

