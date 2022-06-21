package com.microblink.flutter;

import androidx.annotation.NonNull;

import java.util.Map;

public class OverlaySettings {
    Boolean useFrontCamera = false;
    Boolean flipFrontCamera = false;

    public OverlaySettings(Map<String, Object> args){
        this.useFrontCamera = (Boolean) args.get("useFrontCamera");
        this.flipFrontCamera = (Boolean) args.get("flipFrontCamera");
    }

}
