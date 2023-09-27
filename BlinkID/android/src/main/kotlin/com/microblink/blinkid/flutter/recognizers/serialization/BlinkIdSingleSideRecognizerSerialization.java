package com.microblink.blinkid.flutter.recognizers.serialization;

import com.microblink.blinkid.entities.recognizers.Recognizer;
import com.microblink.blinkid.flutter.recognizers.RecognizerSerialization;
import com.microblink.blinkid.flutter.SerializationUtils;

import org.json.JSONException;
import org.json.JSONObject;

public final class BlinkIdSingleSideRecognizerSerialization implements RecognizerSerialization {

    @Override
    public Recognizer<?> createRecognizer(JSONObject jsonObject) {
        com.microblink.blinkid.entities.recognizers.blinkid.generic.BlinkIdSingleSideRecognizer recognizer = new com.microblink.blinkid.entities.recognizers.blinkid.generic.BlinkIdSingleSideRecognizer();
        recognizer.setAllowBlurFilter(jsonObject.optBoolean("allowBlurFilter", true));
        recognizer.setAllowUnparsedMrzResults(jsonObject.optBoolean("allowUnparsedMrzResults", false));
        recognizer.setAllowUnverifiedMrzResults(jsonObject.optBoolean("allowUnverifiedMrzResults", true));
        recognizer.setAnonymizationMode(com.microblink.blinkid.entities.recognizers.blinkid.generic.AnonymizationMode.values()[jsonObject.optInt("anonymizationMode", 3)]);
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
        com.microblink.blinkid.entities.recognizers.blinkid.generic.BlinkIdSingleSideRecognizer.Result result = ((com.microblink.blinkid.entities.recognizers.blinkid.generic.BlinkIdSingleSideRecognizer)recognizer).getResult();
        JSONObject jsonResult = new JSONObject();
        try {
            SerializationUtils.addCommonRecognizerResultData(jsonResult, result);
            jsonResult.put("additionalAddressInformation", BlinkIDSerializationUtils.serializeStringResult(result.getAdditionalAddressInformation()));
            jsonResult.put("additionalNameInformation", BlinkIDSerializationUtils.serializeStringResult(result.getAdditionalNameInformation()));
            jsonResult.put("additionalOptionalAddressInformation", BlinkIDSerializationUtils.serializeStringResult(result.getAdditionalOptionalAddressInformation()));
            jsonResult.put("additionalProcessingInfo", BlinkIDSerializationUtils.serializeAdditionalProcessingInfo(result.getAdditionalProcessingInfo()));
            jsonResult.put("address", BlinkIDSerializationUtils.serializeStringResult(result.getAddress()));
            jsonResult.put("age", result.getAge());
            jsonResult.put("barcodeCameraFrame", SerializationUtils.encodeImageBase64(result.getBarcodeCameraFrame()));
            jsonResult.put("barcodeResult", BlinkIDSerializationUtils.serializeBarcodeResult(result.getBarcodeResult()));
            jsonResult.put("cameraFrame", SerializationUtils.encodeImageBase64(result.getCameraFrame()));
            jsonResult.put("classInfo", BlinkIDSerializationUtils.serializeClassInfo(result.getClassInfo()));
            jsonResult.put("dateOfBirth", BlinkIDSerializationUtils.serializeDateResult(result.getDateOfBirth()));
            jsonResult.put("dateOfExpiry", BlinkIDSerializationUtils.serializeDateResult(result.getDateOfExpiry()));
            jsonResult.put("dateOfExpiryPermanent", result.isDateOfExpiryPermanent());
            jsonResult.put("dateOfIssue", BlinkIDSerializationUtils.serializeDateResult(result.getDateOfIssue()));
            jsonResult.put("documentAdditionalNumber", BlinkIDSerializationUtils.serializeStringResult(result.getDocumentAdditionalNumber()));
            jsonResult.put("documentNumber", BlinkIDSerializationUtils.serializeStringResult(result.getDocumentNumber()));
            jsonResult.put("documentOptionalAdditionalNumber", BlinkIDSerializationUtils.serializeStringResult(result.getDocumentOptionalAdditionalNumber()));
            jsonResult.put("driverLicenseDetailedInfo", BlinkIDSerializationUtils.serializeDriverLicenseDetailedInfo(result.getDriverLicenseDetailedInfo()));
            jsonResult.put("employer", BlinkIDSerializationUtils.serializeStringResult(result.getEmployer()));
            jsonResult.put("expired", result.isExpired());
            jsonResult.put("faceImage", SerializationUtils.encodeImageBase64(result.getFaceImage()));
            jsonResult.put("fathersName", BlinkIDSerializationUtils.serializeStringResult(result.getFathersName()));
            jsonResult.put("firstName", BlinkIDSerializationUtils.serializeStringResult(result.getFirstName()));
            jsonResult.put("fullDocumentImage", SerializationUtils.encodeImageBase64(result.getFullDocumentImage()));
            jsonResult.put("fullName", BlinkIDSerializationUtils.serializeStringResult(result.getFullName()));
            jsonResult.put("imageAnalysisResult", BlinkIDSerializationUtils.serializeImageAnalysisResult(result.getImageAnalysisResult()));
            jsonResult.put("issuingAuthority", BlinkIDSerializationUtils.serializeStringResult(result.getIssuingAuthority()));
            jsonResult.put("lastName", BlinkIDSerializationUtils.serializeStringResult(result.getLastName()));
            jsonResult.put("localizedName", BlinkIDSerializationUtils.serializeStringResult(result.getLocalizedName()));
            jsonResult.put("maritalStatus", BlinkIDSerializationUtils.serializeStringResult(result.getMaritalStatus()));
            jsonResult.put("mothersName", BlinkIDSerializationUtils.serializeStringResult(result.getMothersName()));
            jsonResult.put("mrzResult", BlinkIDSerializationUtils.serializeMrzResult(result.getMrzResult()));
            jsonResult.put("nationality", BlinkIDSerializationUtils.serializeStringResult(result.getNationality()));
            jsonResult.put("personalIdNumber", BlinkIDSerializationUtils.serializeStringResult(result.getPersonalIdNumber()));
            jsonResult.put("placeOfBirth", BlinkIDSerializationUtils.serializeStringResult(result.getPlaceOfBirth()));
            jsonResult.put("processingStatus", SerializationUtils.serializeEnum(result.getProcessingStatus()));
            jsonResult.put("profession", BlinkIDSerializationUtils.serializeStringResult(result.getProfession()));
            jsonResult.put("race", BlinkIDSerializationUtils.serializeStringResult(result.getRace()));
            jsonResult.put("recognitionMode", SerializationUtils.serializeEnum(result.getRecognitionMode()));
            jsonResult.put("religion", BlinkIDSerializationUtils.serializeStringResult(result.getReligion()));
            jsonResult.put("residentialStatus", BlinkIDSerializationUtils.serializeStringResult(result.getResidentialStatus()));
            jsonResult.put("sex", BlinkIDSerializationUtils.serializeStringResult(result.getSex()));
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
        return "BlinkIdSingleSideRecognizer";
    }

    @Override
    public Class<?> getRecognizerClass() {
        return com.microblink.blinkid.entities.recognizers.blinkid.generic.BlinkIdSingleSideRecognizer.class;
    }
}