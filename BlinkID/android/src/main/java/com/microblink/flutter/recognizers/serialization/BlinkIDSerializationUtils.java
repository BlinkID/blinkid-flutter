package com.microblink.flutter.recognizers.serialization;

import com.microblink.flutter.SerializationUtils;

import com.microblink.entities.recognizers.blinkid.mrtd.MrzResult;
import com.microblink.entities.recognizers.blinkid.generic.DriverLicenseDetailedInfo;
import com.microblink.entities.recognizers.blinkid.generic.classinfo.ClassInfo;

import org.json.JSONException;
import org.json.JSONObject;

public abstract class BlinkIDSerializationUtils {
    public static JSONObject serializeMrzResult(MrzResult mrzResult) throws JSONException {
        JSONObject jsonMrz = new JSONObject();
        jsonMrz.put("documentType", mrzResult.getDocumentType().ordinal() + 1);
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
        return jsonDriverLicenseDetailedInfo;
    }

    public static JSONObject serializeClassInfo(ClassInfo classInfo) throws JSONException {
        JSONObject jsonClassInfo = new JSONObject();
        jsonClassInfo.put("country", SerializationUtils.serializeEnum(classInfo.getCountry()));
        jsonClassInfo.put("region", SerializationUtils.serializeEnum(classInfo.getRegion()));
        jsonClassInfo.put("type", SerializationUtils.serializeEnum(classInfo.getType()));
        return jsonClassInfo;
    }

}
