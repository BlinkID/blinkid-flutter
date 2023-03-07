package com.microblink.blinkid.flutter.recognizers.serialization;

import com.microblink.blinkid.entities.recognizers.Recognizer;
import com.microblink.blinkid.entities.recognizers.blinkbarcode.usdl.UsdlKeys;
import com.microblink.blinkid.entities.recognizers.blinkid.usdl.UsdlCombinedRecognizer;
import com.microblink.blinkid.flutter.recognizers.RecognizerSerialization;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import com.microblink.blinkid.flutter.SerializationUtils;

public final class UsdlCombinedRecognizerSerialization implements RecognizerSerialization {

    @Override
    public Recognizer<?> createRecognizer(JSONObject jsonRecognizer) {
        UsdlCombinedRecognizer recognizer = new UsdlCombinedRecognizer();
        recognizer.setFaceImageDpi(jsonRecognizer.optInt("faceImageDpi", 250));
        recognizer.setFullDocumentImageDpi(jsonRecognizer.optInt("fullDocumentImageDpi", 250));
        recognizer.setFullDocumentImageExtensionFactors(SerializationUtils.deserializeExtensionFactors(jsonRecognizer.optJSONObject("fullDocumentImageExtensionFactors")));
        recognizer.setNumStableDetectionsThreshold(jsonRecognizer.optInt("numStableDetectionsThreshold", 6));
        recognizer.setReturnFaceImage(jsonRecognizer.optBoolean("returnFaceImage", false));
        recognizer.setReturnFullDocumentImage(jsonRecognizer.optBoolean("returnFullDocumentImage", false));
        return recognizer;
    }

    @Override
    public JSONObject serializeResult(Recognizer<?> recognizer) {
        UsdlCombinedRecognizer.Result result = ((UsdlCombinedRecognizer)recognizer).getResult();
        JSONObject jsonResult = new JSONObject();
        try {
            SerializationUtils.addCommonRecognizerResultData(jsonResult, result);
            jsonResult.put("documentDataMatch", SerializationUtils.serializeEnum(result.getDocumentDataMatch()));
            jsonResult.put("faceImage", SerializationUtils.encodeImageBase64(result.getFaceImage()));
            jsonResult.put("fullDocumentImage", SerializationUtils.encodeImageBase64(result.getFullDocumentImage()));
            jsonResult.put("scanningFirstSideDone", result.isScanningFirstSideDone());

            jsonResult.put("optionalElements", SerializationUtils.serializeStringArray(result.getOptionalElements()));
            jsonResult.put("rawData", SerializationUtils.encodeByteArrayToBase64(result.getRawData()));
            jsonResult.put("rawStringData", result.getRawStringData());
            jsonResult.put("uncertain", result.isUncertain());
            jsonResult.put("fields", serializeFields(result));
            jsonResult.put("firstName", result.getFirstName());
            jsonResult.put("lastName", result.getLastName());
            jsonResult.put("fullName", result.getFullName());
            jsonResult.put("middleName", result.getMiddleName());
            jsonResult.put("nameSuffix", result.getNameSuffix());
            jsonResult.put("address", result.getAddress());
            jsonResult.put("documentNumber", result.getDocumentNumber());
            jsonResult.put("sex", result.getSex());
            jsonResult.put("age", result.getAge());
            jsonResult.put("restrictions", result.getRestrictions());
            jsonResult.put("endorsements", result.getEndorsements());
            jsonResult.put("vehicleClass", result.getVehicleClass());
            jsonResult.put("dateOfBirth", SerializationUtils.serializeDate(result.getDateOfBirth()));
            jsonResult.put("dateOfIssue", SerializationUtils.serializeDate(result.getDateOfIssue()));
            jsonResult.put("dateOfExpiry", SerializationUtils.serializeDate(result.getDateOfExpiry()));
        } catch (JSONException e) {
            // see https://developer.android.com/reference/org/json/JSONException
            throw new RuntimeException(e);
        }
        return jsonResult;
    }

    private JSONArray serializeFields(UsdlCombinedRecognizer.Result result) {
        JSONArray fieldsArr = new JSONArray();
        for (int i = 0; i < UsdlKeys.values().length; ++i) {
            fieldsArr.put(result.getField(UsdlKeys.values()[i]));
        }
        return fieldsArr;
    }

    @Override
    public String getJsonName() {
        return "UsdlCombinedRecognizer";
    }

    @Override
    public Class<?> getRecognizerClass() {
        return com.microblink.blinkid.entities.recognizers.blinkid.usdl.UsdlCombinedRecognizer.class;
    }
}