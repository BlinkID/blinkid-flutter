package com.microblink.blinkid.flutter

import android.graphics.Bitmap
import android.util.Base64
import com.microblink.blinkid.entities.recognizers.Recognizer
import com.microblink.blinkid.entities.recognizers.blinkid.imageoptions.extension.ImageExtensionFactors
import com.microblink.blinkid.geometry.Point
import com.microblink.blinkid.geometry.Quadrilateral
import com.microblink.blinkid.image.Image
import com.microblink.blinkid.results.date.Date
import com.microblink.blinkid.results.date.SimpleDate
import org.json.JSONArray
import org.json.JSONException
import org.json.JSONObject
import java.io.ByteArrayOutputStream
import java.io.IOException

//import com.microblink.blinkid.entities.parsers.Parser;
object SerializationUtils {
    private const val COMPRESSED_IMAGE_QUALITY = 90
    @JvmStatic
    @Throws(JSONException::class)
    fun <T : Recognizer.Result?> addCommonRecognizerResultData(jsonObject: JSONObject, result: T) {
        jsonObject.put("resultState", serializeEnum(result!!.resultState))
    }

    /*public static <T extends Parser.Result> void addCommonParserResultData(JSONObject jsonObject, T result) throws JSONException {
        jsonObject.put("resultState", serializeEnum(result.getResultState()));
    }*/
    @JvmStatic
    @Throws(JSONException::class)
    fun serializeSimpleDate(date: SimpleDate?): JSONObject? {
        return if (date != null) {
            val jsonDate = JSONObject()
            jsonDate.put("day", date.day)
            jsonDate.put("month", date.month)
            jsonDate.put("year", date.year)
            jsonDate
        } else {
            null
        }
    }

    @JvmStatic
    @Throws(JSONException::class)
    fun serializeDate(dateResult: Date?): JSONObject? {
        return if (dateResult == null) {
            null
        } else {
            serializeSimpleDate(dateResult.date)
        }
    }

    @JvmStatic
    fun serializeEnum(e: Enum<*>): Int {
        return e.ordinal
    }

    @JvmStatic
    fun serializeStringArray(strings: Array<String?>): JSONArray {
        val jsonStrings = JSONArray()
        for (str in strings) {
            jsonStrings.put(str)
        }
        return jsonStrings
    }

    @JvmStatic
    fun encodeImageBase64(image: Image?): String? {
        if (image == null) {
            return null
        }
        val resultImgBmp = image.convertToBitmap() ?: return null
        val byteArrayOutputStream = ByteArrayOutputStream()
        val success = resultImgBmp.compress(Bitmap.CompressFormat.JPEG, COMPRESSED_IMAGE_QUALITY, byteArrayOutputStream)
        var resultImgBase64: String? = null
        if (success) {
            resultImgBase64 = Base64.encodeToString(byteArrayOutputStream.toByteArray(), Base64.NO_WRAP)
        }
        try {
            byteArrayOutputStream.close()
        } catch (ignorable: IOException) {
        }
        return resultImgBase64
    }

    @JvmStatic
    fun encodeByteArrayToBase64(arr: ByteArray?): String? {
        return if (arr == null) {
            null
        } else Base64.encodeToString(arr, Base64.NO_WRAP)
    }

    @Throws(JSONException::class)
    fun serializePoint(point: Point): JSONObject {
        val jsonPoint = JSONObject()
        jsonPoint.put("x", point.x.toDouble())
        jsonPoint.put("y", point.y.toDouble())
        return jsonPoint
    }

    @JvmStatic
    @Throws(JSONException::class)
    fun serializeQuad(quad: Quadrilateral): JSONObject {
        val jsonQuad = JSONObject()
        jsonQuad.put("upperLeft", serializePoint(quad.upperLeft))
        jsonQuad.put("upperRight", serializePoint(quad.upperRight))
        jsonQuad.put("lowerLeft", serializePoint(quad.lowerLeft))
        jsonQuad.put("lowerRight", serializePoint(quad.lowerRight))
        return jsonQuad
    }

    @JvmStatic
    fun getStringFromJSONObject(map: JSONObject, key: String?): String? {
        var value = map.optString(key, null)
        if ("null" == value) {
            value = null
        }
        return value
    }

    @JvmStatic
    fun deserializeExtensionFactors(jsonExtensionFactors: JSONObject?): ImageExtensionFactors {
        return if (jsonExtensionFactors == null) {
            ImageExtensionFactors(0f, 0f, 0f, 0f)
        } else {
            val up = jsonExtensionFactors.optDouble("upFactor", 0.0).toFloat()
            val right = jsonExtensionFactors.optDouble("rightFactor", 0.0).toFloat()
            val down = jsonExtensionFactors.optDouble("downFactor", 0.0).toFloat()
            val left = jsonExtensionFactors.optDouble("leftFactor", 0.0).toFloat()
            ImageExtensionFactors(up, down, left, right)
        }
    }
}