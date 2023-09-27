package com.microblink.blinkid.flutter

class OverlaySettings(args: Map<String?, Any?>) {
    @JvmField
    var useFrontCamera: Boolean? = false
    @JvmField
    var flipFrontCamera: Boolean? = false

    init {
        useFrontCamera = args["useFrontCamera"] as Boolean?
        flipFrontCamera = args["flipFrontCamera"] as Boolean?
    }
}