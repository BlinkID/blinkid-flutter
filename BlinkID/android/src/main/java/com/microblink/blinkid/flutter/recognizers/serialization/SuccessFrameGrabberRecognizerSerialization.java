package com.microblink.blinkid.flutter.recognizers.serialization;

import com.microblink.blinkid.entities.recognizers.Recognizer;
import com.microblink.blinkid.entities.recognizers.successframe.SuccessFrameGrabberRecognizer;
import com.microblink.blinkid.flutter.recognizers.RecognizerSerialization;
import com.microblink.blinkid.flutter.recognizers.RecognizerSerializers;
import com.microblink.blinkid.flutter.SerializationUtils;

import org.json.JSONException;
import org.json.JSONObject;

public final class SuccessFrameGrabberRecognizerSerialization implements RecognizerSerialization {
    @Override
    public Recognizer<?> createRecognizer(JSONObject jsonRecognizer) {
        try {
            // first obtain slave recognizer
            JSONObject jsonSlaveRecognizer = jsonRecognizer.getJSONObject("slaveRecognizer");
            Recognizer<?> slaveRecognizer = RecognizerSerializers.INSTANCE.getRecognizerSerialization(jsonSlaveRecognizer).createRecognizer(jsonSlaveRecognizer);
            return new SuccessFrameGrabberRecognizer(slaveRecognizer);
        } catch (JSONException e) {
            // see https://developer.android.com/reference/org/json/JSONException
            throw new RuntimeException(e);
        }
    }

    @Override
    public JSONObject serializeResult(Recognizer<?> recognizer) {
        SuccessFrameGrabberRecognizer sfgr = (SuccessFrameGrabberRecognizer) recognizer;
        JSONObject jsonSlaveResult = RecognizerSerializers.INSTANCE.getRecognizerSerialization(sfgr.getSlaveRecognizer()).serializeResult(sfgr.getSlaveRecognizer());

        SuccessFrameGrabberRecognizer.Result result = sfgr.getResult();

        JSONObject jsonResult = new JSONObject();

        try {
            SerializationUtils.addCommonRecognizerResultData(jsonResult, result);
            jsonResult.put("slaveRecognizerResult", jsonSlaveResult);
            jsonResult.put("successFrame", SerializationUtils.encodeImageBase64(result.getSuccessFrame()));
        } catch (JSONException e) {
            // see https://developer.android.com/reference/org/json/JSONException
            throw new RuntimeException(e);
        }

        return jsonResult;
    }

    @Override
    public String getJsonName() {
        return "SuccessFrameGrabberRecognizer";
    }

    @Override
    public Class<?> getRecognizerClass() {
        return SuccessFrameGrabberRecognizer.class;
    }
}