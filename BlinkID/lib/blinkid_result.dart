import 'package:json_annotation/json_annotation.dart';
import 'package:blinkid_flutter/blinkid_settings.dart';

/// Represents the results of scanning a document.
///
/// This class contains the results of scanning a document, including the extracted data
/// and images from the document.
class BlinkIdScanningResult {
  /// Scanning mode used to scan the current document.
  ///
  /// See [RecognitionMode] for more information.
  RecognitionMode? recognitionMode;

  /// The document class information.
  ///
  /// See [DocumentClassInfo] for more information.
  DocumentClassInfo? documentClassInfo;

  /// Info on whether the data extracted from multiple sides matches.
  ///
  /// See [DataMatchResult] for more information.
  DataMatchResult? dataMatchResult;

  /// The first name of the document owner.
  StringResult? firstName;

  /// The last name of the document owner.
  StringResult? lastName;

  /// The full name of the document owner.
  StringResult? fullName;

  /// The additional name information of the document owner.
  StringResult? additionalNameInformation;

  /// The localized name of the document owner.
  StringResult? localizedName;

  /// The fathers name of the document owner.
  StringResult? fathersName;

  /// The mothers name of the document owner.
  StringResult? mothersName;

  /// The address of the document owner.
  StringResult? address;

  /// The additional address information of the document owner.
  StringResult? additionalAddressInformation;

  /// The one more additional address information of the document owner.
  StringResult? additionalOptionalAddressInformation;

  /// The place of birth of the document owner.
  StringResult? placeOfBirth;

  /// The nationality of the document owner.
  StringResult? nationality;

  /// The race of the document owner.
  StringResult? race;

  /// The religion of the document owner.
  StringResult? religion;

  /// The profession of the document owner.
  StringResult? profession;

  /// The marital status of the document owner.
  StringResult? maritalStatus;

  /// The residential status of the document owner.
  StringResult? residentialStatus;

  /// The employer of the document owner.
  StringResult? employer;

  /// The sex of the document owner.
  StringResult? sex;

  /// The sponsor of the document owner.
  StringResult? sponsor;

  /// The blood type of the document owner.
  StringResult? bloodType;

  /// The document number.
  StringResult? documentNumber;

  /// The personal identification number.
  StringResult? personalIdNumber;

  /// The additional number of the document.
  StringResult? documentAdditionalNumber;

  /// The one more additional number of the document.
  StringResult? documentOptionalAdditionalNumber;

  /// The additional personal identification number.
  StringResult? additionalPersonalIdNumber;

  /// The issuing authority of the document.
  StringResult? issuingAuthority;

  /// The transcription of the document subtype.
  StringResult? documentSubtype;

  /// The remarks on the residence permit.
  StringResult? remarks;

  /// The residence permit type.
  StringResult? residencePermitType;

  /// The manufacturing year.
  StringResult? manufacturingYear;

  /// The vehicle type.
  StringResult? vehicleType;

  /// The eligibility category.
  StringResult? eligibilityCategory;

  /// The specific document validity.
  StringResult? specificDocumentValidity;

  /// The visa type of the document.
  StringResult? visaType;

  /// The date of birth of the document owner.
  DateResult<StringResult>? dateOfBirth;

  /// The date of issue of the document.
  DateResult<StringResult>? dateOfIssue;

  /// The date of expiry of the document.
  DateResult<StringResult>? dateOfExpiry;

  /// Determines if date of expiry is permanent.
  ///
  bool? dateOfExpiryPermanent;

  /// The driver license detailed info.
  ///
  /// See [DriverLicenseDetailedInfo] for more information.
  DriverLicenseDetailedInfo<StringResult>? driverLicenseDetailedInfo;

  /// The dependents info.
  ///
  /// See [DependentInfo] for more information.
  List<DependentInfo>? dependentsInfo;

  /// The results of scanning each side of the document.
  ///
  /// See [SingleSideScanningResult] for more information.
  List<SingleSideScanningResult>? subResults;

  /// Returns the input image for the first scanning side in the Base64 format.
  /// or `null` if the input image is not available.
  String? firstInputImage;

  /// Returns the input image for the second scanning side in the Base64 format.
  /// or `null` if the input image is not available.
  String? secondInputImage;

  /// Returns the input image containing parsable barcode.
  /// or `null` if the barcode input image is not available.
  String? barcodeInputImage;

  /// Returns the cropped document image for the first scanning side.
  /// or `null` if the document image is not available.
  String? firstDocumentImage;

  /// Returns the cropped document image for the second scanning side.
  /// or `null` if the document image is not available.
  ///
  String? secondDocumentImage;

  /// Returns the cropped face image with additional info.
  /// or `null` if the face image is not available.
  ///
  /// See [DetailedCroppedImageResult] for more information.
  DetailedCroppedImageResult? faceImage;

  /// Returns the cropped signature image with additional info.
  /// or `null` if the signature image is not available.
  ///
  /// See [DetailedCroppedImageResult] for more information.
  DetailedCroppedImageResult? signatureImage;

  /// Represents the results of scanning a document.
  ///
  /// This class contains the results of scanning a document, including the extracted data
  /// and images from the document.
  BlinkIdScanningResult(Map<String, dynamic> nativeBlinkIdScanningResult) {
    recognitionMode = enumFromValue(
      RecognitionMode.values,
      nativeBlinkIdScanningResult["recognitionMode"],
    );
    documentClassInfo =
        nativeBlinkIdScanningResult['documentClassInfo'] != null
            ? DocumentClassInfo(
              Map<String, dynamic>.from(
                nativeBlinkIdScanningResult['documentClassInfo'],
              ),
            )
            : null;
    dataMatchResult =
        nativeBlinkIdScanningResult["dataMatchResult"] != null
            ? DataMatchResult(
              Map<String, dynamic>.from(
                nativeBlinkIdScanningResult["dataMatchResult"],
              ),
            )
            : null;

    firstName = createStringResult(nativeBlinkIdScanningResult, 'firstName');
    lastName = createStringResult(nativeBlinkIdScanningResult, 'lastName');
    fullName = createStringResult(nativeBlinkIdScanningResult, 'fullName');
    additionalNameInformation = createStringResult(
      nativeBlinkIdScanningResult,
      'additionalNameInformation',
    );
    localizedName = createStringResult(
      nativeBlinkIdScanningResult,
      'localizedName',
    );
    fathersName = createStringResult(
      nativeBlinkIdScanningResult,
      'fathersName',
    );
    mothersName = createStringResult(
      nativeBlinkIdScanningResult,
      'mothersName',
    );
    address = createStringResult(nativeBlinkIdScanningResult, 'address');
    additionalAddressInformation = createStringResult(
      nativeBlinkIdScanningResult,
      'additionalAddressInformation',
    );
    additionalOptionalAddressInformation = createStringResult(
      nativeBlinkIdScanningResult,
      'additionalOptionalAddressInformation',
    );
    placeOfBirth = createStringResult(
      nativeBlinkIdScanningResult,
      'placeOfBirth',
    );
    nationality = createStringResult(
      nativeBlinkIdScanningResult,
      'nationality',
    );
    race = createStringResult(nativeBlinkIdScanningResult, 'race');
    religion = createStringResult(nativeBlinkIdScanningResult, 'religion');
    profession = createStringResult(nativeBlinkIdScanningResult, 'profession');
    maritalStatus = createStringResult(
      nativeBlinkIdScanningResult,
      'maritalStatus',
    );
    residentialStatus = createStringResult(
      nativeBlinkIdScanningResult,
      'residentialStatus',
    );
    employer = createStringResult(nativeBlinkIdScanningResult, 'employer');
    sex = createStringResult(nativeBlinkIdScanningResult, 'sex');
    sponsor = createStringResult(nativeBlinkIdScanningResult, 'sponsor');
    bloodType = createStringResult(nativeBlinkIdScanningResult, 'bloodType');
    documentNumber = createStringResult(
      nativeBlinkIdScanningResult,
      'documentNumber',
    );
    personalIdNumber = createStringResult(
      nativeBlinkIdScanningResult,
      'personalIdNumber',
    );
    documentAdditionalNumber = createStringResult(
      nativeBlinkIdScanningResult,
      'documentAdditionalNumber',
    );
    documentOptionalAdditionalNumber = createStringResult(
      nativeBlinkIdScanningResult,
      'documentOptionalAdditionalNumber',
    );
    additionalPersonalIdNumber = createStringResult(
      nativeBlinkIdScanningResult,
      'additionalPersonalIdNumber',
    );
    issuingAuthority = createStringResult(
      nativeBlinkIdScanningResult,
      'issuingAuthority',
    );
    documentSubtype = createStringResult(
      nativeBlinkIdScanningResult,
      'documentSubtype',
    );
    remarks = createStringResult(nativeBlinkIdScanningResult, 'remarks');
    residencePermitType = createStringResult(
      nativeBlinkIdScanningResult,
      'residencePermitType',
    );
    manufacturingYear = createStringResult(
      nativeBlinkIdScanningResult,
      'manufacturingYear',
    );
    vehicleType = createStringResult(
      nativeBlinkIdScanningResult,
      'vehicleType',
    );
    eligibilityCategory = createStringResult(
      nativeBlinkIdScanningResult,
      'eligibilityCategory',
    );
    specificDocumentValidity = createStringResult(
      nativeBlinkIdScanningResult,
      'specificDocumentValidity',
    );
    visaType = createStringResult(nativeBlinkIdScanningResult, 'visaType');
    dateOfBirth =
        nativeBlinkIdScanningResult["dateOfBirth"] != null
            ? DateResult<StringResult>(
              Map<String, dynamic>.from(
                nativeBlinkIdScanningResult["dateOfBirth"],
              ),
            )
            : null;
    dateOfIssue =
        nativeBlinkIdScanningResult["dateOfIssue"] != null
            ? DateResult<StringResult>(
              Map<String, dynamic>.from(
                nativeBlinkIdScanningResult["dateOfIssue"],
              ),
            )
            : null;
    dateOfExpiry =
        nativeBlinkIdScanningResult["dateOfExpiry"] != null
            ? DateResult<StringResult>(
              Map<String, dynamic>.from(
                nativeBlinkIdScanningResult["dateOfExpiry"],
              ),
            )
            : null;
    dateOfExpiryPermanent =
        nativeBlinkIdScanningResult["dateOfExpiryPermanent"];
    driverLicenseDetailedInfo =
        nativeBlinkIdScanningResult["driverLicenseDetailedInfo"] != null
            ? DriverLicenseDetailedInfo<StringResult>(
              Map<String, dynamic>.from(
                nativeBlinkIdScanningResult["driverLicenseDetailedInfo"],
              ),
            )
            : null;
    dependentsInfo =
        nativeBlinkIdScanningResult["dependentsInfo"] != null
            ? (nativeBlinkIdScanningResult["dependentsInfo"] as List<dynamic>)
                .map((item) => DependentInfo(Map<String, dynamic>.from(item)))
                .toList()
            : null;
    subResults =
        nativeBlinkIdScanningResult["subResults"] != null
            ? (nativeBlinkIdScanningResult["subResults"] as List<dynamic>)
                .map(
                  (item) =>
                      SingleSideScanningResult(Map<String, dynamic>.from(item)),
                )
                .toList()
            : null;
    firstInputImage = nativeBlinkIdScanningResult["firstInputImage"];
    secondInputImage = nativeBlinkIdScanningResult["secondInputImage"];
    barcodeInputImage = nativeBlinkIdScanningResult["barcodeInputImage"];
    firstDocumentImage = nativeBlinkIdScanningResult["firstDocumentImage"];
    secondDocumentImage = nativeBlinkIdScanningResult["secondDocumentImage"];
    faceImage =
        nativeBlinkIdScanningResult["faceImage"] != null
            ? DetailedCroppedImageResult(
              Map<String, dynamic>.from(
                nativeBlinkIdScanningResult["faceImage"],
              ),
            )
            : null;
    signatureImage =
        nativeBlinkIdScanningResult["signatureImage"] != null
            ? DetailedCroppedImageResult(
              Map<String, dynamic>.from(
                nativeBlinkIdScanningResult["signatureImage"],
              ),
            )
            : null;
  }
}

