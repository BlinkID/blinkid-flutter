package com.microblink.flutter;

import android.graphics.Bitmap;
import android.util.Base64;

import com.microblink.entities.recognizers.Recognizer;
//import com.microblink.entities.parsers.Parser;
import com.microblink.geometry.Point;
import com.microblink.geometry.Quadrilateral;
import com.microblink.image.Image;
import com.microblink.results.date.Date;
import com.microblink.results.date.DateResult;
import com.microblink.entities.Entity;
import com.microblink.entities.recognizers.blinkid.imageoptions.extension.ImageExtensionFactors;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.io.ByteArrayOutputStream;
import java.io.IOException;

import androidx.annotation.Nullable;

public abstract class SerializationUtils {
    private static final int COMPRESSED_IMAGE_QUALITY = 90;

    public static <T extends Recognizer.Result> void addCommonRecognizerResultData(JSONObject jsonObject, T result) throws JSONException {
        jsonObject.put("resultState", serializeEnum(result.getResultState()));
    }

    /*public static <T extends Parser.Result> void addCommonParserResultData(JSONObject jsonObject, T result) throws JSONException {
        jsonObject.put("resultState", serializeEnum(result.getResultState()));
    }*/

    public static JSONObject serializeDate( @Nullable  Date date ) throws JSONException {
        if (date != null ) {
            JSONObject jsonDate = new JSONObject();
            jsonDate.put("day", date.getDay());
            jsonDate.put("month", date.getMonth());
            jsonDate.put("year", date.getYear());
            return jsonDate;
        } else {
            return null;
        }
    }

    public static JSONObject serializeDate(@Nullable DateResult dateResult) throws JSONException {
        if (dateResult == null) {
            return null;
        } else {
            return serializeDate(dateResult.getDate());
        }
    }

    public static int serializeEnum(Enum e) {
        return e.ordinal();
    }

    public static JSONArray serializeStringArray(String[] strings) {
        JSONArray jsonStrings = new JSONArray();
        for (String str : strings) {
            jsonStrings.put(str);
        }
        return jsonStrings;
    }

    public static String encodeImageBase64(Image image) {
        if (image == null) {
            return null;
        }
        Bitmap resultImgBmp = image.convertToBitmap();
        if (resultImgBmp == null) {
            return null;
        }
        ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
        boolean success = resultImgBmp.compress(Bitmap.CompressFormat.JPEG, COMPRESSED_IMAGE_QUALITY, byteArrayOutputStream);
        String resultImgBase64 = null;
        if (success) {
            resultImgBase64 = Base64.encodeToString(byteArrayOutputStream.toByteArray(), Base64.NO_WRAP);
        }
        try {
            byteArrayOutputStream.close();
        } catch (IOException ignorable) {}
        return resultImgBase64;
    }

    public static String encodeByteArrayToBase64(byte[] arr) {
        if (arr == null) {
            return null;
        }
        return Base64.encodeToString(arr, Base64.NO_WRAP);
    }

    public static JSONObject serializePoint(Point point) throws JSONException {
        JSONObject jsonPoint = new JSONObject();
        jsonPoint.put("x", point.getX());
        jsonPoint.put("y", point.getY());
        return jsonPoint;
    }

    public static JSONObject serializeQuad(Quadrilateral quad) throws JSONException {
        JSONObject jsonQuad = new JSONObject();
        jsonQuad.put("upperLeft", serializePoint(quad.getUpperLeft()));
        jsonQuad.put("upperRight", serializePoint(quad.getUpperRight()));
        jsonQuad.put("lowerLeft", serializePoint(quad.getLowerLeft()));
        jsonQuad.put("lowerRight", serializePoint(quad.getLowerRight()));
        return jsonQuad;
    }

    public static String getStringFromJSONObject(JSONObject map, String key) {
        String value = map.optString(key, null);
        if ("null".equals(value)) {
            value = null;
        }
        return value;
    }

    public static ImageExtensionFactors deserializeExtensionFactors(JSONObject jsonExtensionFactors) {
        if (jsonExtensionFactors == null) {
            return new ImageExtensionFactors(0.f, 0.f, 0.f, 0.f);
        } else {
            float up = (float)jsonExtensionFactors.optDouble("upFactor", 0.0);
            float right = (float)jsonExtensionFactors.optDouble("rightFactor", 0.0);
            float down = (float)jsonExtensionFactors.optDouble("downFactor", 0.0);
            float left = (float)jsonExtensionFactors.optDouble("leftFactor", 0.0);
            return new ImageExtensionFactors(up, down, left, right);
        }
    }

}