package com.microblink.blinkid.flutter.overlays.serialization;

import android.content.Context;

import com.microblink.blinkid.entities.recognizers.RecognizerBundle;
import com.microblink.blinkid.fragment.overlay.blinkid.legacy.documentverification.LegacyDocumentVerificationOverlayStrings;
import com.microblink.blinkid.uisettings.LegacyDocumentVerificationUISettings;
import com.microblink.blinkid.uisettings.UISettings;
import com.microblink.blinkid.flutter.overlays.OverlaySettingsSerialization;

import org.json.JSONObject;

import static com.microblink.blinkid.flutter.SerializationUtils.getStringFromJSONObject;

public final class DocumentVerificationOverlaySettingsSerialization implements OverlaySettingsSerialization {
    @Override
    public UISettings createUISettings(Context context, JSONObject jsonUISettings, RecognizerBundle recognizerBundle) {
        LegacyDocumentVerificationUISettings settings = new LegacyDocumentVerificationUISettings(recognizerBundle);
        OverlaySerializationUtils.extractCommonUISettings(jsonUISettings, settings);

        LegacyDocumentVerificationOverlayStrings.Builder overlasStringsBuilder = new LegacyDocumentVerificationOverlayStrings.Builder(context);
        String firstSideSplashMessage = getStringFromJSONObject(jsonUISettings, "firstSideSplashMessage");
        if (firstSideSplashMessage != null) {
            overlasStringsBuilder.setFrontSideSplashText(firstSideSplashMessage);
        }
        String secondSideSplashMessage = getStringFromJSONObject(jsonUISettings, "secondSideSplashMessage");
        if (secondSideSplashMessage != null) {
            overlasStringsBuilder.setBackSideSplashText(secondSideSplashMessage);
        }
        String firstSideInstructions = getStringFromJSONObject(jsonUISettings, "firstSideInstructions");
        if (firstSideInstructions != null) {
            overlasStringsBuilder.setFrontSideInstructions(firstSideInstructions);
        }
        String secondSideInstructions = getStringFromJSONObject(jsonUISettings, "secondSideInstructions");
        if (secondSideInstructions != null) {
            overlasStringsBuilder.setBackSideInstructions(secondSideInstructions);
        }
        String glareMessage = getStringFromJSONObject(jsonUISettings, "glareMessage");
        if (glareMessage != null) {
            overlasStringsBuilder.setGlareMessage(glareMessage);
        }
        settings.setStrings(overlasStringsBuilder.build());

        return settings;
    }

    @Override
    public String getJsonName() {
        return "DocumentVerificationOverlaySettings";
    }
}