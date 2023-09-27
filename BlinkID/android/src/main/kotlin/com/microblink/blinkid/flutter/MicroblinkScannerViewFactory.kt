package com.microblink.blinkid.flutter

import android.content.Context
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.StandardMessageCodec
import io.flutter.plugin.platform.PlatformView
import io.flutter.plugin.platform.PlatformViewFactory

internal class MicroblinkScannerViewFactory(
    private val messenger: BinaryMessenger,
    private val activityPluginBinding: ActivityPluginBinding
) : PlatformViewFactory(StandardMessageCodec.INSTANCE) {
    override fun create(context: Context, id: Int, args: Any?): PlatformView {
        return MicroblinkScannerView(
            context,
            id,
            MicroblinkCreationParams((args as Map<String?, Any?>?)!!),
            messenger,
            activityPluginBinding
        )
    }
}