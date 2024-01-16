package com.microblink.blinkid.flutter

import android.app.Activity
import android.content.Context
import android.content.Intent
import com.microblink.blinkid.MicroblinkSDK
import com.microblink.blinkid.entities.recognizers.RecognizerBundle
import com.microblink.blinkid.flutter.overlays.OverlaySettingsSerializers
import com.microblink.blinkid.flutter.recognizers.RecognizerSerializers
import com.microblink.blinkid.intent.IntentDataTransferMode
import com.microblink.blinkid.uisettings.ActivityRunner
import com.microblink.blinkid.uisettings.UISettings
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.FlutterPlugin.FlutterPluginBinding
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.PluginRegistry.ActivityResultListener
import io.flutter.plugin.common.PluginRegistry.Registrar
import org.json.JSONObject

class BlinkIDFlutterPlugin : FlutterPlugin, MethodChannel.MethodCallHandler, ActivityResultListener, ActivityAware {
    private var mRecognizerBundle: RecognizerBundle? = null
    private var channel: MethodChannel? = null
    private var context: Context? = null
    private var activity: Activity? = null
    private var pendingResult: MethodChannel.Result? = null
    private var flutterPluginBinding: FlutterPluginBinding? = null
    override fun onAttachedToEngine(binding: FlutterPluginBinding) {
        flutterPluginBinding = binding
        setupPlugin(
            binding.applicationContext,
            binding.binaryMessenger
        )
    }

    private fun setupPlugin(context: Context?, messenger: BinaryMessenger) {
        if (context != null) {
            this.context = context
        }
        channel = MethodChannel(messenger, CHANNEL)
        channel!!.setMethodCallHandler(this)
    }

    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        setLicense(call.argument<Any>(ARG_LICENSE) as Map<*, *>?)
        if (call.method == METHOD_SCAN) {
            pendingResult = result
            val jsonOverlaySettings = JSONObject(call.argument<Any>(ARG_OVERLAY_SETTINGS) as Map<*, *>?)
            val jsonRecognizerCollection = JSONObject(call.argument<Any>(ARG_RECOGNIZER_COLLECTION) as Map<*, *>?)
            mRecognizerBundle = RecognizerSerializers.INSTANCE.deserializeRecognizerCollection(jsonRecognizerCollection)
            val uiSettings =
                OverlaySettingsSerializers.INSTANCE.getOverlaySettings(context, jsonOverlaySettings, mRecognizerBundle)
            startScanning(SCAN_REQ_CODE, uiSettings)
        } else {
            result.notImplemented()
        }
    }

    private fun setLicense(licenseMap: Map<*, *>?) {
        MicroblinkSDK.setShowTrialLicenseWarning(licenseMap!!.getOrDefault(ARG_SHOW_LICENSE_WARNING, true) as Boolean)
        val licenseKey = licenseMap[ARG_LICENSE_KEY] as String?
        val licensee = licenseMap.getOrDefault(ARG_LICENSEE, null) as String?
        if (licensee == null) {
            MicroblinkSDK.setLicenseKey(licenseKey!!, context!!)
        } else {
            MicroblinkSDK.setLicenseKey(licenseKey!!, licensee, context!!)
        }
        MicroblinkSDK.setIntentDataTransferMode(IntentDataTransferMode.PERSISTED_OPTIMISED)
    }

    private fun startScanning(requestCode: Int, uiSettings: UISettings<*>) {
        if (context is Activity) {
            ActivityRunner.startActivityForResult((context as Activity?)!!, requestCode, uiSettings)
        } else if (activity != null) {
            ActivityRunner.startActivityForResult(activity!!, requestCode, uiSettings)
        } else {
            pendingResult!!.error("Context can't be casted to Activity", null, null)
        }
    }

    override fun onDetachedFromActivity() {}
    override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
        onAttachedToActivity(binding)
    }

    override fun onAttachedToActivity(binding: ActivityPluginBinding) {
        activity = binding.activity
        binding.addActivityResultListener(this)
        flutterPluginBinding!!.platformViewRegistry.registerViewFactory(
            "MicroblinkScannerView",
            MicroblinkScannerViewFactory(flutterPluginBinding!!.binaryMessenger, binding)
        )
    }

    override fun onDetachedFromActivityForConfigChanges() {}
    override fun onDetachedFromEngine(binding: FlutterPluginBinding) {
        context = null
        activity = null
        channel!!.setMethodCallHandler(null)
        channel = null
    }

    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?): Boolean {
        if (pendingResult == null) {
            return true
        }
        if (resultCode == Activity.RESULT_OK) {
            if (requestCode == SCAN_REQ_CODE && mRecognizerBundle != null) {
                mRecognizerBundle!!.loadFromIntent(data!!)
                val resultList = RecognizerSerializers.INSTANCE.serializeRecognizerResults(
                    mRecognizerBundle!!.recognizers
                )
                pendingResult!!.success(resultList.toString())
            }
        } else if (resultCode == Activity.RESULT_CANCELED) {
            pendingResult!!.success("null")
        } else {
            pendingResult!!.error("Unexpected error", null, null)
        }
        pendingResult = null
        return true
    }

    companion object {
        private const val CHANNEL = "blinkid_scanner"
        private const val SCAN_REQ_CODE = 1904
        private const val METHOD_SCAN = "scanWithCamera"
        private const val ARG_LICENSE = "license"
        private const val ARG_LICENSE_KEY = "licenseKey"
        private const val ARG_LICENSEE = "licensee"
        private const val ARG_SHOW_LICENSE_WARNING = "showTimeLimitedLicenseKeyWarning"
        private const val ARG_RECOGNIZER_COLLECTION = "recognizerCollection"
        private const val ARG_OVERLAY_SETTINGS = "overlaySettings"

        // This static function is optional and equivalent to onAttachedToEngine. It supports the old
        // pre-Flutter-1.12 Android projects.
        fun registerWith(registrar: Registrar) {
            val plugin = BlinkIDFlutterPlugin()
            plugin.setupPlugin(registrar.activity(), registrar.messenger())
            registrar.addActivityResultListener(plugin)
        }
    }
}