/// Represents possible recognition modes.
enum RecognitionMode {
  /// No recognition performed.
  @JsonValue(0)
  none,

  /// Recognition of mrz document (does not include visa and passport).
  @JsonValue(1)
  mrzId,

  /// Recognition of visa mrz.
  @JsonValue(2)
  mrzVisa,

  /// Recognition of passport mrz.
  @JsonValue(3)
  mrzPassport,

  /// Recognition of documents that have face photo on the front.
  @JsonValue(4)
  photoId,

  /// Detailed document recognition.
  @JsonValue(5)
  fullRecognition,

  /// Recognition of barcode document.
  @JsonValue(6)
  barcodeId,
}

/// Represents the document class information.
class DocumentClassInfo {
  /// The document country.
  ///
  /// See [Country] for more information.
  Country? country;

  /// The document region.
  ///
  /// See [Region] for more information.
  Region? region;

  /// The type of the scanned document.
  ///
  /// See [DocumentType] for more information.
  DocumentType? documentType;

  /// Flag that indicates if the document class information is empty
  ///
  bool? empty;

  /// The name of the country that issued the scanned document.
  String? countryName;

  /// The ISO numeric code of the country that issued the scanned document.
  String? isoNumericCountryCode;

  /// The 2 letter ISO code of the country that issued the scanned document.
  String? isoAlpha2CountryCode;

  /// The 3 letter ISO code of the country that issued the scanned document.
  String? isoAlpha3CountryCode;

  /// Represents the document class information.
  DocumentClassInfo(Map<String, dynamic> nativeClassInfo) {
    country = enumFromValue(
      Country.values.toList(),
      nativeClassInfo['country'],
    );
    region = enumFromValue(Region.values.toList(), nativeClassInfo['region']);
    documentType = enumFromValue(
      DocumentType.values.toList(),
      nativeClassInfo['documentType'],
    );
    empty = nativeClassInfo['empty'];
    countryName = nativeClassInfo['countryName'];
    isoNumericCountryCode = nativeClassInfo['isoNumericCountryCode'];
    isoAlpha2CountryCode = nativeClassInfo['isoAlpha2CountryCode'];
    isoAlpha3CountryCode = nativeClassInfo['isoAlpha3CountryCode'];
  }
}

/// Represents the result of the data match.
class DataMatchResult {
  ///  The state of the data match on the whole document.
  ///
  /// See [DataMatchState] for more information.
  DataMatchState? overallState;

  /// The data match state of each field.
  ///
  /// See [DataMatchResultField] for more information.
  List<DataMatchResultField>? states;

  /// Represents the result of the data match.
  DataMatchResult(Map<String, dynamic> nativeDataMatchResult) {
    overallState = enumFromValue(
      DataMatchState.values,
      nativeDataMatchResult["overallState"],
    );
    states =
        nativeDataMatchResult["states"] != null
            ? (nativeDataMatchResult["states"] as List<dynamic>)
                .map(
                  (item) =>
                      DataMatchResultField(Map<String, dynamic>.from(item)),
                )
                .toList()
            : null;
  }
}

/// Represents the state of the field in the data match.
class DataMatchResultField {
  /// The type of the field.
  ///
  /// See [DataMatchField] for more information.
  DataMatchField? field;

  /// The state of the field.
  ///
  /// See [DataMatchState] for more information.
  DataMatchState? state;

  /// Represents the state of the field in the data match.
  DataMatchResultField(Map<String, dynamic> nativeDataMatchResultField) {
    field = enumFromValue(
      DataMatchField.values,
      nativeDataMatchResultField["field"],
    );
    state = enumFromValue(
      DataMatchState.values,
      nativeDataMatchResultField["state"],
    );
  }
}

/// Represents the type of the field used in data match.
enum DataMatchField {
  /// The date of birth field.
  @JsonValue(0)
  dateOfBirth,

  /// The date of expiry field.
  @JsonValue(1)
  dateOfExpiry,

  /// The document number field.
  @JsonValue(2)
  documentNumber,

  /// The document additional number field.
  @JsonValue(3)
  documentAdditionalNumber,

  /// The document optional additional number field.
  @JsonValue(4)
  documentOptionalAdditionalNumber,

  /// The personal ID number field.
  @JsonValue(5)
  personalIdNumber,
}

/// Represents the state of the data match.
enum DataMatchState {
  /// Data matching has not been performed.
  @JsonValue(0)
  notPerformed,

  /// Data does not match.
  @JsonValue(1)
  failed,

  /// Data does match.
  @JsonValue(2)
  success,
}

/// Represents the multi-alphabet string result extracted from the OCR.
/// The result contains the extracted strings, their locations, and the sides of the extracted strings.
class StringResult {
  ///  All strings separated by new line
  String? value;

  /// String for field in latin alphabet
  String? latin;

  /// String for field in arabic alphabet
  String? arabic;

  /// String for field in cyrillic alphabet
  String? cyrillic;

  /// String for field in greek alphabet
  String? greek;

  /// Document field location
  ///
  /// See [Location] for more information.
  Location? location;

  /// The document side where the field is located.
  ///
  /// See [Side] for more information.
  Side? side;

  /// Represents the multi-alphabet string result extracted from the OCR.
  /// The result contains the extracted strings, their locations, and the sides of the extracted strings.
  StringResult(Map<String, dynamic> nativeStringResult) {
    value = nativeStringResult['value'];
    latin = nativeStringResult['latin'];
    arabic = nativeStringResult['arabic'];
    cyrillic = nativeStringResult['cyrillic'];
    greek = nativeStringResult['greek'];
    location =
        nativeStringResult['location'] != null
            ? Location(
              Map<String, dynamic>.from(nativeStringResult['location']),
            )
            : null;
    side =
        nativeStringResult['side'] != null
            ? Side(Map<String, dynamic>.from(nativeStringResult['side']))
            : null;
  }
}

/// Represents the rectangle location of each document field
class Rectangle {
  /// X location
  double? x;

  /// Y location
  double? y;

  /// Rectangle width
  double? width;

  /// Rectangle height
  double? height;

  /// Represents rectangle location of each document field
  Rectangle(Map<String, dynamic> nativeRect) {
    x = nativeRect['x'] != null ? nativeRect['x'] * 1.0 : null;
    y = nativeRect['y'] != null ? nativeRect['y'] * 1.0 : null;
    width = nativeRect['width'] != null ? nativeRect['width'] * 1.0 : null;
    height = nativeRect['height'] != null ? nativeRect['height'] * 1.0 : null;
  }
}

/// Represents the information about the location of an element within a document or image.
class Location {
  /// Rectangle location of the result extracted from the OCR in the latin alphabet.
  Rectangle? latin;

  /// Rectangle location of the result extracted from the OCR in the arabic alphabet.
  Rectangle? arabic;

  /// Rectangle location of the result extracted from the OCR in the cyrillic alphabet.
  Rectangle? cyrillic;

  /// Rectangle location of the result extracted from the OCR in the greek alphabet.
  Rectangle? greek;

  /// Represents the information about the location of an element within a document or image.
  Location(Map<String, dynamic> nativeLocation) {
    latin =
        nativeLocation['latin'] != null
            ? Rectangle(Map<String, dynamic>.from(nativeLocation['latin']))
            : null;
    arabic =
        nativeLocation['arabic'] != null
            ? Rectangle(Map<String, dynamic>.from(nativeLocation['arabic']))
            : null;
    cyrillic =
        nativeLocation['cyrillic'] != null
            ? Rectangle(Map<String, dynamic>.from(nativeLocation['cyrillic']))
            : null;
    greek =
        nativeLocation['greek'] != null
            ? Rectangle(Map<String, dynamic>.from(nativeLocation['greek']))
            : null;
  }
}

/// Side of the document on which the specific result is located.
class Side {
  /// Document side of the result extracted from the OCR in the latin alphabet.
  DocumentSide? latin;

  /// Document side of the result extracted from the OCR in the arabic alphabet.
  DocumentSide? arabic;

  /// Document side of the result extracted from the OCR in the cyrillic alphabet.
  DocumentSide? cyrillic;

  /// Document side of the result extracted from the OCR in the cyrillic alphabet.
  DocumentSide? greek;

  /// Side of the document on which the specific result is located.
  Side(Map<String, dynamic> nativeSide) {
    latin = enumFromValue(DocumentSide.values, nativeSide['latin']);
    arabic = enumFromValue(DocumentSide.values, nativeSide['arabic']);
    cyrillic = enumFromValue(DocumentSide.values, nativeSide['cyrillic']);
    greek = enumFromValue(DocumentSide.values, nativeSide['greek']);
  }
}

/// Define document side where the document field is located
enum DocumentSide {
  ///The field was not detected
  none,

  ///The field is located on the front side of the document
  front,

  ///The field is located on the back side of the document
  back,
}

/// Represents the result of the date extraction.
/// Contains the extracted date, along with additional date information.
class DateResult<T> {
  /// The extracted date information.
  ///
  /// See [Date] for more information.
  Date? date;

  /// Original string representation of the date which has been extracted.
  ///
  /// Depending of the information source, it can either be of type [StringResult] or [String].
  T? originalString;

  /// Indicates that date does not appear on the document but is filled by our internal domain knowledge.
  bool? isFilledByDomainKnowledge;

  /// Indicates whether date was successfully parsed.
  bool? successfullyParsed;

