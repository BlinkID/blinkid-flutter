import 'package:blinkid_flutter/blinkid_settings.dart';
import 'package:json_annotation/json_annotation.dart';

class BlinkIdScanningResult {
  /// Scanning mode used to scan current document.
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
  bool? dateOfExpiryPermanent;

  /// The driver license detailed info.
  DriverLicenseDetailedInfo<StringResult>? driverLicenseDetailedInfo;

  /// The dependents info.
  List<DependentInfo>? dependentsInfo;

  /// The results of scanning each side of the document.
  List<SingleSideScanningResult>? subResults;

  /// Returns the input image for the given scanning side.
  ///
  /// - Parameter scanningSide The scanning side.
  /// - Returns: The input image for the given scanning side or `nil` if the input image is not available.
  String? firstInputImage;

  String? secondInputImage;

  /// Returns the input image containing parsable barcode.
  ///
  /// - Returns: The input image containing parsable barcode or `nil` if the barcode input image is not available.
  String? barcodeInputImage;

  /// Returns the cropped document image for the given scanning side.
  ///
  /// - Parameter scanningSide The scanning side.
  /// - Returns: The cropped document image for the given scanning side or `nil` if the document image is not available.
  String? firstDocumentImage;

  String? secondDocumentImage;

  /// Returns the cropped face image with additional info.
  ///
  /// - Returns: The cropped face image with additional info or `nil` if the face image is not available.
  DetailedCroppedImageResult? faceImage;

  /// Returns the cropped signature image with additional info.
  ///
  /// - Returns: The cropped signature image with additional info or `nil` if the signature image is not available.
  DetailedCroppedImageResult? signatureImage;

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

/// Define level of anonymization performed on recognizer result
enum RecognitionMode {
  /// No recognition performed.
  @JsonValue(0)
  none,

  /// Recognition of mrz document (does not include visa and passport)
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

/// Represents the classification information.
class DocumentClassInfo {
  /// The document country.
  Country? country;

  /// The document region.
  Region? region;

  /// The type of the scanned document.
  DocumentType? documentType;

  /// Flag that indicates if class info is empty
  bool? empty;

  /// The name of the country that issued the scanned document.
  String? countryName;

  /// The ISO numeric code of the country that issued the scanned document.
  String? isoNumericCountryCode;

  /// The 2 letter ISO code of the country that issued the scanned document.
  String? isoAlpha2CountryCode;

  /// The 3 letter ISO code of the country that issued the scanned document.
  String? isoAlpha3CountryCode;

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

/// Gives more info on data match
class DataMatchResult {
  ///  State for the whole document result
  DataMatchState? overallState;

  List<DataMatchResultField>? states;

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

class DataMatchResultField {
  DataMatchField? field;
  DataMatchState? state;

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

enum DataMatchField {
  @JsonValue(0)
  dateOfBirth,
  @JsonValue(1)
  dateOfExpiry,
  @JsonValue(2)
  documentNumber,
  @JsonValue(3)
  documentAdditionalNumber,
  @JsonValue(4)
  documentOptionalAdditionalNumber,
  @JsonValue(5)
  personalIdNumber,
}

/// Result of the data matching algorithm for scanned parts/sides of the document.
enum DataMatchState {
  /// Data matching has not been performed.
  @JsonValue(0)
  notPerformed,

  /// Data does not match.
  @JsonValue(1)
  failed,

  /// Data match.
  @JsonValue(2)
  success,
}

/// Represents string results for three alphabets
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
  Location? location;

  /// Document field side
  Side? side;

  StringResult(Map<String, dynamic> nativeStringResult) {
    value = nativeStringResult['value'];
    latin = nativeStringResult['latin'];
    arabic = nativeStringResult['arabic'];
    cyrillic = nativeStringResult['cyrillic'];
    greek = nativeStringResult['greek'];
    /**
     * 
     *     location =
        nativeStringResult['location'] != null
            ? Location(
              Map<String, dynamic>.from(nativeStringResult['location']),
            )
            : null;
     */
    side =
        nativeStringResult['side'] != null
            ? Side(Map<String, dynamic>.from(nativeStringResult['side']))
            : null;
  }
}

/// Represents rectangle location of each document field
class Rectangle {
  /// x location
  double? x;

  /// y location
  double? y;

  /// rectangle width
  double? width;

  /// rectangle height
  double? height;

  Rectangle(Map<String, dynamic> nativeRect) {
    x = nativeRect['x'] != null ? nativeRect['x'] * 1.0 : null;
    y = nativeRect['y'] != null ? nativeRect['y'] * 1.0 : null;
    width = nativeRect['width'] != null ? nativeRect['width'] * 1.0 : null;
    height = nativeRect['height'] != null ? nativeRect['height'] * 1.0 : null;
  }
}

///Represents document field location for three alphabets
class Location {
  Rectangle? latin;
  Rectangle? arabic;
  Rectangle? cyrillic;
  Rectangle? greek;

