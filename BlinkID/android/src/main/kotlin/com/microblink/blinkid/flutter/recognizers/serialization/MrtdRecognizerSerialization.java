package com.microblink.blinkid.flutter.recognizers.serialization;

import com.microblink.blinkid.entities.recognizers.Recognizer;
import com.microblink.blinkid.flutter.recognizers.RecognizerSerialization;
import com.microblink.blinkid.flutter.SerializationUtils;

import org.json.JSONException;
import org.json.JSONObject;

public final class MrtdRecognizerSerialization implements RecognizerSerialization {

    @Override
    public Recognizer<?> createRecognizer(JSONObject jsonObject) {
        com.microblink.blinkid.entities.recognizers.blinkid.mrtd.MrtdRecognizer recognizer = new com.microblink.blinkid.entities.recognizers.blinkid.mrtd.MrtdRecognizer();
        recognizer.setAllowSpecialCharacters(jsonObject.optBoolean("allowSpecialCharacters", false));
        recognizer.setAllowUnparsedResults(jsonObject.optBoolean("allowUnparsedResults", false));
        recognizer.setAllowUnverifiedResults(jsonObject.optBoolean("allowUnverifiedResults", false));
        recognizer.setDetectGlare(jsonObject.optBoolean("detectGlare", true));
        recognizer.setFullDocumentImageDpi(jsonObject.optInt("fullDocumentImageDpi", 250));
        recognizer.setFullDocumentImageExtensionFactors(SerializationUtils.deserializeExtensionFactors(jsonObject.optJSONObject("fullDocumentImageExtensionFactors")));
        recognizer.setReturnFullDocumentImage(jsonObject.optBoolean("returnFullDocumentImage", false));
        return recognizer;
    }

    @Override
    public JSONObject serializeResult(Recognizer<?> recognizer) {
        com.microblink.blinkid.entities.recognizers.blinkid.mrtd.MrtdRecognizer.Result result = ((com.microblink.blinkid.entities.recognizers.blinkid.mrtd.MrtdRecognizer)recognizer).getResult();
        JSONObject jsonResult = new JSONObject();
        try {
            SerializationUtils.addCommonRecognizerResultData(jsonResult, result);
            jsonResult.put("fullDocumentImage", SerializationUtils.encodeImageBase64(result.getFullDocumentImage()));
            jsonResult.put("mrzResult", BlinkIDSerializationUtils.serializeMrzResult(result.getMrzResult()));
        } catch (JSONException e) {
            // see https://developer.android.com/reference/org/json/JSONException
            throw new RuntimeException(e);
        }
        return jsonResult;
    }

    @Override
    public String getJsonName() {
        return "MrtdRecognizer";
    }

    @Override
    public Class<?> getRecognizerClass() {
        return com.microblink.blinkid.entities.recognizers.blinkid.mrtd.MrtdRecognizer.class;
    }
}