  /// Represents the result of the date extraction.
  /// Contains the extracted date, along with additional date information.
  DateResult(Map<String, dynamic> nativeDateResult) {
    date = Date(nativeDateResult);
    originalString = handleStringType(nativeDateResult, "originalString");
    isFilledByDomainKnowledge = nativeDateResult["isFilledByDomainKnowledge"];
    successfullyParsed = nativeDateResult["successfullyParsed"];
  }
}

/// Represents the extracted date.
class Date {
  /// Day of the month.
  /// The first day of the month has value 1.
  int? day;

  /// Month of the year.
  /// The first month of the year has value 1.
  int? month;

  /// Full year.
  int? year;

  /// Represents the extracted date.
  Date(Map<String, dynamic> nativeDate) {
    day = nativeDate['day'];
    month = nativeDate['month'];
    year = nativeDate['year'];
  }
}

StringResult? createStringResult(
  Map<String, dynamic> result,
  String propertyName,
) {
  return result[propertyName] != null
      ? StringResult(Map<String, dynamic>.from(result[propertyName]))
      : null;
}

///  Represents detailed extracted information about the driver license.
class DriverLicenseDetailedInfo<T> {
  ///  The restrictions to driving privileges for the United States driver license owner.
  ///
  /// Depending of the information source, it can either be of type [StringResult] or [String].
  T? restrictions;

  ///  The additional privileges granted to the US driver license owner.
  ///
  /// Depending of the information source, it can either be of type [StringResult] or [String].
  T? endorsements;

  /// The type of vehicle the driver license owner has privilege to drive.
  ///
  /// Depending of the information source, it can either be of type [StringResult] or [String].
  T? vehicleClass;

  /// The driver license conditions.
  ///
  /// Depending of the information source, it can either be of type [StringResult] or [String].
  T? conditions;

  /// The additional information on vehicle class.
  ///
  /// See [VehicleClassInfo] for more information.
  List<VehicleClassInfo>? vehicleClassesInfo;

  ///  Represents detailed extracted information about the driver license.
  DriverLicenseDetailedInfo(
    Map<String, dynamic> nativeDriverLicenseDetailedInfo,
  ) {
    restrictions = handleStringType(
      nativeDriverLicenseDetailedInfo,
      'restrictions',
    );
    endorsements = handleStringType(
      nativeDriverLicenseDetailedInfo,
      'endorsements',
    );
    vehicleClass = handleStringType(
      nativeDriverLicenseDetailedInfo,
      'vehicleClass',
    );
    conditions = handleStringType(
      nativeDriverLicenseDetailedInfo,
      'conditions',
    );
    vehicleClassesInfo =
        nativeDriverLicenseDetailedInfo['vehicleClassesInfo'] != null
            ? List<VehicleClassInfo<T>>.from(
              nativeDriverLicenseDetailedInfo['vehicleClassesInfo'].map(
                (v) => VehicleClassInfo<T>(v),
              ),
            )
            : null;
  }
}

/// Represents the information about the vehicle class extraction.
class VehicleClassInfo<T> {
  /// The type of driver licence.
  ///
  /// Depending of the information source, it can either be of type [StringResult] or [String].
  T? licenceType;

  /// The type of vehicle the driver license owner has privilege to drive.
  ///
  /// Depending of the information source, it can either be of type [StringResult] or [String].
  T? vehicleClass;

  /// The date since licence is effective.
  /// See [DateResult] for more information.
  DateResult<T>? effectiveDate;

  /// The date of expiry of licence.
  DateResult<T>? expiryDate;

  /// Represents the information about the vehicle class extraction.
  VehicleClassInfo(Map<String, dynamic> nativeVehicleClassInfo) {
    licenceType = handleStringType(nativeVehicleClassInfo, 'licenceType');
    vehicleClass = handleStringType(nativeVehicleClassInfo, 'vehicleClass');
    effectiveDate =
        nativeVehicleClassInfo['effectiveDate'] != null
            ? DateResult<T>(
              Map<String, dynamic>.from(
                nativeVehicleClassInfo['effectiveDate'],
              ),
            )
            : null;
    expiryDate =
        nativeVehicleClassInfo['expiryDate'] != null
            ? DateResult<T>(
              Map<String, dynamic>.from(nativeVehicleClassInfo['expiryDate']),
            )
            : null;
  }
}

/// Information about the dependent.
class DependentInfo {
  /// The date of birth of the dependent.
  DateResult<StringResult>? dateOfBirth;

  /// The sex or gender of the dependent.
  StringResult? sex;

  /// The document number of the dependent.
  StringResult? documentNumber;

  /// The full name of the dependent.
  StringResult? fullName;

  /// Checks if the dependent's information is empty.
  bool? empty;

  /// Information about the dependent.
  DependentInfo(Map<String, dynamic> nativeDependentInfo) {
    dateOfBirth =
        nativeDependentInfo['dateOfBirth'] != null
            ? DateResult<StringResult>(
              Map<String, dynamic>.from(nativeDependentInfo['dateOfBirth']),
            )
            : null;
    sex = createStringResult(nativeDependentInfo, 'sex');
    documentNumber = createStringResult(nativeDependentInfo, 'documentNumber');
    fullName = createStringResult(nativeDependentInfo, 'fullName');
    empty = nativeDependentInfo['empty'];
  }
}

///Represents the result of scanning a single side of the document.
///
/// Contains the data extracted from the Visual Inspection Zone, Machine Readable Zone,
/// barcode, the input image, and the cropped document, face, and signature images.
class SingleSideScanningResult {
  /// The data extracted from the Visual Inspection Zone.
  VizResult? viz;

  /// The data extracted from the Machine Readable Zone.
  MrzResult? mrz;

  /// The data extracted from the barcode.
  BarcodeResult? barcode;

  /// The input image in the Base64 format.
  String? inputImage;

  /// The input image containing parsable barcode in the Base64 format.
  String? barcodeInputImage;

  /// The cropped document image in the Base64 format.
  String? documentImage;

  /// The cropped face image with additional info.
  DetailedCroppedImageResult? faceImage;

  /// The cropped signature image with additional info.
  DetailedCroppedImageResult? signatureImage;

  ///Represents the result of scanning a single side of the document.
  ///
  /// Contains the data extracted from the Visual Inspection Zone, Machine Readable Zone,
  /// barcode, the input image, and the cropped document, face, and signature images.
  SingleSideScanningResult(
    Map<String, dynamic> nativeSingleSideScanningResult,
  ) {
    viz =
        nativeSingleSideScanningResult["viz"] != null
            ? VizResult(
              Map<String, dynamic>.from(nativeSingleSideScanningResult['viz']),
            )
            : null;
    mrz =
        nativeSingleSideScanningResult["mrz"] != null
            ? MrzResult(
              Map<String, dynamic>.from(nativeSingleSideScanningResult['mrz']),
            )
            : null;
    barcode =
        nativeSingleSideScanningResult["barcode"] != null
            ? BarcodeResult(
              Map<String, dynamic>.from(
                nativeSingleSideScanningResult['barcode'],
              ),
            )
            : null;
    inputImage = nativeSingleSideScanningResult["inputImage"];
    barcodeInputImage = nativeSingleSideScanningResult["barcodeInputImage"];
    documentImage = nativeSingleSideScanningResult["documentImage"];
    faceImage =
        nativeSingleSideScanningResult["faceImage"] != null
            ? DetailedCroppedImageResult(
              Map<String, dynamic>.from(
                nativeSingleSideScanningResult["faceImage"],
              ),
            )
            : null;
    signatureImage =
        nativeSingleSideScanningResult["signatureImage"] != null
            ? DetailedCroppedImageResult(
              Map<String, dynamic>.from(
                nativeSingleSideScanningResult["signatureImage"],
              ),
            )
            : null;
  }
}

/// Represents the result of the Visual Inspection Zone of a document.
class VizResult {
  /// The first name of the document owner.
  StringResult? firstName;

  /// The last name of the document owner.
  StringResult? lastName;

  /// The full name of the document owner.
  StringResult? fullName;

  /// The additional name information of the document owner.
  StringResult? additionalNameInformation;

  /// The localized name of the document owner.
  StringResult? localizedName;

  /// The fathers name of the document owner.
  StringResult? fathersName;

  /// The mothers name of the document owner.
  StringResult? mothersName;

  /// The address of the document owner.
  StringResult? address;

  /// THe additional address information of the document owner.
  StringResult? additionalAddressInformation;

  /// The one more additional address information of the document own
  StringResult? additionalOptionalAddressInformation;

  /// The place of birth of the document owner.
  StringResult? placeOfBirth;

  /// The nationality of the document owner.
  StringResult? nationality;

  /// The race of the document owner.
  StringResult? race;

  /// The religion of the document owner.
  StringResult? religion;

  /// The profession of the document owner.
  StringResult? profession;

  /// The marital status of the document owner.
  StringResult? maritalStatus;

  /// The residential status of the document owner.
  StringResult? residentialStatus;

  /// The employer of the document owner.
  StringResult? employer;

  /// The sex of the document owner.
  StringResult? sex;

  /// The sponsor of the document owner.
  StringResult? sponsor;

  /// The blood type of the document owner.
  StringResult? bloodType;

  /// The date of birth of the document owner.
  DateResult? dateOfBirth;

  /// The date of issue of the document.
  DateResult? dateOfIssue;

  /// The date of expiry of the document.
  DateResult? dateOfExpiry;

  /// Determines if date of expiry is permanent.
  bool? dateOfExpiryPermanent;

  /// The document number.
  StringResult? documentNumber;

  /// The personal identification number.
  StringResult? personalIdNumber;

  /// The additional number of the document.
  StringResult? documentAdditionalNumber;

  /// The one more additional number of the document.
  StringResult? documentOptionalAdditionalNumber;

  /// The additional personal identification number.
  StringResult? additionalPersonalIdNumber;

  /// The issuing authority of the document.
  StringResult? issuingAuthority;

  /// The visa type of the document.
  StringResult? visaType;

  /// The driver license detailed info.
  DriverLicenseDetailedInfo<StringResult>? driverLicenseDetailedInfo;

  /// The transcription of the document subtype.
  StringResult? documentSubtype;

  /// The remarks on the residence permit.
  StringResult? remarks;

  /// The residence permit type.
  StringResult? residencePermitType;

  /// The manufacturing year.
  StringResult? manufacturingYear;

  /// The vehicle type.
  StringResult? vehicleType;

  /// The eligibility category.
  StringResult? eligibilityCategory;

  /// The specific document validity.
  StringResult? specificDocumentValidity;

  /// The dependents info.
  List<DependentInfo>? dependentsInfo;

  /// The vehicle owner.
  StringResult? vehicleOwner;

