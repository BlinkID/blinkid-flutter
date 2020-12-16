package com.microblink.flutter.overlays.serialization;

import com.microblink.uisettings.UISettings;
import com.microblink.uisettings.options.BeepSoundUIOptions;
import com.microblink.flutter.R;

import org.json.JSONObject;

public abstract class OverlaySerializationUtils {
    public static void extractCommonUISettings(JSONObject jsonOverlaySettings, UISettings uiSettings) {
        if (uiSettings instanceof BeepSoundUIOptions) {
            if (jsonOverlaySettings.optBoolean("enableBeep", false)) {
                ((BeepSoundUIOptions)uiSettings).setBeepSoundResourceID(R.raw.beep);
            }
        }
    }
}
