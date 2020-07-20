package com.microblink.flutter.recognizers.serialization;

import com.microblink.entities.recognizers.Recognizer;
import com.microblink.flutter.recognizers.RecognizerSerialization;
import com.microblink.flutter.SerializationUtils;

import org.json.JSONException;
import org.json.JSONObject;

public final class DocumentFaceRecognizerSerialization implements RecognizerSerialization {

    @Override
    public Recognizer<?> createRecognizer(JSONObject jsonObject) {
        com.microblink.entities.recognizers.blinkid.documentface.DocumentFaceRecognizer recognizer = new com.microblink.entities.recognizers.blinkid.documentface.DocumentFaceRecognizer();
        recognizer.setDetectorType(com.microblink.entities.recognizers.blinkid.documentface.DocumentFaceDetectorType.values()[jsonObject.optInt("detectorType", 1) - 1]);
        recognizer.setFaceImageDpi(jsonObject.optInt("faceImageDpi", 250));
        recognizer.setFullDocumentImageDpi(jsonObject.optInt("fullDocumentImageDpi", 250));
        recognizer.setFullDocumentImageExtensionFactors(SerializationUtils.deserializeExtensionFactors(jsonObject.optJSONObject("fullDocumentImageExtensionFactors")));
        recognizer.setNumStableDetectionsThreshold(jsonObject.optInt("numStableDetectionsThreshold", 6));
        recognizer.setReturnFaceImage(jsonObject.optBoolean("returnFaceImage", false));
        recognizer.setReturnFullDocumentImage(jsonObject.optBoolean("returnFullDocumentImage", false));
        return recognizer;
    }

    @Override
    public JSONObject serializeResult(Recognizer<?> recognizer) {
        com.microblink.entities.recognizers.blinkid.documentface.DocumentFaceRecognizer.Result result = ((com.microblink.entities.recognizers.blinkid.documentface.DocumentFaceRecognizer)recognizer).getResult();
        JSONObject jsonResult = new JSONObject();
        try {
            SerializationUtils.addCommonRecognizerResultData(jsonResult, result);
            jsonResult.put("documentLocation", SerializationUtils.serializeQuad(result.getDocumentLocation()));
            jsonResult.put("faceImage", SerializationUtils.encodeImageBase64(result.getFaceImage()));
            jsonResult.put("faceLocation", SerializationUtils.serializeQuad(result.getFaceLocation()));
            jsonResult.put("fullDocumentImage", SerializationUtils.encodeImageBase64(result.getFullDocumentImage()));
        } catch (JSONException e) {
            // see https://developer.android.com/reference/org/json/JSONException
            throw new RuntimeException(e);
        }
        return jsonResult;
    }

    @Override
    public String getJsonName() {
        return "DocumentFaceRecognizer";
    }

    @Override
    public Class<?> getRecognizerClass() {
        return com.microblink.entities.recognizers.blinkid.documentface.DocumentFaceRecognizer.class;
    }
}