  /// Represents the result of the Visual Inspection Zone of a document.
  VizResult(Map<String, dynamic> nativeVizResult) {
    firstName = createStringResult(nativeVizResult, 'firstName');
    lastName = createStringResult(nativeVizResult, 'lastName');
    fullName = createStringResult(nativeVizResult, 'fullName');
    additionalNameInformation = createStringResult(
      nativeVizResult,
      'additionalNameInformation',
    );
    localizedName = createStringResult(nativeVizResult, 'localizedName');
    fathersName = createStringResult(nativeVizResult, 'fathersName');
    mothersName = createStringResult(nativeVizResult, 'mothersName');
    address = createStringResult(nativeVizResult, 'address');
    additionalAddressInformation = createStringResult(
      nativeVizResult,
      'additionalAddressInformation',
    );
    additionalOptionalAddressInformation = createStringResult(
      nativeVizResult,
      'additionalOptionalAddressInformation',
    );
    placeOfBirth = createStringResult(nativeVizResult, 'placeOfBirth');
    nationality = createStringResult(nativeVizResult, 'nationality');
    race = createStringResult(nativeVizResult, 'race');
    religion = createStringResult(nativeVizResult, 'religion');
    profession = createStringResult(nativeVizResult, 'profession');
    maritalStatus = createStringResult(nativeVizResult, 'maritalStatus');
    residentialStatus = createStringResult(
      nativeVizResult,
      'residentialStatus',
    );
    employer = createStringResult(nativeVizResult, 'employer');
    sex = createStringResult(nativeVizResult, 'sex');
    sponsor = createStringResult(nativeVizResult, 'sponsor');
    bloodType = createStringResult(nativeVizResult, 'bloodType');
    dateOfBirth =
        nativeVizResult["dateOfBirth"] != null
            ? DateResult(
              Map<String, dynamic>.from(nativeVizResult["dateOfBirth"]),
            )
            : null;
    dateOfIssue =
        nativeVizResult["dateOfIssue"] != null
            ? DateResult(
              Map<String, dynamic>.from(nativeVizResult["dateOfIssue"]),
            )
            : null;
    dateOfExpiry =
        nativeVizResult["dateOfExpiry"] != null
            ? DateResult(
              Map<String, dynamic>.from(nativeVizResult["dateOfExpiry"]),
            )
            : null;
    dateOfExpiryPermanent = nativeVizResult["dateOfExpiryPermanent"];
    documentNumber = createStringResult(nativeVizResult, 'documentNumber');
    personalIdNumber = createStringResult(nativeVizResult, 'personalIdNumber');
    documentAdditionalNumber = createStringResult(
      nativeVizResult,
      'documentAdditionalNumber',
    );
    documentOptionalAdditionalNumber = createStringResult(
      nativeVizResult,
      'documentOptionalAdditionalNumber',
    );
    additionalPersonalIdNumber = createStringResult(
      nativeVizResult,
      'additionalPersonalIdNumber',
    );
    issuingAuthority = createStringResult(nativeVizResult, 'issuingAuthority');
    visaType = createStringResult(nativeVizResult, 'visaType');
    driverLicenseDetailedInfo =
        nativeVizResult["driverLicenseDetailedInfo"] != null
            ? DriverLicenseDetailedInfo(
              Map<String, dynamic>.from(
                nativeVizResult["driverLicenseDetailedInfo"],
              ),
            )
            : null;

    documentSubtype = createStringResult(nativeVizResult, 'documentSubtype');
    remarks = createStringResult(nativeVizResult, 'remarks');
    residencePermitType = createStringResult(
      nativeVizResult,
      'residencePermitType',
    );
    manufacturingYear = createStringResult(
      nativeVizResult,
      'manufacturingYear',
    );
    vehicleType = createStringResult(nativeVizResult, 'vehicleType');
    eligibilityCategory = createStringResult(
      nativeVizResult,
      'eligibilityCategory',
    );
    specificDocumentValidity = createStringResult(
      nativeVizResult,
      'specificDocumentValidity',
    );
    dependentsInfo =
        nativeVizResult["dependentsInfo"] != null
            ? (nativeVizResult["dependentsInfo"] as List<dynamic>)
                .map((item) => DependentInfo(Map<String, dynamic>.from(item)))
                .toList()
            : null;
    vehicleOwner = createStringResult(nativeVizResult, 'vehicleOwner');
  }
}

/// Represents the result of the MRZ recognition.
class MrzResult {
  /// The entire Machine Readable Zone text from ID.
  String? rawMRZString;

  /// The document code. Document code contains two characters.
  /// For MRTD the first character shall be A, C or I.
  /// The second character shall be discretion of the issuing State or organization except
  /// that V shall not be used, and `C` shall not be used after `A` except in the crew member certificate.
  ///
  /// On machine-readable passports (MRP) first character shall be `P` to designate an MRP. One additional
  /// letter may be used, at the discretion of the issuing State or organization, to designate a particular
  ///  MRP.
  /// If the second character position is not used for this purpose, it shall be filled by the filter character.
  String? documentCode;

  /// three-letter or two-letter code which indicate the issuing State. Three-letter codes are based
  /// on Aplha-3 codes for entities specified in ISO 3166-1, with extensions for certain States. Two-letter
  /// codes are based on Aplha-2 codes for entities specified in ISO 3166-1, with extensions for certain States.
  String? issuer;

  /// The document number.
  String? documentNumber;

  /// The first optional data. Empty string if not available.
  String? opt1;

  /// The second optional data. Empty string if not available.
  String? opt2;

  /// The gender of the document holder.
  /// Gender is specified by use of the single initial.
  String? gender;

  ///  The nationality of the document holder represented by a three-letter or two-letter code.
  /// Three-letter codes are based on Alpha-3 codes for entities specified in ISO 3166-1, with extensions for certain
  /// States.
  /// Two-letter codes are based on Aplha-2 codes for entities specified in ISO 3166-1, with extensions for certain States.
  String? nationality;

  /// The primary indentifier. If there is more than one component, they are separated with space.
  String? primaryID;

  /// The secondary identifier. If there is more than one component, they are separated with space.
  String? secondaryID;

  /// The full issuer name that is expanded from the three-letter or two-letter code which indicate
  /// the issuing State.
  String? issuerName;

  /// The full nationality of the document holder, which is expanded from the three-letter or two-letter
  /// nationality code.
  String? nationalityName;

  /// Whether the MRZ is verified.
  /// If the MRZ is verified, it means that all check digits are correct.
  bool? verified;

  /// The date of birth of the document holder.
  DateResult<String>? dateOfBirth;

  /// The date of expiry of the document.
  DateResult<String>? dateOfExpiry;

  /// The type of the document.
  MRZDocumentType? documentType;

  /// The sanitized first optional data. Result without additional '<' characters if they exist.
  String? sanitizedOpt1;

  /// The sanitized second optional data. Result without additional '<' characters if they exist.
  String? sanitizedOpt2;

  /// The sanitized nationality. Result without additional '<' characters if they exist.
  String? sanitizedNationality;

  /// The sanitized issuer. Result without additional '<' characters if they exist.
  String? sanitizedIssuer;

  /// The sanitized document code. Result without additional '<' characters if they exist.
  String? sanitizedDocumentCode;

  /// The sanitized document number. Result without additional '<' characters if they exist.
  String? sanitizedDocumentNumber;

  /// Represents the result of the MRZ recognition.
  MrzResult(Map<String, dynamic> nativeMRZResult) {
    documentType = enumFromValue(
      MRZDocumentType.values,
      nativeMRZResult["documentType"],
    );
    primaryID = nativeMRZResult['primaryId'];
    secondaryID = nativeMRZResult['secondaryId'];
    issuer = nativeMRZResult['issuer'];
    dateOfBirth =
        nativeMRZResult['dateOfBirth'] != null
            ? DateResult(
              Map<String, dynamic>.from(nativeMRZResult['dateOfBirth']),
            )
            : null;
    documentNumber = nativeMRZResult['documentNumber'];
    nationality = nativeMRZResult['nationality'];
    gender = nativeMRZResult['gender'];
    documentCode = nativeMRZResult['documentCode'];
    dateOfExpiry =
        nativeMRZResult['dateOfExpiry'] != null
            ? DateResult(
              Map<String, dynamic>.from(nativeMRZResult['dateOfExpiry']),
            )
            : null;
    opt1 = nativeMRZResult['opt1'];
    opt2 = nativeMRZResult['opt2'];
    rawMRZString = nativeMRZResult['rawMRZString'];
    verified = nativeMRZResult['mrzVerified'];
    sanitizedOpt1 = nativeMRZResult['sanitizedOpt1'];
    sanitizedOpt2 = nativeMRZResult['sanitizedOpt2'];
    sanitizedNationality = nativeMRZResult['sanitizedNationality'];
    sanitizedIssuer = nativeMRZResult['sanitizedIssuer'];
    sanitizedDocumentCode = nativeMRZResult['sanitizedDocumentCode'];
    sanitizedDocumentNumber = nativeMRZResult['sanitizedDocumentNumber'];
  }
}

///  Represents the data extracted from the barcode.
class BarcodeResult {
  /// The raw, unparsed barcode data.
  BarcodeData? barcodeData;

  /// The first name of the document owner.
  String? firstName;

  /// The middle name of the document owner.
  String? middleName;

  /// The last name of the document owner.
  String? lastName;

  /// The full name of the document owner.
  String? fullName;

  /// The additional name information of the document owner.
  String? additionalNameInformation;

  /// The address of the document owner.
  String? address;

  /// The place of birth of the document owner.
  String? placeOfBirth;

  /// The nationality of the document owner.
  String? nationality;

  /// The race of the document owner.
  String? race;

  /// The religion of the document owner.
  String? religion;

  /// The profession of the document owner.
  String? profession;

  /// The marital status of the document owner.
  String? maritalStatus;

  /// The residential status of the document owner.
  String? residentialStatus;

  /// The employer of the document owner.
  String? employer;

  /// The sex of the document owner.
  String? sex;

  /// The date of birth of the document owner.
  DateResult<String>? dateOfBirth;

  /// The date of issue of the document.
  DateResult<String>? dateOfIssue;

  /// The date of expiry of the document.
  DateResult<String>? dateOfExpiry;

  /// The document number.
  String? documentNumber;

  /// The personal identification number.
  String? personalIdNumber;

  /// The additional number of the document.
  String? documentAdditionalNumber;

  /// The issuing authority of the document.
  String? issuingAuthority;

  /// The details about the address of the document owner.
  AddressDetailedInfo? addressDetailedInfo;

  /// The driver license detailed info.
  DriverLicenseDetailedInfo<String>? driverLicenseDetailedInfo;

  /// Document specific extended elements that contain all barcode fields in their original form.
  ///
  /// Currently this is only filled for AAMVACompliant documents.
  BarcodeExtendedElements? extendedElements;

