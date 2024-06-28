package com.microblink.blinkid.flutter

class OverlaySettings {
    val useFrontCamera: Boolean
    val flipFrontCamera: Boolean

    constructor(args: Map<String, Any?>, defaultSettings: OverlaySettings) {
        useFrontCamera = args["useFrontCamera"] as Boolean? ?: defaultSettings.useFrontCamera
        flipFrontCamera = args["flipFrontCamera"] as Boolean? ?: defaultSettings.flipFrontCamera
    }

    constructor(useFrontCamera: Boolean, flipFrontCamera: Boolean) {
        this.useFrontCamera = useFrontCamera
        this.flipFrontCamera = flipFrontCamera
    }

}