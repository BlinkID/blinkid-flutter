package com.microblink.blinkid_flutter.overlays;

import android.content.Context;

import com.microblink.entities.recognizers.RecognizerBundle;
import com.microblink.uisettings.UISettings;

import org.json.JSONObject;

public interface OverlaySettingsSerialization {

    UISettings createUISettings(Context context, JSONObject jsonUISettings, RecognizerBundle recognizerBundle);

    String getJsonName();
}