  ///  Represents the data extracted from the barcode.
  BarcodeResult(Map<String, dynamic> nativeBarcodeResult) {
    barcodeData =
        nativeBarcodeResult['barcodeData'] != null
            ? BarcodeData(
              Map<String, dynamic>.from(nativeBarcodeResult['barcodeData']),
            )
            : null;
    firstName = nativeBarcodeResult['firstName'];
    middleName = nativeBarcodeResult['middleName'];
    lastName = nativeBarcodeResult['lastName'];
    fullName = nativeBarcodeResult['fullName'];
    additionalNameInformation =
        nativeBarcodeResult['additionalNameInformation'];
    address = nativeBarcodeResult['address'];
    placeOfBirth = nativeBarcodeResult['placeOfBirth'];
    nationality = nativeBarcodeResult['nationality'];
    race = nativeBarcodeResult['race'];
    religion = nativeBarcodeResult['religion'];
    profession = nativeBarcodeResult['profession'];
    maritalStatus = nativeBarcodeResult['maritalStatus'];
    residentialStatus = nativeBarcodeResult['residentialStatus'];
    employer = nativeBarcodeResult['employer'];
    sex = nativeBarcodeResult['sex'];
    dateOfBirth =
        nativeBarcodeResult['dateOfBirth'] != null
            ? DateResult<String>(
              Map<String, dynamic>.from(nativeBarcodeResult['dateOfBirth']),
            )
            : null;
    dateOfBirth =
        nativeBarcodeResult['dateOfIssue'] != null
            ? DateResult<String>(
              Map<String, dynamic>.from(nativeBarcodeResult['dateOfIssue']),
            )
            : null;
    dateOfBirth =
        nativeBarcodeResult['dateOfExpiry'] != null
            ? DateResult<String>(
              Map<String, dynamic>.from(nativeBarcodeResult['dateOfExpiry']),
            )
            : null;
    documentNumber = nativeBarcodeResult['documentNumber'];
    personalIdNumber = nativeBarcodeResult['personalIdNumber'];
    documentAdditionalNumber = nativeBarcodeResult['documentAdditionalNumber'];
    issuingAuthority = nativeBarcodeResult['issuingAuthority'];
    addressDetailedInfo =
        nativeBarcodeResult['addressDetailedInfo'] != null
            ? AddressDetailedInfo(
              Map<String, dynamic>.from(
                nativeBarcodeResult['addressDetailedInfo'],
              ),
            )
            : null;
    driverLicenseDetailedInfo =
        nativeBarcodeResult['driverLicenseDetailedInfo'] != null
            ? DriverLicenseDetailedInfo<String>(
              Map<String, dynamic>.from(
                nativeBarcodeResult['driverLicenseDetailedInfo'],
              ),
            )
            : null;
    extendedElements =
        nativeBarcodeResult['extendedElements'] != null
            ? BarcodeExtendedElements(
              Map<String, dynamic>.from(
                nativeBarcodeResult['extendedElements'],
              ),
            )
            : null;
  }
}

/// Represents the raw, unparsed data extracted from a scanned barcode.
class BarcodeData {
  /// Type of the scanned barcode.
  BarcodeType? barcodeType;

  /// Raw bytes of the barcode content.
  String? rawData;

  /// String representation of the barcode content.
  String? stringData;

  /// Whether the barcode data is uncertain, i.e. if scanned barcode was incomplete or has parts of it missing.
  bool? uncertain;

  /// Represents the raw, unparsed data extracted from a scanned barcode.
  BarcodeData(Map<String, dynamic> nativeBarcodeData) {
    barcodeType = enumFromValue(
      BarcodeType.values,
      nativeBarcodeData["barcodeType"],
    );
    rawData = nativeBarcodeData["rawData"];
    stringData = nativeBarcodeData["stringData"];
    uncertain = nativeBarcodeData["uncertain"];
  }
}

/// Represents the type of scanned barcode
enum BarcodeType {
  /// No barcode was scanned
  none,

  /// QR code was scanned
  qrCode,

  /// Data Matrix 2D barcode was scanned
  dataMatrix,

  /// UPC E barcode was scanned
  upce,

  /// UPC A barcode was scanned
  upca,

  /// EAN 8 barcode was scanned
  ean8,

  /// EAN 13 barcode was scanned
  ean13,

  /// Code 128 barcode was scanned
  code128,

  /// Code 39 barcode was scanned
  code39,

  /// ITF barcode was scanned
  itf,

  /// Aztec 2D barcode was scanned
  aztec,

  /// PDF417 2D barcode was scanned
  pdf417,
}

/// Detailed information about the address.
class AddressDetailedInfo {
  /// The address street portion of the document owner.
  String? street;

  /// The address postal code portion of the document owner.
  String? postalCode;

  /// The address city portion of the document owner.
  String? city;

  /// The address jurisdiction code portion of the document owner.
  String? jurisdiction;

  /// Detailed information about the address.
  AddressDetailedInfo(Map<String, dynamic> nativeAddressDetailedInfo) {
    street = nativeAddressDetailedInfo["street"];
    postalCode = nativeAddressDetailedInfo["postalCode"];
    city = nativeAddressDetailedInfo["city"];
    jurisdiction = nativeAddressDetailedInfo["jurisdiction"];
  }
}

/// Represents the fields present in the barcode.
/// Currently this is only used for AAMVACompliant documents.
class BarcodeExtendedElements {
  /// Mandatory on all AAMVA and Magnetic barcodes.
  /// On compact barcodes, use kFullAddress.
  ///
  /// City portion of the cardholder address.
  String? addressCity;

  /// Mandatory on all AAMVA and Magnetic barcodes.
  /// On compact barcodes, use kFullAddress.
  ///
  /// State portion of the cardholder address.
  String? addressJurisdictionCode;

  /// Mandatory on all AAMVA and Magnetic barcodes.
  /// On compact barcodes, use kFullAddress.
  ///
  /// Postal code portion of the cardholder address in the U.S. and Canada.
  /// If the trailing portion of the postal code in the U.S. is not known, zeros can be used
  /// to fill the trailing set of numbers up to nine (9) digits.
  String? addressPostalCode;

  /// Mandatory on all AAMVA and Magnetic barcodes.
  /// On compact barcodes, use kFullAddress.
  ///
  /// Street portion of the cardholder address.
  /// The place where the registered driver of a vehicle (individual or corporation)
  /// may be contacted such as a house number, street address, etc.
  String? addressStreet;

  /// Optional on all AAMVA barcodes.
  /// On Compact barcodes, use kFullAddress.
  ///
  /// Second line of street portion of the cardholder address.
  String? addressStreet2;

  /// Optional on AAMVA 01. (MMDDCCYY format)
  ///
  /// ALTERNATIVE DATES(S) given as date of birth.
  String? akaDateOfBirth;

  /// Optional on all AAMVA and Compact barcodes.
  /// Other family name by which the cardholder is known.
  String? akaFamilyName;

  /// Optional on all AAMVA and Compact barcodes.
  ///
  /// Other name by which the cardholder is known. ALTERNATIVE NAME(S) of the individual
  /// holding the Driver License or ID.
  ///
  /// The Name field contains up to four portions, separated with the "," delimiter:
  /// AKA Last Name (required)
  /// , (required)
  /// AKA First Name (required)
  /// , (required if other name portions follow, otherwise optional)
  /// AKA Middle Name(s) (optional)
  /// , (required if other name portions follow, otherwise optional)
  /// AKA Suffix (optional)
  /// , (optional)
  ///
  /// If the individual has more than one AKA middle name they are separated with space.
  String? akaFullName;

  /// Optional on all AAMVA and Compact barcodes.
  ///
  /// Other given name by which the cardholder is known
  String? akaGivenName;

  /// Optional on AAMVA 01 barcodes.
  ///
  /// ALTERNATIVE MIDDLE NAME(s) or INITIALS of the individual holding the Driver License or ID.
  /// Hyphenated names acceptable, spaces between names acceptable, but no other
  /// use of special symbols.
  String? akaMiddleName;

  /// Optional on AAMVA 01 barcodes.
  ///
  /// ALTERNATIVE PREFIX to Driver Name. Freeform as defined by issuing jurisdiction.
  String? akaPrefixName;

  /// Optional on AAMVA version 01.
  ///
  /// Driver "AKA" Social Security Number. FORMAT SAME AS DRIVER SOC SEC NUM. ALTERNATIVE NUMBERS(S) used as SS NUM.
  String? akaSocialSecurityNumber;

  ///  Optional on all AAMVA and Compact barcodes.
  ///
  /// Other suffix by which the cardholder is known.

  /// The Suffix Code Portion, if submitted, can contain only the Suffix Codes
  /// shown in the following table (e.g., Andrew Johnson, III = JOHNSON@ANDREW@@3RD):
  ///
  /// Suffix     Meaning or Synonym
  /// JR         Junior
  /// SR         Senior or Esquire 1ST First
  /// 2ND        Second
  /// 3RD        Third
  /// 4TH        Fourth
  /// 5TH        Fifth
  /// 6TH        Sixth
  /// 7TH        Seventh
  /// 8TH        Eighth
  /// 9TH        Ninth
  String? akaSuffixName;

  /// Optional on AAMVA 02, 03, 04, 05, 06, 07, 08 and Compact barcodes.
  ///
  /// A string of letters and/or numbers that identifies when, where, and by whom a driver's
  /// license/ID card was made. If audit information is not used on the card or the MRT, it
  /// must be included in the driver record.
  String? auditInformation;

  /// Optional on AAMVA 04, 05, 06, 07, 08 and Compact barcodes.
  ///
  /// DHS required field that indicates date of the most recent version change or
  ///  modification to the visible format of the DL/ID. (MMDDCCYY format)
  String? cardRevisionDate;

  /// Optional on AAMVA 04, 05, 06, 07, 08 and Compact barcodes.
  ///
  /// DHS required field that indicates compliance: "M" = materially compliant,
  /// "F" = fully compliant, and, "N" = non-compliant.
  String? complianceType;

  /// Mandatory on AAMVA 02, 03, 04, 05, 06, 07, 08 and Compact barcodes.
  ///
  /// Country in which DL/ID is issued. U.S. = USA, Canada = CAN.
  String? countryIdentification;

  /// Mandatory on all AAMVA, Magnetic and Compact barcodes.
  ///
  /// Family name of the cardholder. (Family name is sometimes also called "last name" or "surname.")
  /// Collect full name for record, print as many characters as possible on portrait side of DL/ID.
  String? customerFamilyName;

  /// Mandatory on all AAMVA and Compact barcodes.
  ///
  /// The number assigned or calculated by the issuing authority.
  String? customerIdNumber;

  /// Mandatory on all AAMVA, Magnetic and Compact barcodes.
  ///
  /// First name of the cardholder.
  String? customerFirstName;

