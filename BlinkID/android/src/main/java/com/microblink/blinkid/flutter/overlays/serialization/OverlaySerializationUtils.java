package com.microblink.blinkid.flutter.overlays.serialization;

import com.microblink.blinkid.uisettings.UISettings;
import com.microblink.blinkid.uisettings.options.BeepSoundUIOptions;
import com.microblink.blinkid.uisettings.CameraSettings;
import com.microblink.blinkid.hardware.camera.CameraType;
import com.microblink.blinkid.flutter.R;

import org.json.JSONObject;

public abstract class OverlaySerializationUtils {
    public static void extractCommonUISettings(JSONObject jsonOverlaySettings, UISettings uiSettings) {
        if (uiSettings instanceof BeepSoundUIOptions) {
            if (jsonOverlaySettings.optBoolean("enableBeep", false)) {
                ((BeepSoundUIOptions)uiSettings).setBeepSoundResourceID(R.raw.beep);
            }
        }

        if (jsonOverlaySettings.optBoolean("useFrontCamera", false)) {
            CameraSettings cameraSettings = new CameraSettings.Builder()
                    .setType(CameraType.CAMERA_FRONTFACE)
                    .build();
            uiSettings.setCameraSettings(cameraSettings);
        }
    }
}