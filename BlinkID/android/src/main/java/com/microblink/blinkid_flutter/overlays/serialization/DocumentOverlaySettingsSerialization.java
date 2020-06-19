package com.microblink.blinkid_flutter.overlays.serialization;

import android.content.Context;

import com.microblink.entities.recognizers.RecognizerBundle;;
import com.microblink.uisettings.DocumentUISettings;
import com.microblink.uisettings.UISettings;
import com.microblink.blinkid_flutter.overlays.OverlaySettingsSerialization;

import org.json.JSONObject;

public final class DocumentOverlaySettingsSerialization implements OverlaySettingsSerialization {
    @Override
    public UISettings createUISettings(Context context, JSONObject jsonUISettings, RecognizerBundle recognizerBundle) {
        // no settings deserialized at the moment
        return new DocumentUISettings(recognizerBundle);
    }

    @Override
    public String getJsonName() {
        return "DocumentOverlaySettings";
    }
}