  Location(Map<String, dynamic> nativeLocation) {
    latin = Rectangle(Map<String, dynamic>.from(nativeLocation['latin']));
    arabic = Rectangle(Map<String, dynamic>.from(nativeLocation['arabic']));
    cyrillic = Rectangle(Map<String, dynamic>.from(nativeLocation['cyrillic']));
    greek = Rectangle(Map<String, dynamic>.from(nativeLocation['greek']));
  }
}

///Represents document side for document field for three alphabets
class Side {
  DocumentSide? latin;
  DocumentSide? arabic;
  DocumentSide? cyrillic;
  DocumentSide? greek;

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
  None,

  ///The field is located on the front side of the document
  Front,

  ///The field is located on the back side of the document
  Back,
}

class DateResult<T> {
  Date? date;

  /// original date string
  T? originalString;

  /// is filled by domain knowledge
  bool? isFilledByDomainKnowledge;

  DateResult(Map<String, dynamic> nativeDateResult) {
    date = Date(nativeDateResult);
    originalString = handleStringType(nativeDateResult, "originalString");
    isFilledByDomainKnowledge = nativeDateResult["isFilledByDomainKnowledge"];
  }
}

class Date {
  /// day in month
  int? day;

  /// month in year
  int? month;

  /// year
  int? year;

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

/// Represents data extracted from the Driver's license.
class DriverLicenseDetailedInfo<T> {
  ///  Restrictions to driving privileges for the driver license owner.
  T? restrictions;

  /// Additional privileges granted to the driver license owner.
  T? endorsements;

  /// The type of vehicle the driver license owner has privilege to drive.
  T? vehicleClass;

  /// The driver license conditions.
  T? conditions;

  /// The additional information on vehicle class.
  List<VehicleClassInfo>? vehicleClassesInfo;

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

class VehicleClassInfo<T> {
  /// The type of driver licence.
  T? licenceType;

  /// The type of vehicle the driver license owner has privilege to drive.
  T? vehicleClass;

  /// The date since licence is effective.
  DateResult<T>? effectiveDate;

  /// The date of expiry of licence.
  DateResult<T>? expiryDate;

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

/// Defines the dependents information
class DependentInfo {
  /// The date of birth of the dependent.
  DateResult? dateOfBirth;

  /// The sex or gender of the dependent.
  StringResult? sex;

  /// The document number of the dependent.
  StringResult? documentNumber;

  /// The full name of the dependent.
  StringResult? fullName;

  /// Checks if the dependent's information is empty.
  bool? empty;

  DependentInfo(Map<String, dynamic> nativeDependentInfo) {
    dateOfBirth =
        nativeDependentInfo['dateOfBirth'] != null
            ? DateResult(
              Map<String, dynamic>.from(nativeDependentInfo['dateOfBirth']),
            )
            : null;
    sex = createStringResult(nativeDependentInfo, 'sex');
    documentNumber = createStringResult(nativeDependentInfo, 'documentNumber');
    fullName = createStringResult(nativeDependentInfo, 'fullName');
    empty = nativeDependentInfo['empty'];
  }
}

class SingleSideScanningResult {
  /// The data extracted from the Visual Inspection Zone.
  VizResult? viz;

  /// The data extracted from the Machine Readable Zone.
  MrzResult? mrz;

  /// The data extracted from the barcode.
  BarcodeResult? barcode;

  /// The input image.
  String? inputImage;

  /// The input image containing parsable barcode.
  String? barcodeInputImage;

  /// The cropped document image.
  String? documentImage;

  /// The cropped face image with additional info.
  DetailedCroppedImageResult? faceImage;

  /// The cropped signature image with additional info.
  DetailedCroppedImageResult? signatureImage;

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

class MrzResult {
  String? rawMRZString;

  String? documentCode;

  String? issuer;

  String? documentNumber;

  String? opt1;

  String? opt2;

  String? gender;

  String? nationality;

  String? primaryID;

  String? secondaryID;
  String? issuerName;

  String? nationalityName;

  bool? verified;

  DateResult? dateOfBirth;

  DateResult? dateOfExpiry;

  MRZDocumentType? documentType;

  String? sanitizedOpt1;

  String? sanitizedOpt2;

  String? sanitizedNationality;

  String? sanitizedIssuer;

  String? sanitizedDocumentCode;

  String? sanitizedDocumentNumber;

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

class BarcodeData {
  BarcodeType? barcodeType;

  String? rawData;

  String? stringData;

  bool? uncertain;

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
  None,

  /// QR code was scanned
  QRCode,

  /// Data Matrix 2D barcode was scanned
  DataMatrix,

