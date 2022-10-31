package com.microblink.flutter.recognizers.serialization;

import com.microblink.entities.recognizers.Recognizer;
import com.microblink.flutter.recognizers.RecognizerSerialization;
import com.microblink.flutter.SerializationUtils;

import org.json.JSONException;
import org.json.JSONObject;

public final class BlinkIdRecognizerSerialization implements RecognizerSerialization {

    @Override
    public Recognizer<?> createRecognizer(JSONObject jsonObject) {
        com.microblink.entities.recognizers.blinkid.generic.BlinkIdRecognizer recognizer = new com.microblink.entities.recognizers.blinkid.generic.BlinkIdRecognizer();
        recognizer.setAllowBlurFilter(jsonObject.optBoolean("allowBlurFilter", true));
        recognizer.setAllowUnparsedMrzResults(jsonObject.optBoolean("allowUnparsedMrzResults", false));
        recognizer.setAllowUnverifiedMrzResults(jsonObject.optBoolean("allowUnverifiedMrzResults", true));
        recognizer.setAnonymizationMode(com.microblink.entities.recognizers.blinkid.generic.AnonymizationMode.values()[jsonObject.optInt("anonymizationMode", 4) - 1]);
        recognizer.setFaceImageDpi(jsonObject.optInt("faceImageDpi", 250));
        recognizer.setFullDocumentImageDpi(jsonObject.optInt("fullDocumentImageDpi", 250));
        recognizer.setFullDocumentImageExtensionFactors(SerializationUtils.deserializeExtensionFactors(jsonObject.optJSONObject("fullDocumentImageExtensionFactors")));
        recognizer.setPaddingEdge((float)jsonObject.optDouble("paddingEdge", 0.0));
        recognizer.setRecognitionModeFilter(BlinkIDSerializationUtils.deserializeRecognitionModeFilter(jsonObject.optJSONObject("recognitionModeFilter")));
        recognizer.setReturnFaceImage(jsonObject.optBoolean("returnFaceImage", false));
        recognizer.setReturnFullDocumentImage(jsonObject.optBoolean("returnFullDocumentImage", false));
        recognizer.setReturnSignatureImage(jsonObject.optBoolean("returnSignatureImage", false));
        recognizer.setSaveCameraFrames(jsonObject.optBoolean("saveCameraFrames", false));
        recognizer.setScanCroppedDocumentImage(jsonObject.optBoolean("scanCroppedDocumentImage", false));
        recognizer.setSignatureImageDpi(jsonObject.optInt("signatureImageDpi", 250));
        recognizer.setValidateResultCharacters(jsonObject.optBoolean("validateResultCharacters", true));
        return recognizer;
    }

    @Override
    public JSONObject serializeResult(Recognizer<?> recognizer) {
        com.microblink.entities.recognizers.blinkid.generic.BlinkIdRecognizer.Result result = ((com.microblink.entities.recognizers.blinkid.generic.BlinkIdRecognizer)recognizer).getResult();
        JSONObject jsonResult = new JSONObject();
        try {
            SerializationUtils.addCommonRecognizerResultData(jsonResult, result);
            jsonResult.put("additionalAddressInformation", result.getAdditionalAddressInformation());
            jsonResult.put("additionalNameInformation", result.getAdditionalNameInformation());
            jsonResult.put("additionalOptionalAddressInformation", result.getAdditionalOptionalAddressInformation());
            jsonResult.put("address", result.getAddress());
            jsonResult.put("age", result.getAge());
            jsonResult.put("barcodeCameraFrame", SerializationUtils.encodeImageBase64(result.getBarcodeCameraFrame()));
            jsonResult.put("barcodeResult", BlinkIDSerializationUtils.serializeBarcodeResult(result.getBarcodeResult()));
            jsonResult.put("cameraFrame", SerializationUtils.encodeImageBase64(result.getCameraFrame()));
            jsonResult.put("classInfo", BlinkIDSerializationUtils.serializeClassInfo(result.getClassInfo()));
            jsonResult.put("dateOfBirth", SerializationUtils.serializeDate(result.getDateOfBirth()));
            jsonResult.put("dateOfExpiry", SerializationUtils.serializeDate(result.getDateOfExpiry()));
            jsonResult.put("dateOfExpiryPermanent", result.isDateOfExpiryPermanent());
            jsonResult.put("dateOfIssue", SerializationUtils.serializeDate(result.getDateOfIssue()));
            jsonResult.put("documentAdditionalNumber", result.getDocumentAdditionalNumber());
            jsonResult.put("documentNumber", result.getDocumentNumber());
            jsonResult.put("documentOptionalAdditionalNumber", result.getDocumentOptionalAdditionalNumber());
            jsonResult.put("driverLicenseDetailedInfo", BlinkIDSerializationUtils.serializeDriverLicenseDetailedInfo(result.getDriverLicenseDetailedInfo()));
            jsonResult.put("employer", result.getEmployer());
            jsonResult.put("expired", result.isExpired());
            jsonResult.put("faceImage", SerializationUtils.encodeImageBase64(result.getFaceImage()));
            jsonResult.put("fathersName", result.getFathersName());
            jsonResult.put("firstName", result.getFirstName());
            jsonResult.put("fullDocumentImage", SerializationUtils.encodeImageBase64(result.getFullDocumentImage()));
            jsonResult.put("fullName", result.getFullName());
            jsonResult.put("imageAnalysisResult", BlinkIDSerializationUtils.serializeImageAnalysisResult(result.getImageAnalysisResult()));
            jsonResult.put("issuingAuthority", result.getIssuingAuthority());
            jsonResult.put("lastName", result.getLastName());
            jsonResult.put("localizedName", result.getLocalizedName());
            jsonResult.put("maritalStatus", result.getMaritalStatus());
            jsonResult.put("mothersName", result.getMothersName());
            jsonResult.put("mrzResult", BlinkIDSerializationUtils.serializeMrzResult(result.getMrzResult()));
            jsonResult.put("nationality", result.getNationality());
            jsonResult.put("personalIdNumber", result.getPersonalIdNumber());
            jsonResult.put("placeOfBirth", result.getPlaceOfBirth());
            jsonResult.put("processingStatus", SerializationUtils.serializeEnum(result.getProcessingStatus()));
            jsonResult.put("profession", result.getProfession());
            jsonResult.put("race", result.getRace());
            jsonResult.put("recognitionMode", SerializationUtils.serializeEnum(result.getRecognitionMode()));
            jsonResult.put("religion", result.getReligion());
            jsonResult.put("residentialStatus", result.getResidentialStatus());
            jsonResult.put("sex", result.getSex());
            jsonResult.put("signatureImage", SerializationUtils.encodeImageBase64(result.getSignatureImage()));
            jsonResult.put("vizResult", BlinkIDSerializationUtils.serializeVizResult(result.getVizResult()));
        } catch (JSONException e) {
            // see https://developer.android.com/reference/org/json/JSONException
            throw new RuntimeException(e);
        }
        return jsonResult;
    }

    @Override
    public String getJsonName() {
        return "BlinkIdRecognizer";
    }

    @Override
    public Class<?> getRecognizerClass() {
        return com.microblink.entities.recognizers.blinkid.generic.BlinkIdRecognizer.class;
    }
}