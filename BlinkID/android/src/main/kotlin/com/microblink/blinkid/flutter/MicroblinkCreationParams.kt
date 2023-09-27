package com.microblink.blinkid.flutter

class MicroblinkCreationParams(args: Map<String?, Any?>) {
    @JvmField
    var overlaySettings: OverlaySettings
    @JvmField
    var licenseKey: String?
    @JvmField
    var recognizerCollection: Map<String, Any>?

    init {
        overlaySettings = OverlaySettings(args["overlaySettings"] as Map<String?, Any?>)
        licenseKey = args["licenseKey"] as String?
        recognizerCollection = args["recognizerCollection"] as Map<String, Any>?
    }
}