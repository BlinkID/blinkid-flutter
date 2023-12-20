package

com.microblink.blinkid.flutter.recognizers.serialization;

import com.microblink.blinkid.flutter.SerializationUtils;

import com.microblink.blinkid.entities.recognizers.blinkid.mrtd.MrzResult;
import com.microblink.blinkid.entities.recognizers.blinkid.generic.DriverLicenseDetailedInfo;
import com.microblink.blinkid.entities.recognizers.blinkid.generic.barcode.BarcodeDriverLicenseDetailedInfo;
import com.microblink.blinkid.entities.recognizers.blinkid.generic.datamatch.DataMatchResult;
import com.microblink.blinkid.entities.recognizers.blinkid.generic.datamatch.DataMatchField;
import com.microblink.blinkid.entities.recognizers.blinkid.generic.datamatch.FieldState;
import com.microblink.blinkid.entities.recognizers.blinkid.generic.DateResult;
import com.microblink.blinkid.entities.recognizers.blinkid.generic.AdditionalProcessingInfo;
import com.microblink.blinkid.entities.recognizers.blinkid.generic.VehicleClassInfo;
import com.microblink.blinkid.entities.recognizers.blinkid.generic.barcode.BarcodeVehicleClassInfo;
import com.microblink.blinkid.entities.recognizers.blinkid.generic.StringResult;
import com.microblink.blinkid.entities.recognizers.blinkid.generic.AlphabetType;
import com.microblink.blinkid.entities.recognizers.blinkid.generic.classinfo.ClassInfo;
import com.microblink.blinkid.entities.recognizers.blinkid.generic.imageanalysis.ImageAnalysisResult;
import com.microblink.blinkid.entities.recognizers.blinkid.generic.viz.VizResult;
import com.microblink.blinkid.entities.recognizers.blinkid.generic.barcode.BarcodeResult;
import com.microblink.blinkid.entities.recognizers.blinkid.idbarcode.BarcodeElements;
import com.microblink.blinkid.entities.recognizers.blinkid.idbarcode.BarcodeElementKey;
import com.microblink.blinkid.entities.recognizers.blinkid.generic.RecognitionModeFilter;
import com.microblink.blinkid.entities.recognizers.blinkid.generic.ClassAnonymizationSettings;
import com.microblink.blinkid.entities.recognizers.blinkid.generic.FieldType;
import com.microblink.blinkid.entities.recognizers.blinkid.generic.classinfo.Country;
import com.microblink.blinkid.entities.recognizers.blinkid.generic.classinfo.Region;
import com.microblink.blinkid.entities.recognizers.blinkid.generic.classinfo.Type;
import com.microblink.blinkid.entities.recognizers.blinkid.generic.Side;
import com.microblink.blinkid.entities.recognizers.blinkid.generic.imageanalysis.CardRotation;



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
        jsonMrz.put("dateOfBirth", SerializationUtils.serializeSimpleDate(mrzResult.getDateOfBirth().getDate()));
        jsonMrz.put("documentNumber", mrzResult.getDocumentNumber());
        jsonMrz.put("nationality", mrzResult.getNationality());
        jsonMrz.put("gender", mrzResult.getGender());
        jsonMrz.put("documentCode", mrzResult.getDocumentCode());
        jsonMrz.put("dateOfExpiry", SerializationUtils.serializeSimpleDate(mrzResult.getDateOfExpiry().getDate()));
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
        jsonDriverLicenseDetailedInfo.put("restrictions", serializeStringResult(dlDetailedInfo.getRestrictions()));
        jsonDriverLicenseDetailedInfo.put("endorsements", serializeStringResult(dlDetailedInfo.getEndorsements()));
        jsonDriverLicenseDetailedInfo.put("vehicleClass", serializeStringResult(dlDetailedInfo.getVehicleClass()));
        jsonDriverLicenseDetailedInfo.put("conditions", serializeStringResult(dlDetailedInfo.getConditions()));
        JSONArray vehicleClassesInfo = new JSONArray();
        for (int i = 0; i < dlDetailedInfo.getVehicleClassesInfo().length; ++i) {
            vehicleClassesInfo.put(serializeVehicleClassInfo(dlDetailedInfo.getVehicleClassesInfo()[i]));
        }
        jsonDriverLicenseDetailedInfo.put("vehicleClassesInfo", vehicleClassesInfo);
        return jsonDriverLicenseDetailedInfo;
    }

    public static JSONObject serializeVehicleClassInfo(VehicleClassInfo vehicleClassInfo) throws JSONException {
        JSONObject jsonVehicleClassInfo = new JSONObject();
        jsonVehicleClassInfo.put("vehicleClass", serializeStringResult(vehicleClassInfo.getVehicleClass()));
        jsonVehicleClassInfo.put("licenceType", serializeStringResult(vehicleClassInfo.getLicenceType()));
        jsonVehicleClassInfo.put("effectiveDate", serializeDateResult(vehicleClassInfo.getEffectiveDate()));
        jsonVehicleClassInfo.put("expiryDate", serializeDateResult(vehicleClassInfo.getExpiryDate()));
        return jsonVehicleClassInfo;
    }

    public static JSONObject serializeBarcodeDriverLicenseDetailedInfo(BarcodeDriverLicenseDetailedInfo dlDetailedInfo) throws JSONException {
        JSONObject jsonDriverLicenseDetailedInfo = new JSONObject();
        jsonDriverLicenseDetailedInfo.put("restrictions", dlDetailedInfo.getRestrictions());
        jsonDriverLicenseDetailedInfo.put("endorsements", dlDetailedInfo.getEndorsements());
        jsonDriverLicenseDetailedInfo.put("vehicleClass", dlDetailedInfo.getVehicleClass());
        jsonDriverLicenseDetailedInfo.put("conditions", dlDetailedInfo.getConditions());
        JSONArray vehicleClassesInfo = new JSONArray();
        for (int i = 0; i < dlDetailedInfo.getVehicleClassesInfo().length; ++i) {
            vehicleClassesInfo.put(serializeBarcodeVehicleClassInfo(dlDetailedInfo.getVehicleClassesInfo()[i]));
        }
        jsonDriverLicenseDetailedInfo.put("vehicleClassesInfo", vehicleClassesInfo);
        return jsonDriverLicenseDetailedInfo;
    }

    public static JSONObject serializeDataMatchResult(DataMatchResult dataMatchResult) throws JSONException {
        JSONObject jsonDataMatchResult = new JSONObject();
        jsonDataMatchResult.put("stateForWholeDocument", SerializationUtils.serializeEnum(dataMatchResult.getStateForWholeDocument()));
        JSONArray fieldStatesArr = new JSONArray();
        for (int i = 0; i < dataMatchResult.getStates().length; ++i) {
            fieldStatesArr.put(serializeFieldState(dataMatchResult.getStates()[i]));
        }
        jsonDataMatchResult.put("states", fieldStatesArr);
        return jsonDataMatchResult;
    }

    public static JSONObject serializeBarcodeVehicleClassInfo(BarcodeVehicleClassInfo vehicleClassInfo) throws JSONException {
        JSONObject jsonVehicleClassInfo = new JSONObject();
        jsonVehicleClassInfo.put("vehicleClass", vehicleClassInfo.getVehicleClass());
        jsonVehicleClassInfo.put("licenceType", vehicleClassInfo.getLicenceType());
        jsonVehicleClassInfo.put("effectiveDate", SerializationUtils.serializeSimpleDate(vehicleClassInfo.getEffectiveDate().getDate()));
        jsonVehicleClassInfo.put("expiryDate", SerializationUtils.serializeSimpleDate(vehicleClassInfo.getExpiryDate().getDate()));
        return jsonVehicleClassInfo;
    }

    public static JSONObject serializeFieldState(FieldState fieldState) throws JSONException {
        JSONObject jsonFieldState = new JSONObject();
        jsonFieldState.put("field", SerializationUtils.serializeEnum(fieldState.getFieldType()));
        jsonFieldState.put("state", SerializationUtils.serializeEnum(fieldState.getState()));
        return jsonFieldState;
    }

    public static JSONObject serializeDateResult(DateResult dateResult) throws JSONException {
        JSONObject jsonDateResult = new JSONObject();
        if (dateResult != null && dateResult.getDate() != null) {
            jsonDateResult.put("originalDateStringResult", serializeStringResult(dateResult.getOriginalDateString()));
            jsonDateResult.put("isFilledByDomainKnowledge", dateResult.isFilledByDomainKnowledge());
            jsonDateResult.put("day", dateResult.getDate().getDay());
            jsonDateResult.put("month", dateResult.getDate().getMonth());
            jsonDateResult.put("year", dateResult.getDate().getYear());
        }
        return jsonDateResult;
    }

    public static JSONObject serializeStringResult(StringResult stringResult) throws JSONException {
        JSONObject jsonStringResult = new JSONObject();
        if (stringResult != null) {
            jsonStringResult.put("empty", stringResult.isEmpty());
            jsonStringResult.put("latin", stringResult.value(AlphabetType.Latin));
            jsonStringResult.put("arabic", stringResult.value(AlphabetType.Arabic));
            jsonStringResult.put("cyrillic", stringResult.value(AlphabetType.Cyrillic));
            jsonStringResult.put("description", stringResult.toString());

            JSONObject jsonFieldLocations = new JSONObject();
            jsonFieldLocations.put("latin",SerializationUtils.serializeRectangle(stringResult.location(AlphabetType.Latin)));
            jsonFieldLocations.put("arabic",SerializationUtils.serializeRectangle(stringResult.location(AlphabetType.Arabic)));
            jsonFieldLocations.put("cyrillic",SerializationUtils.serializeRectangle(stringResult.location(AlphabetType.Cyrillic)));
            jsonStringResult.put("location", jsonFieldLocations);

            JSONObject jsonDocumentSides = new JSONObject();
            jsonDocumentSides.put("latin",serializeSide(stringResult.side(AlphabetType.Latin)));
            jsonDocumentSides.put("arabic",serializeSide(stringResult.side(AlphabetType.Arabic)));
            jsonDocumentSides.put("cyrillic",serializeSide(stringResult.side(AlphabetType.Cyrillic)));
            jsonStringResult.put("side", jsonDocumentSides);
        }
        return jsonStringResult;
    }

    public static int serializeSide(Side side) {
        if (side != null) {
            return side.ordinal() + 1;
        }
        return 0;
    }

    public static int serializeCardRotation(CardRotation rotation) {
        if (rotation != null) {
            return rotation.ordinal();
        }
        return 4;
    }

    public static JSONObject serializeAdditionalProcessingInfo(AdditionalProcessingInfo additionalProcessingInfo) throws JSONException {
        JSONObject jsonAdditionalProcessingInfo = new JSONObject();
        JSONArray missingMandatoryFieldsArr = new JSONArray();
        for (int i = 0; i < additionalProcessingInfo.getMissingMandatoryFields().length; ++i) {
            missingMandatoryFieldsArr.put(SerializationUtils.serializeEnum(additionalProcessingInfo.getMissingMandatoryFields()[i]));
        }
        JSONArray invalidCharacterFieldsArr = new JSONArray();
        for (int i = 0; i < additionalProcessingInfo.getInvalidCharacterFields().length; ++i) {
            invalidCharacterFieldsArr.put(SerializationUtils.serializeEnum(additionalProcessingInfo.getInvalidCharacterFields()[i]));
        }
        JSONArray extraPresentFieldsArr = new JSONArray();
        for (int i = 0; i < additionalProcessingInfo.getExtraPresentFields().length; ++i) {
            extraPresentFieldsArr.put(SerializationUtils.serializeEnum(additionalProcessingInfo.getExtraPresentFields()[i]));
        }
        jsonAdditionalProcessingInfo.put("missingMandatoryFields", missingMandatoryFieldsArr);
        jsonAdditionalProcessingInfo.put("invalidCharacterFields", invalidCharacterFieldsArr);
        jsonAdditionalProcessingInfo.put("extraPresentFields", extraPresentFieldsArr);
        return jsonAdditionalProcessingInfo;
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
        jsonImageAnalysis.put("cardRotation", BlinkIDSerializationUtils.serializeCardRotation(imageAnalysisResult.getCardRotation()));
        return jsonImageAnalysis;
    }

    public static JSONObject serializeVizResult(VizResult vizResult) throws JSONException {
        JSONObject jsonViz = new JSONObject();
        jsonViz.put("firstName", serializeStringResult(vizResult.getFirstName()));
        jsonViz.put("lastName", serializeStringResult(vizResult.getLastName()));
        jsonViz.put("fullName", serializeStringResult(vizResult.getFullName()));
        jsonViz.put("additionalNameInformation", serializeStringResult(vizResult.getAdditionalNameInformation()));
        jsonViz.put("localizedName", serializeStringResult(vizResult.getLocalizedName()));
        jsonViz.put("address", serializeStringResult(vizResult.getAddress()));
        jsonViz.put("additionalAddressInformation", serializeStringResult(vizResult.getAdditionalAddressInformation()));
        jsonViz.put("additionalOptionalAddressInformation", serializeStringResult(vizResult.getAdditionalOptionalAddressInformation()));
        jsonViz.put("placeOfBirth", serializeStringResult(vizResult.getPlaceOfBirth()));
        jsonViz.put("nationality", serializeStringResult(vizResult.getNationality()));
        jsonViz.put("race", serializeStringResult(vizResult.getRace()));
        jsonViz.put("religion", serializeStringResult(vizResult.getReligion()));
        jsonViz.put("profession", serializeStringResult(vizResult.getProfession()));
        jsonViz.put("maritalStatus", serializeStringResult(vizResult.getMaritalStatus()));
        jsonViz.put("residentialStatus", serializeStringResult(vizResult.getResidentialStatus()));
        jsonViz.put("employer", serializeStringResult(vizResult.getEmployer()));
        jsonViz.put("sex", serializeStringResult(vizResult.getSex()));
        jsonViz.put("dateOfBirth", serializeDateResult(vizResult.getDateOfBirth()));
        jsonViz.put("dateOfIssue", serializeDateResult(vizResult.getDateOfIssue()));
        jsonViz.put("dateOfExpiry", serializeDateResult(vizResult.getDateOfExpiry()));
        jsonViz.put("documentNumber", serializeStringResult(vizResult.getDocumentNumber()));
        jsonViz.put("personalIdNumber", serializeStringResult(vizResult.getPersonalIdNumber()));
        jsonViz.put("documentAdditionalNumber", serializeStringResult(vizResult.getDocumentAdditionalNumber()));
        jsonViz.put("additionalPersonalIdNumber", serializeStringResult(vizResult.getAdditionalPersonalIdNumber()));
        jsonViz.put("issuingAuthority", serializeStringResult(vizResult.getIssuingAuthority()));
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
        jsonBarcode.put("dateOfBirth", SerializationUtils.serializeSimpleDate(barcodeResult.getDateOfBirth().getDate()));
        jsonBarcode.put("dateOfIssue", SerializationUtils.serializeSimpleDate(barcodeResult.getDateOfIssue().getDate()));
        jsonBarcode.put("dateOfExpiry", SerializationUtils.serializeSimpleDate(barcodeResult.getDateOfExpiry().getDate()));
        jsonBarcode.put("documentNumber", barcodeResult.getDocumentNumber());
        jsonBarcode.put("personalIdNumber", barcodeResult.getPersonalIdNumber());
        jsonBarcode.put("documentAdditionalNumber", barcodeResult.getDocumentAdditionalNumber());
        jsonBarcode.put("issuingAuthority", barcodeResult.getIssuingAuthority());
        jsonBarcode.put("street", barcodeResult.getStreet());
        jsonBarcode.put("postalCode", barcodeResult.getPostalCode());
        jsonBarcode.put("city", barcodeResult.getCity());
        jsonBarcode.put("jurisdiction", barcodeResult.getJurisdiction());
        jsonBarcode.put("driverLicenseDetailedInfo", serializeBarcodeDriverLicenseDetailedInfo(barcodeResult.getDriverLicenseDetailedInfo()));
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

    public static ClassAnonymizationSettings[] deserializeClassAnonymizationSettings (JSONArray jsonArray) {

        if (jsonArray != null && jsonArray.length() > 0) {
            ClassAnonymizationSettings[] classAnonymizationSettingsArray = new ClassAnonymizationSettings[jsonArray.length()];

            for(int i = 0; i < jsonArray.length(); i++) {

                FieldType[] fieldTypes = new FieldType[0];
                Country country = Country.NONE;
                Region region = Region.NONE;
                Type type = Type.NONE;
                try {
                    JSONObject jsonClassAnonymizationSettings = jsonArray.getJSONObject(i);

                    JSONArray fieldTypeJsonArray = jsonClassAnonymizationSettings.optJSONArray("fields");
                    fieldTypes = new FieldType[fieldTypeJsonArray.length()];
                    for (int x = 0; x <fieldTypeJsonArray.length(); x++) {
                        fieldTypes[x] = FieldType.values()[fieldTypeJsonArray.getInt(x)];
                    }
                    try {
                        country = Country.values()[jsonClassAnonymizationSettings.getInt("country")];
                    } catch ( JSONException e) {
                        country = null;
                    }
                    try {
                        region = Region.values()[jsonClassAnonymizationSettings.getInt("region")];
                    } catch ( JSONException e) {
                        region = null;
                    }
                    try {
                        type = Type.values()[jsonClassAnonymizationSettings.getInt("type")];
                    } catch ( JSONException e) {
                        type = null;
                    }
                    ClassAnonymizationSettings classAnonymizationSettings = new ClassAnonymizationSettings(country, region, type, fieldTypes);
                    classAnonymizationSettingsArray[i] = classAnonymizationSettings;
                } catch (JSONException e) {
                    throw new RuntimeException(e);
                }
            }
            return classAnonymizationSettingsArray;
        } else {
            return new ClassAnonymizationSettings[]{};
        }
    }
}