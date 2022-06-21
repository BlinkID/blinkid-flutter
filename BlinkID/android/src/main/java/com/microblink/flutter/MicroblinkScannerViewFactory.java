package com.microblink.flutter;

import android.content.Context;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;

import java.util.Map;

import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding;
import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.common.StandardMessageCodec;
import io.flutter.plugin.platform.PlatformView;
import io.flutter.plugin.platform.PlatformViewFactory;

class MicroblinkScannerViewFactory extends PlatformViewFactory {
    private final BinaryMessenger messenger;
    private final ActivityPluginBinding activityPluginBinding;

    MicroblinkScannerViewFactory(BinaryMessenger messenger,
                                 ActivityPluginBinding activityPluginBinding) {
        super(StandardMessageCodec.INSTANCE);

        this.messenger = messenger;
        this.activityPluginBinding = activityPluginBinding;
    }

    @NonNull
    @Override
    public PlatformView create(@NonNull Context context, int id, @Nullable Object args) {
        return new MicroblinkScannerView(
                context,
                id,
                new MicroblinkCreationParams((Map<String, Object>) args),
                messenger,
                activityPluginBinding
        );
    }
}
