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
    private val BLINKID_METHOD_PERFORM_SCAN = "performScan"
    private val BLINKID_METHOD_PERFORM_DIRECTAPI_SCAN = "performDirectApiScan"
    private val BLINKID_REQUEST_CODE = 1452
    private val BLINKID_ERROR_RESULT_CODE = "blinkid_android_error"

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
            BLINKID_METHOD_PERFORM_SCAN -> (performScan(call, result))
            BLINKID_METHOD_PERFORM_DIRECTAPI_SCAN -> {
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
            val sdkSettings = BlinkIdDeserializationUtils
                .deserializeBlinkIdSdkSettings(blinkIdSdkSettings)
                ?: return result.error(BLINKID_ERROR_RESULT_CODE, "Incorrect SDK Settings.", null)

            flutterPluginActivity?.let {
                val intent = MbBlinkIdScan().createIntent(
                    it,
                    BlinkIdScanActivitySettings(
                        sdkSettings = sdkSettings,
                        scanningSessionSettings = BlinkIdDeserializationUtils.deserializeBlinkIdSessionSettings(
                            blinkidSessionSettings,
                            false
                        ),
                        uxSettings = BlinkIdDeserializationUtils.deserializeBlinkIdUxSettings(
                            blinkidSessionSettings,
                            classFilterMap
                        )
                    )
                )
                it.startActivityForResult(intent, BLINKID_REQUEST_CODE)
            } ?: result.error(BLINKID_ERROR_RESULT_CODE, "Activity not found.", null)
        } catch (error: Exception) {
            when (error) {
                is LicenseLockedException -> {
                    result.error(BLINKID_ERROR_RESULT_CODE, error.message, null)
                }

                else -> {
                    result.error(BLINKID_ERROR_RESULT_CODE, error.message, null)
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

            BlinkIdDeserializationUtils.deserializeBlinkIdSdkSettings(blinkIdSdkSettings)?.let {
                val blinkidInstance = BlinkIdSdk.initializeSdk(context, it)

                when {
                    blinkidInstance.isSuccess -> {

                        blinkidInstance.getOrNull()?.let { instance ->
                            val session = instance.createScanningSession(
                                BlinkIdDeserializationUtils.deserializeBlinkIdSessionSettings(
                                    blinkidSessionSettings,
                                    true
                                )
                            )
                            var result: kotlin.Result<BlinkIdProcessResult>? = null

                            firstImage?.let { firstImageBase64 ->
                                BlinkIdDeserializationUtils.base64ToBitmap(firstImageBase64)
                                    ?.let { image ->
                                        result = session.process(InputImage.createFromBitmap(image))
                                    }
                            }

                            secondImage?.let { secondImageBase64 ->
                                BlinkIdDeserializationUtils.base64ToBitmap(secondImageBase64)
                                    ?.let { image ->
                                        result = session.process(InputImage.createFromBitmap(image))
                                    }
                            }

                            if (result?.isSuccess == true) {
                                val scanningResult = session.getResult()
                                flutterResult?.success(
                                    BlinkIdSerializationUtils.serializeBlinkIdScanningResult(
                                        scanningResult
                                    )
                                )
                            } else {
                                flutterResult?.error(
                                    BLINKID_ERROR_RESULT_CODE,
                                    "Could not get the results.",
                                    null
                                )
                            }
                            instance.close()
                        }
                    }

                    blinkidInstance.isFailure -> {
                        flutterResult?.error(
                            BLINKID_ERROR_RESULT_CODE,
                            blinkidInstance.exceptionOrNull()?.message,
                            null
                        )
                    }

                    else -> {
                        flutterResult?.error(
                            BLINKID_ERROR_RESULT_CODE,
                            "Could not initialize the SDK.",
                            null
                        )
                    }
                }

            }

        } catch (error: Exception) {
            flutterResult?.error(BLINKID_ERROR_RESULT_CODE, error.message, null)
        }
    }

    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?): Boolean {
        if (requestCode == BLINKID_REQUEST_CODE) {

            val blinkIdResult = MbBlinkIdScan().parseResult(resultCode, data)
            when (blinkIdResult.status) {

                BlinkIdScanActivityResultStatus.DocumentScanned -> {
                    blinkIdResult.result?.let { scanningResult ->
                        val success = BlinkIdSerializationUtils.serializeBlinkIdScanningResult(
                            scanningResult
                        )
                        flutterResult?.success(success)

                    } ?: flutterResult?.error(BLINKID_ERROR_RESULT_CODE, "BlinkID result is empty.", null)
                }

                BlinkIdScanActivityResultStatus.Canceled -> {
                    flutterResult?.error(BLINKID_ERROR_RESULT_CODE, "Scanning is canceled.", null)
                }

                BlinkIdScanActivityResultStatus.ErrorSdkInit -> {
                    flutterResult?.error(
                        BLINKID_ERROR_RESULT_CODE,
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