  /// Mandatory on all AAMVA, Magnetic and Compact barcodes.
  ///
  /// Full name of the individual holding the Driver's License or ID.
  ///
  /// The Name field contains up to four portions, separated with the "," delimiter:
  /// Last Name (required)
  /// , (required)
  /// First Name (required)
  /// , (required if other name portions follow, otherwise optional)
  /// Middle Name(s) (optional)
  /// , (required if other name portions follow, otherwise optional)
  /// Suffix (optional)
  /// , (optional)
  ///
  /// If the individual has more than one middle name they are separated with space.
  String? customerFullName;

  /// Mandatory on AAMVA 04, 05, 06, 07, 08 barcodes.
  /// Optional on AAMVA 01, 02, 03, Magnetic and Compcat barcodes.
  ///
  /// Middle name(s) of the cardholder. In the case of multiple middle names they
  /// shall be separated by space " ".
  String? customerMiddleName;

  /// Optional on compact barcodes.
  ///
  /// Document discriminator.
  String? dataDiscriminator;

  /// Mandatory on all AAMVA, Magnetic and Compact barcodes.
  ///
  /// Date on which the cardholder was born. (MMDDCCYY format)
  String? dateOfBirth;

  /// Mandatory on AAMVA 02, 03, 04, 05, 06, 07, 08 and Magnetic barcodes.
  /// Optional on Compact barcodes.
  ///
  /// Number must uniquely identify a particular document issued to that customer
  /// from others that may have been issued in the past. This number may serve
  /// multiple purposes of document discrimination, audit info, and/or inventory control.
  String? documentDiscriminator;

  /// Mandatory on all AAMVA, Magnetic and Compact barcodes.
  ///
  /// Date on which the document expires. (MMDDCCYY format)
  /// If the document is non expiring then "Non expiring" is written in this field.
  String? documentExpirationDate;

  /// Optional on Magnetic barcodes.
  ///
  /// Month on which the driving and identification privileges granted by the document are no longer valid.
  String? documentExpirationMonth;

  /// Mandatory on all AAMVA and Compact barcodes.
  ///
  /// Date on which the document was issued. (MMDDCCYY format)
  String? documentIssueDate;

  /// Optional on Magnetic barcodes.
  ///
  /// Field that indicates that the driving and identification privileges granted by the
  /// document are nonexpiring = "1".
  String? documentNonexpiring;

  /// Mandatory on all driver's licenses.
  /// All barcodes which are using 3-track magnetic stripe encoding used in the interest of smoothing a transition from legacy documents
  /// shall be designated as "Magnetic". All barcodes which are using compact encoding
  /// compliant with ISO/IEC 18013-2 shall be designated as "Compact". All barcodes (majority)
  /// compliant with Mandatory PDF417 Bar Code of the American Association of Motor Vehicle
  /// Administrators (AAMVA) Card Design Standard from AAMVA DL/ID-2000 standard to DL/ID-2013
  /// shall be designated as "AAMVA".
  String? documentType;

  /// Mandatory on AAMVA 02, 03, 04, 05, 06, 07, 08 barcodes.
  /// Optional on AAMVA 01, Magnetic and Compact barcodes.
  ///
  /// Color of cardholder's eyes. (ANSI D-20 codes)
  /// Code   Description
  /// BLK    Black
  /// BLU    Blue
  /// BRO    Brown
  /// GRY    Gray
  /// GRN    Green
  /// HAZ    Hazel
  /// MAR    Maroon
  /// PNK    Pink
  /// DIC    Dichromatic
  /// UNK    Unknown
  String? eyeColor;

  /// Mandatory on AAMVA 04, 05, 06, 07, 08 barcodes.
  /// Optional on Compact barcodes.
  /// A code that indicates whether a field has been truncated (T), has not been
  /// truncated (N), or – unknown whether truncated (U).
  String? familyNameTruncation;

  /// Mandatory on AAMVA versions 02 and 03.
  ///
  /// Federally established codes for vehicle categories, endorsements, and restrictions
  /// that are generally applicable to commercial motor vehicles. If the vehicle is not a
  /// commercial vehicle, "NONE" is to be entered.
  String? federalCommercialVehicleCodes;

  /// Mandatory on AAMVA 04, 05, 06, 07, 08 barcodes.
  /// Optional on Compact barcodes.
  ///
  /// A code that indicates whether a field has been truncated (T), has not been
  /// truncated (N), or – unknown whether truncated (U).
  String? firstNameTruncation;

  /// Mandatory on all AAMVA and Magnetic barcodes.
  /// Optional on Compact barcodes.
  ///
  /// Full address of the individual holding the Driver's License or ID.
  ///
  /// The full address field contains up to four portions, separated with the "," delimiter:
  /// Street Address (required)
  /// , (required if other address portions follow, otherwise optional)
  /// City (optional)
  /// , (required if other address portions follow, otherwise optional)
  /// Jurisdiction Code (optional)
  /// , (required if other address portions follow, otherwise optional)
  /// ZIP - Postal Code (optional)
  String? fullAddress;

  /// Optional on all AAMVA, Magnetic and Compact barcodes.
  ///
  /// Bald, black, blonde, brown, gray, red/auburn, sandy, white, unknown. If the issuing
  /// jurisdiction wishes to abbreviate colors, the three-character codes provided in ANSI D20 must be
  /// used.
  ///
  /// Code   Description
  /// BAL    Bald
  /// BLK    Black
  /// BLN    Blond
  /// BRO    Brown
  /// GRY    Grey
  /// RED    Red/Auburn
  /// SDY    Sandy
  /// WHI    White
  /// UNK    Unknown
  String? hairColor;

  /// Mandatory on AAMVA 02, 03, 04, 05, 06, 07, 08 and Compact barcodes.
  /// Optional on AAMVA 01 and Magnetic barcodes.
  ///
  /// Height of cardholder, either in Inches or in Centimeters.
  ///
  /// Inches (in): number of inches followed by " in"
  /// example: 6'1'' = "73 in"
  ///
  /// Centimeters (cm): number of centimeters followed by " cm"
  /// example: 181 centimeters = "181 cm"
  String? height;

  /// Mandatory on AAMVA 02, 03, 04, 05, 06, 07, 08 and Compact barcodes.
  /// Optional on AAMVA 01 and Magnetic barcodes.
  ///
  /// Height of cardholder in Inches.
  /// Example: 5'9'' = "69".
  String? heightIn;

  /// Mandatory on AAMVA 02, 03, 04, 05, 06, 07, 08 Compact barcodes.
  /// Optional on AAMVA 01 and Magnetic barcodes.
  ///
  /// Height of cardholder in Centimeters.
  /// Example: 180 Centimeters = "180".
  String? heightCm;

  /// Mandatory on all AAMVA, Magnetic and Compact barcodes.
  ///
  /// This number uniquely identifies the issuing jurisdiction and can
  /// be obtained by contacting the ISO Issuing Authority (AAMVA)
  String? issuerIdentificationNumber;

  /// Optional on all AAMVA barcodes.
  /// Mandatory on Compact barcodes.
  ///
  /// Jurisdictions may define a subfile to contain jurisdiction-specific information.
  /// These subfiles are designated with the first character of “Z” and the second
  /// character is the first letter of the jurisdiction's name. For example, "ZC" would
  /// be the designator for a California or Colorado jurisdiction-defined subfile, "ZQ"
  /// would be the designator for a Quebec jurisdiction-defined subfile. In the case of
  /// a jurisdiction-defined subfile that has a first letter that could be more than
  /// one jurisdiction (e.g. California, Colorado, Connecticut) then other data, like
  /// the IIN or address, must be examined to determine the jurisdiction.
  ///
  String? issuingJurisdiction;

  /// Optional on all AAMVA and Magnetic barcodes.
  ///
  /// Name of issuing jurisdiction, for example: Alabama, Alaska ...
  String? issuingJurisdictionName;

  /// Mandatory on all AAMVA barcodes.
  /// Optional on Magnetic barcodes.
  ///
  /// Jurisdiction-specific codes that represent additional privileges
  /// granted to the cardholder beyond the vehicle class (such as transportation of
  /// passengers, hazardous materials, operation of motorcycles, etc.).
  String? jurisdictionEndorsementCodes;

  /// Optional on AAMVA 02, 03, 04, 05, 06, 07, 08 and Compact barcodes.
  ///
  /// Text that explains the jurisdiction-specific code(s) that indicates additional
  /// driving privileges granted to the cardholder beyond the vehicle class.
  String? jurisdictionEndorsmentCodeDescription;

  /// Optional on AAMVA 02, 03, 04, 05, 06, 07, 08 and Compact barcodes.
  ///
  /// Text describing the jurisdiction-specific restriction code(s) that curtail driving privileges.
  String? jurisdictionRestrictionCodeDescription;

  /// Mandatory on all AAMVA barcodes.
  /// Optional on Magnetic barcodes.
  ///
  /// Jurisdiction-specific codes that represent additional privileges
  /// granted to the cardholder beyond the vehicle class (such as transportation of
  /// passengers, hazardous materials, operation of motorcycles, etc.).
  String? jurisdictionRestrictionCodes;

  /// Mandatory on all AAMVA and Magnetic barcodes.
  ///
  /// Jurisdiction-specific vehicle class / group code, designating the type
  /// of vehicle the cardholder has privilege to drive.
  String? jurisdictionVehicleClass;

  /// Optional on AAMVA 02, 03, 04, 05, 06, 07, 08 and Compact barcodes.
  ///
  /// Text that explains the jurisdiction-specific code(s) for classifications
  /// of vehicles cardholder is authorized to drive.
  String? jurisdictionVehicleClassificationDescription;

  /// Mandatory on all AAMVA and Compact barcodes.
  /// Optional on Magnetic barcodes.
  ///
  /// Jurisdiction Version Number: This is a decimal value between 0 and 99 that
  /// specifies the jurisdiction version level of the PDF417 barcode format.
  /// Notwithstanding iterations of this standard, jurisdictions implement incremental
  /// changes to their barcodes, including new jurisdiction-specific data, compression
  /// algorithms for digitized images, digital signatures, or new truncation
  /// conventions used for names and addresses. Each change to the barcode format
  /// within each AAMVA version (above) must be noted, beginning with Jurisdiction
  /// Version 00.
  String? jurisdictionVersionNumber;

  /// Optional on AAMVA 04, 05, 06, 07, 08 and Compact barcodes.
  ///
  /// DHS required field that indicates that the cardholder has temporary lawful status = "1".
  String? limitedDurationDocument;

  /// Optional on AAMVA version 01.
  ///
  /// Medical Indicator/Codes.
  /// STATE SPECIFIC. Freeform, Standard "TBD"
  String? medicalIndicator;

  /// Mandatory on AAMVA 04, 05, 06, 07, 08 barcodes.
  ///
  /// A code that indicates whether a field has been truncated (T), has not been
  /// truncated (N), or – unknown whether truncated (U).
  String? middleNameTruncation;

