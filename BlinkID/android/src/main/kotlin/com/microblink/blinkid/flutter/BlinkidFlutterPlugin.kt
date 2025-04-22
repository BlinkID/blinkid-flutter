package com.microblink.blinkid.flutter

import android.app.Activity
import android.content.Context
import android.content.Intent
import com.microblink.blinkid.core.BlinkIdSdk
import com.microblink.blinkid.core.session.BlinkIdProcessResult
import com.microblink.blinkid.ux.contract.BlinkIdScanActivityResultStatus
import com.microblink.blinkid.ux.contract.BlinkIdScanActivitySettings
import com.microblink.blinkid.ux.contract.MbBlinkIdScan
import com.microblink.core.LicenseLockedException
import com.microblink.core.image.InputImage
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.plugin.common.PluginRegistry.ActivityResultListener
import kotlinx.coroutines.*

/** BlinkidFlutterPlugin */
class BlinkidFlutterPlugin() : FlutterPlugin, MethodCallHandler, ActivityAware,
    ActivityResultListener {

    private lateinit var channel: MethodChannel
    private lateinit var context: Context

    private var flutterPluginActivity: Activity? = null
    private var flutterResult: Result? = null

    override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        channel = MethodChannel(flutterPluginBinding.binaryMessenger, "blinkid_flutter")
        channel.setMethodCallHandler(this)
        context = flutterPluginBinding.applicationContext
    }

    override fun onMethodCall(call: MethodCall, result: Result) {
        flutterResult = result
        when (call.method) {
            "performScan" -> (performScan(call, result))
            "performDirectApiScan" -> {
                CoroutineScope(Dispatchers.Main).launch {
                    performDirectApiScan(call)
                }
            }

            else -> {
                result.notImplemented()
            }
        }
    }


    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }

    private fun performScan(call: MethodCall, result: Result) {
        try {
            val blinkIdSdkSettings = call.argument<Map<String, Any>>("blinkidSdkSettings")
            val blinkidSessionSettings = call.argument<Map<String, Any>>("blinkidSessionSettings")
            val classFilterMap = call.argument<Map<String, Any>>("blinkidClassFilter")
            val sdkSettings = BlinkidDeserializationUtils
                .deserializeBlinkidSdkSettings(blinkIdSdkSettings)
                ?: return result.error("", "Incorrect SDK Settings", null)

            flutterPluginActivity?.let {
                val intent = MbBlinkIdScan().createIntent(
                    it,
                    BlinkIdScanActivitySettings(
                        sdkSettings = sdkSettings,
                        scanningSessionSettings = BlinkidDeserializationUtils.deserializeBlinkidSessionSettings(
                            blinkidSessionSettings,
                            false
                        ),
                        uxSettings = BlinkidDeserializationUtils.deserializeBlinkidUxSettings(
                            blinkidSessionSettings,
                            classFilterMap
                        )
                    )
                )
                it.startActivityForResult(intent, 100)
            } ?: result.error("blinkid_android", "Activity not found", null)
        } catch (error: Exception) {
            when (error) {
                is LicenseLockedException -> {
                    result.error("blinkid_android", error.message, null)
                }

                else -> {
                    result.error("blinkid_android", error.message, null)
                }
            }
        }
    }

    private suspend fun performDirectApiScan(call: MethodCall) {
        try {
            val blinkIdSdkSettings = call.argument<Map<String, Any>>("blinkidSdkSettings")
            val blinkidSessionSettings = call.argument<Map<String, Any>>("blinkidSessionSettings")
            val firstImage = call.argument<String>("firstImage")
            val secondImage = call.argument<String>("secondImage")

            BlinkidDeserializationUtils.deserializeBlinkidSdkSettings(blinkIdSdkSettings)?.let {
                val blinkidInstance = BlinkIdSdk.initializeSdk(context, it)

                when {
                    blinkidInstance.isSuccess -> {

                        blinkidInstance.getOrNull()?.let { instance ->
                            val session = instance.createScanningSession(
                                BlinkidDeserializationUtils.deserializeBlinkidSessionSettings(
                                    blinkidSessionSettings,
                                    true
                                )
                            )
                            var result: kotlin.Result<BlinkIdProcessResult>? = null

                            firstImage?.let { firstImageBase64 ->
                                BlinkidDeserializationUtils.base64ToBitmap(firstImageBase64)
                                    ?.let { image ->
                                        result = session.process(InputImage.createFromBitmap(image))
                                    }
                            }

                            secondImage?.let { secondImageBase64 ->
                                BlinkidDeserializationUtils.base64ToBitmap(secondImageBase64)
                                    ?.let { image ->
                                        result = session.process(InputImage.createFromBitmap(image))
                                    }
                            }

                            if (result?.isSuccess == true) {
                                val scanningResult = session.getResult()
                                flutterResult?.success(
                                    BlinkidSerializationUtils.serializeBlinkIdScanningResult(
                                        scanningResult
                                    )
                                )
                            } else {
                                flutterResult?.error(
                                    "blinkid_android",
                                    "Could not get the results.",
                                    null
                                )
                            }
                            instance.close()
                        }
                    }

                    blinkidInstance.isFailure -> {
                        flutterResult?.error(
                            "blinkid_android",
                            blinkidInstance.exceptionOrNull()?.message,
                            null
                        )
                    }

                    else -> {
                        flutterResult?.error(
                            "blinkid_android",
                            "Could not initialize the SDK.",
                            null
                        )
                    }
                }

            }

        } catch (error: Exception) {
            flutterResult?.error("blinkid_android", error.message, null)
        }
    }

    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?): Boolean {
        if (requestCode == 100) {

            val blinkIdResult = MbBlinkIdScan().parseResult(resultCode, data)
            when (blinkIdResult.status) {

                BlinkIdScanActivityResultStatus.DocumentScanned -> {
                    blinkIdResult.result?.let { scanningResult ->
                        val success = BlinkidSerializationUtils.serializeBlinkIdScanningResult(
                            scanningResult
                        )
                        flutterResult?.success(success)

                    } ?: flutterResult?.error("blinkid_android", "BlinkID result is empty.", null)
                }

                BlinkIdScanActivityResultStatus.Canceled -> {
                    flutterResult?.error("blinkid_android", "Scanning is canceled.", null)
                }

                BlinkIdScanActivityResultStatus.ErrorSdkInit -> {
                    flutterResult?.error(
                        "blinkid_android",
                        "Could not initialize the SDK.",
                        null
                    )
                }
            }
        }
        return true
    }

    override fun onAttachedToActivity(binding: ActivityPluginBinding) {
        flutterPluginActivity = binding.activity
        binding.addActivityResultListener { requestCode, resultCode, data ->
            onActivityResult(requestCode, resultCode, data)
            true
        }
    }

    override fun onDetachedFromActivityForConfigChanges() {
        flutterPluginActivity = null
    }

    override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
        flutterPluginActivity = binding.activity
    }

    override fun onDetachedFromActivity() {
        flutterPluginActivity = null
    }
}