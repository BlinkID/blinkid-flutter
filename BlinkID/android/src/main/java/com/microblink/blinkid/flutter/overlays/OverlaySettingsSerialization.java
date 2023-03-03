package com.microblink.blinkid.flutter.overlays;

import android.content.Context;

import com.microblink.blinkid.entities.recognizers.RecognizerBundle;
import com.microblink.blinkid.uisettings.UISettings;

import org.json.JSONObject;

public interface OverlaySettingsSerialization {

    UISettings createUISettings(Context context, JSONObject jsonUISettings, RecognizerBundle recognizerBundle);

    String getJsonName();
}