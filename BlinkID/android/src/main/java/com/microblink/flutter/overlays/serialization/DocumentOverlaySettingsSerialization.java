package com.microblink.flutter.overlays.serialization;

import android.content.Context;

import com.microblink.entities.recognizers.RecognizerBundle;;
import com.microblink.uisettings.DocumentUISettings;
import com.microblink.uisettings.UISettings;
import com.microblink.flutter.overlays.OverlaySettingsSerialization;

import org.json.JSONObject;

public final class DocumentOverlaySettingsSerialization implements OverlaySettingsSerialization {
    @Override
    public UISettings createUISettings(Context context, JSONObject jsonUISettings, RecognizerBundle recognizerBundle) {
        DocumentUISettings settings = new DocumentUISettings(recognizerBundle);
        OverlaySerializationUtils.extractCommonUISettings(jsonUISettings, settings);
        return settings;
    }

    @Override
    public String getJsonName() {
        return "DocumentOverlaySettings";
    }
}