package com.microblink.flutter;


import java.util.Map;

public class MicroblinkCreationParams {
    OverlaySettings overlaySettings;
    String licenseKey;
    Map<String, Object> recognizerCollection;

    public MicroblinkCreationParams(Map<String, Object> args) {
        this.overlaySettings = new OverlaySettings((Map<String, Object>) args.get("overlaySettings"));
        this.licenseKey = (String) args.get("licenseKey");
        this.recognizerCollection = (Map<String, Object>) args.get("recognizerCollection");
    }
}

