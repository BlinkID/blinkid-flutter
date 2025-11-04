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
import com.microblink.core.ping.PingManager
import com.microblink.core.ping.pinglets.WrapperProductInfo
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
    private val BLINKID_LOAD_SDK = "loadBlinkIdSdk"
    private val BLINKID_UNLOAD_SDK = "unloadBlinkIdSdk"
    private val BLINKID_REQUEST_CODE = 1452
    private val BLINKID_ERROR_RESULT_CODE = "blinkid_android_error"
    private var blinkIdSdk: BlinkIdSdk? = null
    private var isSdkLoaded: Boolean = false

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
            BLINKID_LOAD_SDK -> (CoroutineScope(Dispatchers.Main).launch { loadBlinkIdSdk(call, result) })
            BLINKID_UNLOAD_SDK -> (unloadBlinkIdSdk(call, result))
            BLINKID_METHOD_PERFORM_SCAN -> (performScan(call, result))
            BLINKID_METHOD_PERFORM_DIRECTAPI_SCAN -> { CoroutineScope(Dispatchers.Main).launch { performDirectApiScan(call, result) }
            }
            else -> {
                result.notImplemented()
            }
        }
    }


    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }

    private suspend fun loadBlinkIdSdk(call: MethodCall, result: Result) {
        try {
            ensureLoadedSdk(call)
            result.success(true)
        } catch (error: Exception) {
            result.error(BLINKID_ERROR_RESULT_CODE, error.message, null)
        }
    }

    private fun unloadBlinkIdSdk(call: MethodCall, result: Result) {
        try {
            val deleteCachedResources = call.argument<Boolean>("deleteCachedResources")
            deleteCachedResources?.let {
                if (it) {
                    BlinkIdSdk.sdkInstance?.closeAndDeleteCachedAssets()
                } else {
                    BlinkIdSdk.sdkInstance?.close()
                }
                blinkIdSdk = null
                result.success("")
            }
        } catch (exception: Exception) {
            result.error(BLINKID_ERROR_RESULT_CODE, exception.message, null)
        }

    }

    private suspend fun ensureLoadedSdk(call: MethodCall): BlinkIdSdk? {

            blinkIdSdk?.let { return it }

            val blinkIdSdkSettings = call.argument<Map<String, Any>>("blinkidSdkSettings")
            val sdkSettings = BlinkIdDeserializationUtils
                .deserializeBlinkIdSdkSettings(blinkIdSdkSettings)?: throw IllegalStateException("Incorrect SDK Settings.")

            flutterPluginActivity?.let {
                val maybeInstance = BlinkIdSdk.initializeSdk(it, sdkSettings)
                when {
                    maybeInstance.isSuccess -> {
                        blinkIdSdk = maybeInstance.getOrNull()
                        return blinkIdSdk
                    }

                    maybeInstance.isFailure -> {
                        blinkIdSdk = null
                        isSdkLoaded = false
                        throw maybeInstance.exceptionOrNull() ?: IllegalStateException("SDK initialization failed.")
                    }
                }
            }?: throw IllegalStateException("Activity not available.")

        return null
    }

    private fun performScan(call: MethodCall, result: Result) {
        try {
            val blinkIdSdkSettings = call.argument<Map<String, Any>>("blinkidSdkSettings")
            val blinkidSessionSettings = call.argument<Map<String, Any>>("blinkidSessionSettings")
            val blinkIdScanningUxSettings = call.argument<Map<String, Any>>("blinkIdScanningUxSettings")
            val classFilterMap = call.argument<Map<String, Any>>("blinkidClassFilter")
            val sdkSettings = BlinkIdDeserializationUtils
                .deserializeBlinkIdSdkSettings(blinkIdSdkSettings)
                ?: return result.error(BLINKID_ERROR_RESULT_CODE, "Incorrect SDK Settings.", null)

            flutterPluginActivity?.let {
                val intent = MbBlinkIdScan().createIntent(
                    it,
                    BlinkIdScanActivitySettings(
                        sdkSettings = sdkSettings,
                        cameraSettings = BlinkIdDeserializationUtils.deserializeCameraSettings(blinkIdScanningUxSettings),
                        scanningSessionSettings = BlinkIdDeserializationUtils.deserializeBlinkIdSessionSettings(
                            blinkidSessionSettings,
                            false
                        ),
                        uxSettings = BlinkIdDeserializationUtils.deserializeBlinkIdUxSettings(
                            blinkidUxSettingsMap = blinkIdScanningUxSettings,
                            classFilterMap
                        ),
                        showOnboardingDialog = (blinkIdScanningUxSettings?.getOrDefault("showOnboardingDialog", true) as? Boolean) ?: true,
                        showHelpButton = (blinkIdScanningUxSettings?.getOrDefault("showHelpButton", true) as? Boolean) ?: true,
                    )
                )

                addFlutterPinglet(context)

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

    private suspend fun performDirectApiScan(call: MethodCall, result: Result) {
        try {
            val blinkidSessionSettings = call.argument<Map<String, Any>>("blinkidSessionSettings")
            val firstImage = call.argument<String>("firstImage")
            val secondImage = call.argument<String>("secondImage")
            blinkIdSdk = ensureLoadedSdk(call)
            blinkIdSdk?.let {
                addFlutterPinglet(context)

                    val session = it.createScanningSession(
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
                    it.close()
            }?: result.error(BLINKID_ERROR_RESULT_CODE, "The BlinkID SDK is not initialized. Call the loadBlinkIdSdk() method to pre-load the SDK first, or try running the performDirectApiScan() method with a valid internet connection.", null)
        } catch (error: Exception) {
            flutterResult?.error(BLINKID_ERROR_RESULT_CODE, error.message, null)
        }
    }

    private fun addFlutterPinglet(context: Context) {
        PingManager.getInstance(context).add(
            WrapperProductInfo(
                wrapperProduct = WrapperProductInfo.WrapperProduct.CROSSPLATFORMFLUTTER),
            0)
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
                    suspend {
                        BlinkIdSdk.sdkInstance?.close()
                    }
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