  /// Optional on AAMVA 01 barcodes.
  ///
  /// PREFIX to Driver Name. Freeform as defined by issuing jurisdiction.
  String? namePrefix;

  /// Mandatory on AAMVA 02 barcodes.
  /// Optional on AAMVA 01, 03, 04, 05, 06, 07, 08, Magnetic and Compact barcodes.
  ///
  /// Name Suffix (If jurisdiction participates in systems requiring name suffix (PDPS, CDLIS, etc.),
  /// the suffix must be collected and displayed on the DL/ID and in the MRT).
  /// - JR (Junior)
  /// - SR (Senior)
  /// - 1ST or I (First)
  /// - 2ND or II (Second)
  /// - 3RD or III (Third)
  /// - 4TH or IV (Fourth)
  /// - 5TH or V (Fifth)
  /// - 6TH or VI (Sixth)
  /// - 7TH or VII (Seventh)
  /// - 8TH or VIII (Eighth)
  /// - 9TH or IX (Ninth)
  String? nameSuffix;

  /// Optional on AAMVA version 01.
  ///
  /// Non-Resident Indicator. "Y". Used by some jurisdictions to indicate holder of the document is a non-resident.
  String? nonResident;

  /// Optional on AAMVA version 01.
  ///
  /// Number of duplicate cards issued for a license or ID if any.
  String? numberOfDuplicates;

  /// Optional on AAMVA 01, 06, 07, 08 barcodes.
  ///
  /// Field that indicates that the cardholder is an organ donor = "1".
  String? organDonor;

  /// Optional on AAMVA version 01 barcodes.
  ///
  /// Driver Permit Expiration Date. MMDDCCYY format. Date permit expires.
  String? permitExpirationDate;

  /// Optional on AAMVA version 01 barcodes..
  ///
  /// Type of permit.
  String? permitIdentifier;

  /// Optional on AAMVA version 01 barcodes..
  ///
  /// Driver Permit Issue Date. MMDDCCYY format. Date permit was issued.
  String? permitIssueDate;

  /// Optional on AAMVA 02, 03, 04, 05, 06, 07, 08 and Compact barcodes.
  ///
  /// Country and municipality and/or state/province.
  String? placeOfBirth;

  /// Optional on AAMVA 02, 03, 04, 05, 06, 07, 08 and Compact barcodes.
  ///
  /// Codes for race or ethnicity of the cardholder, as defined in ANSI D20.
  ///
  /// Race:
  /// Code   Description
  /// AI     Alaskan or American Indian (Having Origins in Any of The Original Peoples of
  /// North America, and Maintaining Cultural Identification Through Tribal
  /// Affiliation of Community Recognition)
  /// AP     Asian or Pacific Islander (Having Origins in Any of the Original Peoples of
  /// the Far East, Southeast Asia, or Pacific Islands. This Includes China, India,
  /// Japan, Korea, the Philippines Islands, and Samoa)
  /// BK     Black (Having Origins in Any of the Black Racial Groups of Africa)
  /// W      White (Having Origins in Any of The Original Peoples of Europe, North Africa,
  /// or the Middle East)
  ///
  /// Ethnicity:
  /// Code   Description
  /// H      Hispanic Origin (A Person of Mexican, Puerto Rican, Cuban, Central or South
  /// American or Other Spanish Culture or Origin, Regardless of Race)
  /// O      Not of Hispanic Origin (Any Person Other Than Hispanic)
  /// U      Unknown
  String? raceEthnicity;

  /// Optional on AAMVA version 01.
  ///
  /// Driver Residence City
  String? residenceCity;

  /// Optional on AAMVA 01 barcodes.
  ///
  /// Full residence address of the individual holding the Driver's License or ID.
  /// The full address field contains up to four portions, separated with the "," delimiter:
  /// Residence Street Address (required)
  /// , (required if other address portions follow, otherwise optional)
  /// Residence City (optional)
  /// , (required if other address portions follow, otherwise optional)
  /// Residence Jurisdiction Code (optional)
  /// , (required if other address portions follow, otherwise optional)
  /// Residence ZIP - Residence Postal Code (optional)
  String? residenceFullAddress;

  /// Optional on AAMVA version 01.
  ///
  /// Driver Residence Jurisdiction Code.
  String? residenceJurisdictionCode;

  /// Optional on AAMVA 01 barcodes.
  ///
  /// Driver Residence Postal Code.
  String? residencePostalCode;

  /// Optional on AAMVA version 01.
  ///
  /// Driver Residence Street Address 1.
  String? residenceStreetAddress;

  /// Optional on AAMVA version 01.
  ///
  /// Driver Residence Street Address 2.
  String? residenceStreetAddress2;

  /// Optional on Magnetic barcodes.
  ///
  /// Security version being used.
  String? securityVersion;

  /// Mandatory on all AAMVA, Magnetic barcodes.
  /// Optional on Compact barcodes.
  ///
  /// Gender of the cardholder. 1 = male, 2 = female.
  String? sex;

  /// Optional on AAMVA version 01.
  ///
  /// The number assigned to the individual by the Social Security Administration.
  String? socialSecurityNumber;

  /// Optional on all AAMVA barcodes.
  ///
  /// Standard endorsement code(s) for cardholder. See codes in D20. This data element is a
  /// placeholder for future efforts to standardize endorsement codes.
  ///
  /// Code   Description
  /// H      Hazardous Material - This endorsement is required for the operation of any vehicle
  /// transporting hazardous materials requiring placarding, as defined by U.S.
  /// Department of Transportation regulations.
  /// L      Motorcycles – Including Mopeds/Motorized Bicycles.
  ///
  /// N      Tank - This endorsement is required for the operation of any vehicle transporting,
  /// as its primary cargo, any liquid or gaseous material within a tank attached to the vehicle.
  ///
  /// O      Other Jurisdiction Specific Endorsement(s) - This code indicates one or more
  /// additional jurisdiction assigned endorsements.
  ///
  /// P      Passenger - This endorsement is required for the operation of any vehicle used for
  /// transportation of sixteen or more occupants, including the driver.
  ///
  /// S      School Bus - This endorsement is required for the operation of a school bus. School bus means a
  /// CMV used to transport pre-primary, primary, or secondary school students from home to school,
  /// from school to home, or to and from school sponsored events. School bus does not include a
  /// bus used as common carrier (49 CRF 383.5).
  ///
  /// T      Doubles/Triples - This endorsement is required for the operation of any vehicle that would be
  /// referred to as a double or triple.
  ///
  /// X      Combined Tank/HAZ-MAT - This endorsement may be issued to any driver who qualifies for
  /// both the N and H endorsements.
  String? standardEndorsementCode;

  /// Optional on all AAMVA barcodes.
  ///
  /// Standard restriction code(s) for cardholder. See codes in D20. This data element is a placeholder
  /// for future efforts to standardize restriction codes.
  ///
  /// Code   Description
  /// B      Corrective Lenses
  /// C      Mechanical Devices (Special Brakes, Hand Controls, or Other Adaptive Devices)
  /// D      Prosthetic Aid
  /// E      Automatic Transmission
  /// F      Outside Mirror
  /// G      Limit to Daylight Only
  /// H      Limit to Employment
  /// I      Limited Other
  /// J      Other
  /// K      CDL Intrastate Only
  /// L      Vehicles without air brakes
  /// M      Except Class A bus
  /// N      Except Class A and Class B bus
  /// O      Except Tractor-Trailer
  /// V      Medical Variance Documentation Required
  /// W      Farm Waiver
  String? standardRestrictionCode;

  /// Optional on all AAMVA barcodes.
  /// Mandatory on Compact barcodes.
  ///
  /// Standard vehicle classification code(s) for cardholder. This data element is a
  /// placeholder for future efforts to standardize vehicle classifications.
  String? standardVehicleClassification;

  /// Mandatory on all driver's licenses.
  ///
  /// AAMVA Version Number: This is a decimal value between 0 and 99 that
  /// specifies the version level of the PDF417 bar code format. Version "0" and "00"
  /// is reserved for bar codes printed to the specification of the American Association
  /// of Motor Vehicle Administrators (AAMVA) prior to the adoption of the AAMVA DL/ID-2000
  /// standard.
  ///
  /// - All barcodes compliant with AAMVA DL/ID-2000 standard shall be designated Version "01."
  /// - All barcodes compliant with AAMVA Card Design Specification version 1.0, dated 09-2003
  /// shall be designated Version "02."
  /// - All barcodes compliant with AAMVA Card Design Specification version 2.0, dated 03-2005
  /// shall be designated Version "03."
  /// - All barcodes compliant with AAMVA Card Design Standard version 1.0, dated 07-2009
  /// shall be designated Version "04."
  /// - All barcodes compliant with AAMVA Card Design Standard version 1.0, dated 07-2010
  /// shall be designated Version "05."
  /// - All barcodes compliant with AAMVA Card Design Standard version 1.0, dated 07-2011
  /// shall be designated Version "06".
  /// - All barcodes compliant with AAMVA Card Design Standard version 1.0, dated 06-2012
  /// shall be designated Version "07".
  /// - All barcodes compliant with this current AAMVA standard shall be designated "08".
  ///
  /// Should a need arise requiring major revision to the format, this field provides the
  /// means to accommodate additional revision.
  ///
  /// If the document type is not "AAMVA", this field defines the version number of the
  /// given document type's standard.
  String? standardVersionNumber;

  /// Optional on AAMVA 05, 06, 07, 08 barcodes.
  /// Date on which the cardholder turns 18 years old. (MMDDCCYY format)
  String? under18;

  /// Optional on AAMVA 05, 06, 07, 08 barcodes.
  ///
  /// Date on which the cardholder turns 19 years old. (MMDDCCYY format)
  String? under19;

  /// Optional on AAMVA 05, 06, 07, 08 barcodes.
  ///
  /// Date on which the cardholder turns 21 years old. (MMDDCCYY format)
  String? under21;

  /// Optional on AAMVA version 01.
  ///
  ///  A number or alphanumeric string used by some jurisdictions to identify a "customer" across multiple data bases.
  String? uniqueCustomerId;

  /// Optional on AAMVA 07, 08 barcodes.
  ///
  /// Field that indicates that the cardholder is a veteran = "1"
  String? veteran;

  /// Mandatory on AAMVA 02 barcodes.
  /// Optional on AAMVA 01, 03, 04, 05, 06, 07, 08, Magnetic and Compact barcodes.
  ///
  /// Cardholder weight in kilograms Example: 84 kg = "084"
  String? weightKilograms;

  /// Mandatory on AAMVA 02 barcodes.
  /// Optional on AAMVA 01, 03, 04, 05, 06, 07, 08, Magnetic and Compact barcodes.
  ///
  /// Cardholder weight in pounds Example: 185 lb = "185"
  String? weightPounds;