  /// UPC E barcode was scanned
  UPCE,

  /// UPC A barcode was scanned
  UPCA,

  /// EAN 8 barcode was scanned
  EAN8,

  /// EAN 13 barcode was scanned
  EAN13,

  /// Code 128 barcode was scanned
  Code128,

  /// Code 39 barcode was scanned
  Code39,

  /// ITF barcode was scanned
  ITF,

  /// Aztec 2D barcode was scanned
  Aztec,

  /// PDF417 2D barcode was scanned
  PDF417,
}

class AddressDetailedInfo {
  String? street;

  /// The address postal code portion of the document owner.
  String? postalCode;

  /// The address city portion of the document owner.
  String? city;

  /// The address jurisdiction code portion of the document owner.
  String? jurisdiction;

  AddressDetailedInfo(Map<String, dynamic> nativeAddressDetailedInfo) {
    street = nativeAddressDetailedInfo["street"];
    postalCode = nativeAddressDetailedInfo["postalCode"];
    city = nativeAddressDetailedInfo["city"];
    jurisdiction = nativeAddressDetailedInfo["jurisdiction"];
  }
}

class BarcodeExtendedElements {
  String? addressCity;
  String? addressJurisdictionCode;
  String? addressPostalCode;
  String? addressStreet;
  String? addressStreet2;
  String? akaDateOfBirth;
  String? akaFamilyName;
  String? akaFullName;
  String? akaGivenName;
  String? akaMiddleName;
  String? akaPrefixName;
  String? akaSocialSecurityNumber;
  String? akaSuffixName;
  String? auditInformation;
  String? cardRevisionDate;
  String? complianceType;
  String? countryIdentification;
  String? customerFamilyName;
  String? customerIdNumber;
  String? customerFirstName;
  String? customerFullName;
  String? customerMiddleName;
  String? dataDiscriminator;
  String? dateOfBirth;
  String? documentDiscriminator;
  String? documentExpirationDate;
  String? documentExpirationMonth;
  String? documentIssueDate;
  String? documentNonexpiring;
  String? documentType;
  String? eyeColor;
  String? familyNameTruncation;
  String? federalCommercialVehicleCodes;
  String? firstNameTruncation;
  String? fullAddress;
  String? hairColor;
  String? height;
  String? heightIn;
  String? heightCm;
  String? issuerIdentificationNumber;
  String? issuingJurisdiction;
  String? issuingJurisdictionName;
  String? jurisdictionEndorsementCodes;
  String? jurisdictionEndorsmentCodeDescription;
  String? jurisdictionRestrictionCodeDescription;
  String? jurisdictionRestrictionCodes;
  String? jurisdictionVehicleClass;
  String? jurisdictionVehicleClassificationDescription;
  String? jurisdictionVersionNumber;
  String? limitedDurationDocument;
  String? medicalIndicator;
  String? middleNameTruncation;
  String? namePrefix;
  String? nameSuffix;
  String? nonResident;
  String? numberOfDuplicates;
  String? organDonor;
  String? permitExpirationDate;
  String? permitIdentifier;
  String? permitIssueDate;
  String? placeOfBirth;
  String? raceEthnicity;
  String? residenceCity;
  String? residenceFullAddress;
  String? residenceJurisdictionCode;
  String? residencePostalCode;
  String? residenceStreetAddress;
  String? residenceStreetAddress2;
  String? securityVersion;
  String? sex;
  String? socialSecurityNumber;
  String? standardEndorsementCode;
  String? standardRestrictionCode;
  String? standardVehicleClassification;
  String? standardVersionNumber;
  String? under18;
  String? under19;
  String? under21;
  String? uniqueCustomerId;
  String? veteran;
  String? weightKilograms;
  String? weightPounds;
  String? weightRange;

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

enum MRZDocumentType {
  unknown,

  identityCard,

  passport,

  visa,

  greenCard,

  mysPassIMM13P,

  driverLicense,

  internalTravelDocument,

  borderCrossingCard,
}

class DetailedCroppedImageResult {
  String? image;

  /// The document side that was cropped.
  ScanningSide? side;

  /// The location of the cropped image in the transformed image of the document.
  Location? location;

  DetailedCroppedImageResult(
    Map<String, dynamic> nativeDetailedCroppedImageResult,
  ) {
    image = nativeDetailedCroppedImageResult["image"];
    side = enumFromValue(
      ScanningSide.values,
      nativeDetailedCroppedImageResult["side"],
    );
    /**
     *     location =
        nativeDetailedCroppedImageResult["location"] != null
            ? Location(
              Map<String, dynamic>.from(
                nativeDetailedCroppedImageResult["location"],
              ),
            )
            : null;
     */
  }
}

enum ScanningSide { first, second }

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
