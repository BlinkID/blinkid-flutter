package com.microblink.flutter.recognizers.serialization;

import com.microblink.flutter.SerializationUtils;

import com.microblink.entities.recognizers.blinkid.mrtd.MrzResult;
import com.microblink.entities.recognizers.blinkid.generic.DriverLicenseDetailedInfo;
import com.microblink.entities.recognizers.blinkid.generic.DataMatchDetailedInfo;
import com.microblink.entities.recognizers.blinkid.generic.VehicleClassInfo;
import com.microblink.entities.recognizers.blinkid.generic.classinfo.ClassInfo;
import com.microblink.entities.recognizers.blinkid.generic.imageanalysis.ImageAnalysisResult;
import com.microblink.entities.recognizers.blinkid.generic.viz.VizResult;
import com.microblink.entities.recognizers.blinkid.generic.barcode.BarcodeResult;
import com.microblink.entities.recognizers.blinkid.idbarcode.BarcodeElements;
import com.microblink.entities.recognizers.blinkid.idbarcode.BarcodeElementKey;
import com.microblink.entities.recognizers.blinkid.generic.RecognitionModeFilter;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public abstract class BlinkIDSerializationUtils {
    public static JSONObject serializeMrzResult(MrzResult mrzResult) throws JSONException {
        JSONObject jsonMrz = new JSONObject();
        jsonMrz.put("documentType", mrzResult.getDocumentType().ordinal());
        jsonMrz.put("primaryId", mrzResult.getPrimaryId());
        jsonMrz.put("secondaryId", mrzResult.getSecondaryId());
        jsonMrz.put("issuer", mrzResult.getIssuer());
        jsonMrz.put("dateOfBirth", SerializationUtils.serializeDate(mrzResult.getDateOfBirth().getDate()));
        jsonMrz.put("documentNumber", mrzResult.getDocumentNumber());
        jsonMrz.put("nationality", mrzResult.getNationality());
        jsonMrz.put("gender", mrzResult.getGender());
        jsonMrz.put("documentCode", mrzResult.getDocumentCode());
        jsonMrz.put("dateOfExpiry", SerializationUtils.serializeDate(mrzResult.getDateOfExpiry().getDate()));
        jsonMrz.put("opt1", mrzResult.getOpt1());
        jsonMrz.put("opt2", mrzResult.getOpt2());
        jsonMrz.put("alienNumber", mrzResult.getAlienNumber());
        jsonMrz.put("applicationReceiptNumber", mrzResult.getApplicationReceiptNumber());
        jsonMrz.put("immigrantCaseNumber", mrzResult.getImmigrantCaseNumber());
        jsonMrz.put("mrzText", mrzResult.getMrzText());
        jsonMrz.put("sanitizedOpt1", mrzResult.getSanitizedOpt1());
        jsonMrz.put("sanitizedOpt2", mrzResult.getSanitizedOpt2());
        jsonMrz.put("sanitizedNationality", mrzResult.getSanitizedNationality());
        jsonMrz.put("sanitizedIssuer", mrzResult.getSanitizedIssuer());
        jsonMrz.put("sanitizedDocumentCode", mrzResult.getSanitizedDocumentCode());
        jsonMrz.put("sanitizedDocumentNumber", mrzResult.getSanitizedDocumentNumber());
        jsonMrz.put("mrzParsed", mrzResult.isMrzParsed());
        jsonMrz.put("mrzVerified", mrzResult.isMrzVerified());
        return jsonMrz;
    }

    public static JSONObject serializeDriverLicenseDetailedInfo(DriverLicenseDetailedInfo dlDetailedInfo) throws JSONException {
        JSONObject jsonDriverLicenseDetailedInfo = new JSONObject();
        jsonDriverLicenseDetailedInfo.put("restrictions", dlDetailedInfo.getRestrictions());
        jsonDriverLicenseDetailedInfo.put("endorsements", dlDetailedInfo.getEndorsements());
        jsonDriverLicenseDetailedInfo.put("vehicleClass", dlDetailedInfo.getVehicleClass());
        jsonDriverLicenseDetailedInfo.put("conditions", dlDetailedInfo.getConditions());
        JSONArray vehicleClassesInfo = new JSONArray();
        for (int i = 0; i < dlDetailedInfo.getVehicleClassesInfo().length; ++i) {
            vehicleClassesInfo.put(serializeVehicleClassInfo(dlDetailedInfo.getVehicleClassesInfo()[i]));
        }
        jsonDriverLicenseDetailedInfo.put("vehicleClassesInfo", vehicleClassesInfo);
        return jsonDriverLicenseDetailedInfo;
    }

    public static JSONObject serializeDataMatchDetailedInfo(DataMatchDetailedInfo dmDetailedInfo) throws JSONException {
        JSONObject jsonDataMatchDetailedInfo = new JSONObject();
        jsonDataMatchDetailedInfo.put("dataMatchResult", SerializationUtils.serializeEnum(dmDetailedInfo.getDataMatchResult()));
        jsonDataMatchDetailedInfo.put("dateOfExpiry", SerializationUtils.serializeEnum(dmDetailedInfo.getDateOfExpiry()));
        jsonDataMatchDetailedInfo.put("dateOfBirth", SerializationUtils.serializeEnum(dmDetailedInfo.getDateOfBirth()));
        jsonDataMatchDetailedInfo.put("documentNumber", SerializationUtils.serializeEnum(dmDetailedInfo.getDocumentNumber()));
        return jsonDataMatchDetailedInfo;
    }

    public static JSONObject serializeVehicleClassInfo(VehicleClassInfo vehicleClassInfo) throws JSONException {
        JSONObject jsonVehicleClassInfo = new JSONObject();
        jsonVehicleClassInfo.put("vehicleClass", vehicleClassInfo.getVehicleClass());
        jsonVehicleClassInfo.put("licenceType", vehicleClassInfo.getLicenceType());
        jsonVehicleClassInfo.put("effectiveDate", SerializationUtils.serializeDate(vehicleClassInfo.getEffectiveDate().getDate()));
        jsonVehicleClassInfo.put("expiryDate", SerializationUtils.serializeDate(vehicleClassInfo.getExpiryDate().getDate()));
        return jsonVehicleClassInfo;
    }

    public static JSONObject serializeClassInfo(ClassInfo classInfo) throws JSONException {
        JSONObject jsonClassInfo = new JSONObject();
        jsonClassInfo.put("country", SerializationUtils.serializeEnum(classInfo.getCountry()));
        jsonClassInfo.put("region", SerializationUtils.serializeEnum(classInfo.getRegion()));
        jsonClassInfo.put("type", SerializationUtils.serializeEnum(classInfo.getType()));
        jsonClassInfo.put("countryName", classInfo.getCountryName());
        jsonClassInfo.put("isoNumericCountryCode", classInfo.getIsoNumericCountryCode());
        jsonClassInfo.put("isoAlpha2CountryCode", classInfo.getIsoAlpha2CountryCode());
        jsonClassInfo.put("isoAlpha3CountryCode", classInfo.getIsoAlpha3CountryCode());
        jsonClassInfo.put("empty", classInfo.isEmpty());
        return jsonClassInfo;
    }

    public static JSONObject serializeImageAnalysisResult(ImageAnalysisResult imageAnalysisResult) throws JSONException {
        JSONObject jsonImageAnalysis = new JSONObject();
        jsonImageAnalysis.put("blurred", imageAnalysisResult.isBlurred());
        jsonImageAnalysis.put("documentImageColorStatus", SerializationUtils.serializeEnum(imageAnalysisResult.getDocumentImageColorStatus()));
        jsonImageAnalysis.put("documentImageMoireStatus", SerializationUtils.serializeEnum(imageAnalysisResult.getDocumentImageMoireStatus()));
        jsonImageAnalysis.put("faceDetectionStatus", SerializationUtils.serializeEnum(imageAnalysisResult.getFaceDetectionStatus()));
        jsonImageAnalysis.put("mrzDetectionStatus", SerializationUtils.serializeEnum(imageAnalysisResult.getMrzDetectionStatus()));
        jsonImageAnalysis.put("barcodeDetectionStatus", SerializationUtils.serializeEnum(imageAnalysisResult.getBarcodeDetectionStatus()));
        return jsonImageAnalysis;
    }

    public static JSONObject serializeVizResult(VizResult vizResult) throws JSONException {
        JSONObject jsonViz = new JSONObject();
        jsonViz.put("firstName", vizResult.getFirstName());
        jsonViz.put("lastName", vizResult.getLastName());
        jsonViz.put("fullName", vizResult.getFullName());
        jsonViz.put("additionalNameInformation", vizResult.getAdditionalNameInformation());
        jsonViz.put("localizedName", vizResult.getLocalizedName());
        jsonViz.put("address", vizResult.getAddress());
        jsonViz.put("additionalAddressInformation", vizResult.getAdditionalAddressInformation());
        jsonViz.put("placeOfBirth", vizResult.getPlaceOfBirth());
        jsonViz.put("nationality", vizResult.getNationality());
        jsonViz.put("race", vizResult.getRace());
        jsonViz.put("religion", vizResult.getReligion());
        jsonViz.put("profession", vizResult.getProfession());
        jsonViz.put("maritalStatus", vizResult.getMaritalStatus());
        jsonViz.put("residentialStatus", vizResult.getResidentialStatus());
        jsonViz.put("employer", vizResult.getEmployer());
        jsonViz.put("sex", vizResult.getSex());
        jsonViz.put("dateOfBirth", SerializationUtils.serializeDate(vizResult.getDateOfBirth().getDate()));
        jsonViz.put("dateOfIssue", SerializationUtils.serializeDate(vizResult.getDateOfIssue().getDate()));
        jsonViz.put("dateOfExpiry", SerializationUtils.serializeDate(vizResult.getDateOfExpiry().getDate()));
        jsonViz.put("documentNumber", vizResult.getDocumentNumber());
        jsonViz.put("personalIdNumber", vizResult.getPersonalIdNumber());
        jsonViz.put("documentAdditionalNumber", vizResult.getDocumentAdditionalNumber());
        jsonViz.put("additionalPersonalIdNumber", vizResult.getAdditionalPersonalIdNumber());
        jsonViz.put("issuingAuthority", vizResult.getIssuingAuthority());
        jsonViz.put("driverLicenseDetailedInfo", serializeDriverLicenseDetailedInfo(vizResult.getDriverLicenseDetailedInfo()));
        jsonViz.put("empty", vizResult.isEmpty());
        return jsonViz;
    }

    public static JSONObject serializeBarcodeResult(BarcodeResult barcodeResult) throws JSONException {
        JSONObject jsonBarcode = new JSONObject();
        jsonBarcode.put("barcodeType", SerializationUtils.serializeEnum(barcodeResult.getBarcodeType()));
        jsonBarcode.put("rawData", SerializationUtils.encodeByteArrayToBase64(barcodeResult.getRawData()));
        jsonBarcode.put("stringData", barcodeResult.getStringData());
        jsonBarcode.put("uncertain", barcodeResult.isUncertain());
        jsonBarcode.put("firstName", barcodeResult.getFirstName());
        jsonBarcode.put("lastName", barcodeResult.getLastName());
        jsonBarcode.put("fullName", barcodeResult.getFullName());
        jsonBarcode.put("middleName", barcodeResult.getMiddleName());
        jsonBarcode.put("additionalNameInformation", barcodeResult.getAdditionalNameInformation());
        jsonBarcode.put("address", barcodeResult.getAddress());
        jsonBarcode.put("placeOfBirth", barcodeResult.getPlaceOfBirth());
        jsonBarcode.put("nationality", barcodeResult.getNationality());
        jsonBarcode.put("race", barcodeResult.getRace());
        jsonBarcode.put("religion", barcodeResult.getReligion());
        jsonBarcode.put("profession", barcodeResult.getProfession());
        jsonBarcode.put("maritalStatus", barcodeResult.getMaritalStatus());
        jsonBarcode.put("residentialStatus", barcodeResult.getResidentialStatus());
        jsonBarcode.put("employer", barcodeResult.getEmployer());
        jsonBarcode.put("sex", barcodeResult.getSex());
        jsonBarcode.put("dateOfBirth", SerializationUtils.serializeDate(barcodeResult.getDateOfBirth().getDate()));
        jsonBarcode.put("dateOfIssue", SerializationUtils.serializeDate(barcodeResult.getDateOfIssue().getDate()));
        jsonBarcode.put("dateOfExpiry", SerializationUtils.serializeDate(barcodeResult.getDateOfExpiry().getDate()));
        jsonBarcode.put("documentNumber", barcodeResult.getDocumentNumber());
        jsonBarcode.put("personalIdNumber", barcodeResult.getPersonalIdNumber());
        jsonBarcode.put("documentAdditionalNumber", barcodeResult.getDocumentAdditionalNumber());
        jsonBarcode.put("issuingAuthority", barcodeResult.getIssuingAuthority());
        jsonBarcode.put("street", barcodeResult.getStreet());
        jsonBarcode.put("postalCode", barcodeResult.getPostalCode());
        jsonBarcode.put("city", barcodeResult.getCity());
        jsonBarcode.put("jurisdiction", barcodeResult.getJurisdiction());
        jsonBarcode.put("driverLicenseDetailedInfo", serializeDriverLicenseDetailedInfo(barcodeResult.getDriverLicenseDetailedInfo()));
        jsonBarcode.put("extendedElements", serializeBarcodeElements(barcodeResult.getExtendedElements()));
        jsonBarcode.put("empty", barcodeResult.isEmpty());
        return jsonBarcode;
    }

    public static JSONObject serializeBarcodeElements(BarcodeElements barcodeElements) throws JSONException {
        JSONObject jsonBarcodeElements = new JSONObject();
        jsonBarcodeElements.put("empty", barcodeElements.isEmpty());
        JSONArray valuesArr = new JSONArray();
        for (int i = 0; i < BarcodeElementKey.values().length; ++i) {
            valuesArr.put(barcodeElements.getValue(BarcodeElementKey.values()[i]));
        }
        jsonBarcodeElements.put("values", valuesArr);
        return jsonBarcodeElements;
    }

    public static RecognitionModeFilter deserializeRecognitionModeFilter(JSONObject json) {
        if (json != null) {
            boolean enableMrzId = (boolean)json.optBoolean("enableMrzId", true);
            boolean enableMrzVisa = (boolean)json.optBoolean("enableMrzVisa", true);
            boolean enableMrzPassport = (boolean)json.optBoolean("enableMrzPassport", true);
            boolean enablePhotoId = (boolean)json.optBoolean("enablePhotoId", true);
            boolean enableBarcodeId = (boolean)json.optBoolean("enableBarcodeId", true);
            boolean enableFullDocumentRecognition = (boolean)json.optBoolean("enableFullDocumentRecognition", true);
            return new RecognitionModeFilter(enableMrzId, enableMrzVisa, enableMrzPassport, enablePhotoId, enableBarcodeId, enableFullDocumentRecognition);
        } else {
            return new RecognitionModeFilter();
        }
    }

}