package com.microblink.blinkid.flutter

@Suppress("UNCHECKED_CAST")
class MicroblinkCreationParams constructor(args: Map<String, Any?>) {
    val overlaySettings: OverlaySettings
    val licenseKey: String
    val recognizerCollection: Map<String?, Any>

    init {
        overlaySettings = OverlaySettings(
            args["overlaySettings"] as? Map<String, Any?> ?: mapOf(),
            OverlaySettings(
                useFrontCamera = false,
                flipFrontCamera = false
            )
        )
        licenseKey = args["licenseKey"] as String
        recognizerCollection = args["recognizerCollection"] as Map<String?, Any>
    }
}