  /// Mandatory on AAMVA 02 barcodes.
  /// Optional on AAMVA 01, 03, 04, 05, 06, 07, 08, Magnetic and Compact barcodes.
  ///
  /// Indicates the approximate weight range of the cardholder:
  /// 0 = up to 31 kg (up to 70 lbs)
  /// 1 = 32 – 45 kg (71 – 100 lbs)
  /// 2 = 46 - 59 kg (101 – 130 lbs)
  /// 3 = 60 - 70 kg (131 – 160 lbs)
  /// 4 = 71 - 86 kg (161 – 190 lbs)
  /// 5 = 87 - 100 kg (191 – 220 lbs)
  /// 6 = 101 - 113 kg (221 – 250 lbs)
  /// 7 = 114 - 127 kg (251 – 280 lbs)
  /// 8 = 128 – 145 kg (281 – 320 lbs)
  /// 9 = 146+ kg (321+ lbs)
  String? weightRange;

  /// Represents the fields present in the barcode.
  /// Currently this is only used for AAMVACompliant documents.
  BarcodeExtendedElements(Map<String, dynamic> nativeBarcodeExtendedElements)
    : addressCity = nativeBarcodeExtendedElements['addressCity'],
      addressJurisdictionCode =
          nativeBarcodeExtendedElements['addressJurisdictionCode'],
      addressPostalCode = nativeBarcodeExtendedElements['addressPostalCode'],
      addressStreet = nativeBarcodeExtendedElements['addressStreet'],
      addressStreet2 = nativeBarcodeExtendedElements['addressStreet2'],
      akaDateOfBirth = nativeBarcodeExtendedElements['akaDateOfBirth'],
      akaFamilyName = nativeBarcodeExtendedElements['akaFamilyName'],
      akaFullName = nativeBarcodeExtendedElements['akaFullName'],
      akaGivenName = nativeBarcodeExtendedElements['akaGivenName'],
      akaMiddleName = nativeBarcodeExtendedElements['akaMiddleName'],
      akaPrefixName = nativeBarcodeExtendedElements['akaPrefixName'],
      akaSocialSecurityNumber =
          nativeBarcodeExtendedElements['akaSocialSecurityNumber'],
      akaSuffixName = nativeBarcodeExtendedElements['akaSuffixName'],
      auditInformation = nativeBarcodeExtendedElements['auditInformation'],
      cardRevisionDate = nativeBarcodeExtendedElements['cardRevisionDate'],
      complianceType = nativeBarcodeExtendedElements['complianceType'],
      countryIdentification =
          nativeBarcodeExtendedElements['countryIdentification'],
      customerFamilyName = nativeBarcodeExtendedElements['customerFamilyName'],
      customerIdNumber = nativeBarcodeExtendedElements['customerIdNumber'],
      customerFirstName = nativeBarcodeExtendedElements['customerFirstName'],
      customerFullName = nativeBarcodeExtendedElements['customerFullName'],
      customerMiddleName = nativeBarcodeExtendedElements['customerMiddleName'],
      dataDiscriminator = nativeBarcodeExtendedElements['dataDiscriminator'],
      dateOfBirth = nativeBarcodeExtendedElements['dateOfBirth'],
      documentDiscriminator =
          nativeBarcodeExtendedElements['documentDiscriminator'],
      documentExpirationDate =
          nativeBarcodeExtendedElements['documentExpirationDate'],
      documentExpirationMonth =
          nativeBarcodeExtendedElements['documentExpirationMonth'],
      documentIssueDate = nativeBarcodeExtendedElements['documentIssueDate'],
      documentNonexpiring =
          nativeBarcodeExtendedElements['documentNonexpiring'],
      documentType = nativeBarcodeExtendedElements['documentType'],
      eyeColor = nativeBarcodeExtendedElements['eyeColor'],
      familyNameTruncation =
          nativeBarcodeExtendedElements['familyNameTruncation'],
      federalCommercialVehicleCodes =
          nativeBarcodeExtendedElements['federalCommercialVehicleCodes'],
      firstNameTruncation =
          nativeBarcodeExtendedElements['firstNameTruncation'],
      fullAddress = nativeBarcodeExtendedElements['fullAddress'],
      hairColor = nativeBarcodeExtendedElements['hairColor'],
      height = nativeBarcodeExtendedElements['height'],
      heightIn = nativeBarcodeExtendedElements['heightIn'],
      heightCm = nativeBarcodeExtendedElements['heightCm'],
      issuerIdentificationNumber =
          nativeBarcodeExtendedElements['issuerIdentificationNumber'],
      issuingJurisdiction =
          nativeBarcodeExtendedElements['issuingJurisdiction'],
      issuingJurisdictionName =
          nativeBarcodeExtendedElements['issuingJurisdictionName'],
      jurisdictionEndorsementCodes =
          nativeBarcodeExtendedElements['jurisdictionEndorsementCodes'],
      jurisdictionEndorsmentCodeDescription =
          nativeBarcodeExtendedElements['jurisdictionEndorsmentCodeDescription'],
      jurisdictionRestrictionCodeDescription =
          nativeBarcodeExtendedElements['jurisdictionRestrictionCodeDescription'],
      jurisdictionRestrictionCodes =
          nativeBarcodeExtendedElements['jurisdictionRestrictionCodes'],
      jurisdictionVehicleClass =
          nativeBarcodeExtendedElements['jurisdictionVehicleClass'],
      jurisdictionVehicleClassificationDescription =
          nativeBarcodeExtendedElements['jurisdictionVehicleClassificationDescription'],
      jurisdictionVersionNumber =
          nativeBarcodeExtendedElements['jurisdictionVersionNumber'],
      limitedDurationDocument =
          nativeBarcodeExtendedElements['limitedDurationDocument'],
      medicalIndicator = nativeBarcodeExtendedElements['medicalIndicator'],
      middleNameTruncation =
          nativeBarcodeExtendedElements['middleNameTruncation'],
      namePrefix = nativeBarcodeExtendedElements['namePrefix'],
      nameSuffix = nativeBarcodeExtendedElements['nameSuffix'],
      nonResident = nativeBarcodeExtendedElements['nonResident'],
      numberOfDuplicates = nativeBarcodeExtendedElements['numberOfDuplicates'],
      organDonor = nativeBarcodeExtendedElements['organDonor'],
      permitExpirationDate =
          nativeBarcodeExtendedElements['permitExpirationDate'],
      permitIdentifier = nativeBarcodeExtendedElements['permitIdentifier'],
      permitIssueDate = nativeBarcodeExtendedElements['permitIssueDate'],
      placeOfBirth = nativeBarcodeExtendedElements['placeOfBirth'],
      raceEthnicity = nativeBarcodeExtendedElements['raceEthnicity'],
      residenceCity = nativeBarcodeExtendedElements['residenceCity'],
      residenceFullAddress =
          nativeBarcodeExtendedElements['residenceFullAddress'],
      residenceJurisdictionCode =
          nativeBarcodeExtendedElements['residenceJurisdictionCode'],
      residencePostalCode =
          nativeBarcodeExtendedElements['residencePostalCode'],
      residenceStreetAddress =
          nativeBarcodeExtendedElements['residenceStreetAddress'],
      residenceStreetAddress2 =
          nativeBarcodeExtendedElements['residenceStreetAddress2'],
      securityVersion = nativeBarcodeExtendedElements['securityVersion'],
      sex = nativeBarcodeExtendedElements['sex'],
      socialSecurityNumber =
          nativeBarcodeExtendedElements['socialSecurityNumber'],
      standardEndorsementCode =
          nativeBarcodeExtendedElements['standardEndorsementCode'],
      standardRestrictionCode =
          nativeBarcodeExtendedElements['standardRestrictionCode'],
      standardVehicleClassification =
          nativeBarcodeExtendedElements['standardVehicleClassification'],
      standardVersionNumber =
          nativeBarcodeExtendedElements['standardVersionNumber'],
      under18 = nativeBarcodeExtendedElements['under18'],
      under19 = nativeBarcodeExtendedElements['under19'],
      under21 = nativeBarcodeExtendedElements['under21'],
      uniqueCustomerId = nativeBarcodeExtendedElements['uniqueCustomerId'],
      veteran = nativeBarcodeExtendedElements['veteran'],
      weightKilograms = nativeBarcodeExtendedElements['weightKilograms'],
      weightPounds = nativeBarcodeExtendedElements['weightPounds'],
      weightRange = nativeBarcodeExtendedElements['weightRange'];
}

/// Represents the document type found on the Machine Readable Zone
enum MRZDocumentType {
  /// Document type was not identified.
  unknown,

  /// Identity card
  identityCard,

  /// Passport
  passport,

  /// VISA
  visa,

  /// Green card
  greenCard,

  /// IIM13P Pass
  mysPassIMM13P,

  /// Driver license
  driverLicense,

  /// Internal travel document
  internalTravelDocument,

  /// Border crossing card
  borderCrossingCard,
}

/// Represents the result of the image crop transformation with additional details.
class DetailedCroppedImageResult {
  /// The cropped image in the Base64 format
  String? image;

  /// The document side that was cropped.
  ScanningSide? side;

  /// The location of the cropped image in the transformed image of the document.
  Rectangle? location;

  /// Represents the result of the image crop transformation with additional details.
  DetailedCroppedImageResult(
    Map<String, dynamic> nativeDetailedCroppedImageResult,
  ) {
    image = nativeDetailedCroppedImageResult["image"];
    side = enumFromValue(
      ScanningSide.values,
      nativeDetailedCroppedImageResult["side"],
    );
    location =
        nativeDetailedCroppedImageResult['location'] != null
            ? Rectangle(
              Map<String, dynamic>.from(
                nativeDetailedCroppedImageResult['location'],
              ),
            )
            : null;
  }
}

/// Represents the side of the document being scanned.
enum ScanningSide {
  /// The first side of the scanned document
  first,

  /// The second side of the scanned document
  second,
}

/// Helper method for serializing enums from the native Android and iOS platforms.
T? enumFromValue<T>(List<T> values, dynamic input) {
  if (input == null) return null;
  if (input is T) return input;

  if (input is int) {
    if (input >= 0 && input < values.length) return values[input];
  }

  final inputStr = input.toString().split('.').last.toLowerCase();
  for (var value in values) {
    final enumStr = value.toString().split('.').last.toLowerCase();
    if (enumStr == inputStr) return value;
  }

  return null;
}

/// Helper method for handling different string types, based on the document information source.
T? handleStringType<T>(dynamic result, String propertyName) {
  if (result == null) return null;

  if (T == String) {
    if (result is Map && result[propertyName] is String) {
      return result[propertyName] as T;
    }
    return null;
  }

  if (T == StringResult) {
    final value = result[propertyName];
    if (value is Map<String, dynamic>) {
      return StringResult(value) as T;
    }
    return null;
  }

  return null;
}
