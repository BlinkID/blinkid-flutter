import 'package:json_annotation/json_annotation.dart';

part 'types.g.dart';

/// Represents a date extracted from image.
class Date {
  /// day in month
  int? day;

  /// month in year
  int? month;

  /// year
  int? year;

  Date(Map<String, dynamic> nativeDate) {
    this.day = nativeDate['day'];
    this.month = nativeDate['month'];
    this.year = nativeDate['year'];
  }
}

/// Represents a point in image
class Point {
  /// x coordinate of the point
  double? x;

  /// y coordinate of the point
  double? y;

  Point(Map<String, dynamic> nativePoint) {
    this.x = nativePoint['x'] != null ? nativePoint['x'] * 1.0 : null;
    this.y = nativePoint['y'] != null ? nativePoint['y'] * 1.0 : null;
  }
}

/// Represents a quadrilateral location in the image
class Quadrilateral {
  /// upper left point of the quadrilateral
  Point? upperLeft;

  /// upper right point of the quadrilateral
  Point? upperRight;

  /// lower left point of the quadrilateral
  Point? lowerLeft;

  /// lower right point of the quadrilateral
  Point? lowerRight;

  Quadrilateral(Map<String, dynamic> nativeQuad) {
    this.upperLeft = Point(Map<String, dynamic>.from(nativeQuad['upperLeft']));
    this.upperRight = Point(Map<String, dynamic>.from(nativeQuad['upperRight']));
    this.lowerLeft = Point(Map<String, dynamic>.from(nativeQuad['lowerLeft']));
    this.lowerRight = Point(Map<String, dynamic>.from(nativeQuad['lowerRight']));
  }
}

enum AlphabetType { Latin, Arabic, Cyrillic }

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
    this.x = nativeRect['x'] != null ? nativeRect['x'] * 1.0 : null;
    this.y = nativeRect['y'] != null ? nativeRect['y'] * 1.0 : null;
    this.width = nativeRect['width'] != null ? nativeRect['width'] * 1.0 : null;
    this.height = nativeRect['height'] != null ? nativeRect['height'] * 1.0 : null;
  }
}

///Represents document field location for three alphabets
class Location {
  Rectangle? latin;
  Rectangle? arabic;
  Rectangle? cyrillic;

  Location(Map<String, dynamic> nativeLocation) {
    this.latin = Rectangle(Map<String, dynamic>.from(nativeLocation['latin']));
    this.arabic = Rectangle(Map<String, dynamic>.from(nativeLocation['arabic']));
    this.cyrillic = Rectangle(Map<String, dynamic>.from(nativeLocation['cyrillic']));
  }
}

///Represents document side for document field for three alphabets
class Side {
  DocumentSide? latin;
  DocumentSide? arabic;
  DocumentSide? cyrillic;

  Side(Map<String, dynamic> nativeSide) {
    this.latin = DocumentSide.values[nativeSide['latin']];
    this.arabic = DocumentSide.values[nativeSide['arabic']];
    this.cyrillic = DocumentSide.values[nativeSide['cyrillic']];
  }
}

/// Represents string results for three alphabets
class StringResult {
  ///  All strings separated by new line
  String? description;

  /// String for field in latin alphabet
  String? latin;

  /// String for field in arabic alphabet
  String? arabic;

  /// String for field in cyrillic alphabet
  String? cyrillic;

  /// Document field location
  Location? location;

  /// Document field side
  Side? side;

  StringResult(Map<String, dynamic> nativeStringResult) {
    this.description = nativeStringResult['description'];
    this.latin = nativeStringResult['latin'];
    this.arabic = nativeStringResult['arabic'];
    this.cyrillic = nativeStringResult['cyrillic'];
    this.location = nativeStringResult['location'] != null
        ? Location(Map<String, dynamic>.from(nativeStringResult['location']))
        : null;
    this.side =
        nativeStringResult['location'] != null ? Side(Map<String, dynamic>.from(nativeStringResult['side'])) : null;
  }
}

enum FieldType {
  @JsonValue(0)
  AdditionalAddressInformation,
  @JsonValue(1)
  AdditionalNameInformation,
  @JsonValue(2)
  AdditionalOptionalAddressInformation,
  @JsonValue(3)
  AdditionalPersonalIdNumber,
  @JsonValue(4)
  Address,
  @JsonValue(5)
  ClassEffectiveDate,
  @JsonValue(6)
  ClassExpiryDate,
  @JsonValue(7)
  Conditions,
  @JsonValue(8)
  DateOfBirth,
  @JsonValue(9)
  DateOfExpiry,
  @JsonValue(10)
  DateOfIssue,
  @JsonValue(11)
  DocumentAdditionalNumber,
  @JsonValue(12)
  DocumentOptionalAdditionalNumber,
  @JsonValue(13)
  DocumentNumber,
  @JsonValue(14)
  Employer,
  @JsonValue(15)
  Endorsements,
  @JsonValue(16)
  FathersName,
  @JsonValue(17)
  FirstName,
  @JsonValue(18)
  FullName,
  @JsonValue(19)
  IssuingAuthority,
  @JsonValue(20)
  LastName,
  @JsonValue(21)
  LicenceType,
  @JsonValue(22)
  LocalizedName,
  @JsonValue(23)
  MaritalStatus,
  @JsonValue(24)
  MothersName,
  @JsonValue(25)
  Mrz,
  @JsonValue(26)
  Nationality,
  @JsonValue(27)
  PersonalIdNumber,
  @JsonValue(28)
  PlaceOfBirth,
  @JsonValue(29)
  Profession,
  @JsonValue(30)
  Race,
  @JsonValue(31)
  Religion,
  @JsonValue(32)
  ResidentialStatus,
  @JsonValue(33)
  Restrictions,
  @JsonValue(34)
  Sex,
  @JsonValue(35)
  VehicleClass,
  @JsonValue(36)
  BloodType,
  @JsonValue(37)
  Sponsor
}

class AdditionalProcessingInfo {
  List<FieldType>? missingMandatoryFields;
  List<FieldType>? invalidCharacterFields;
  List<FieldType>? extraPresentFields;

  AdditionalProcessingInfo(Map<String, dynamic> nativeAdditionalProcessingInfo) {
    this.missingMandatoryFields =
        List<FieldType>.from(nativeAdditionalProcessingInfo['missingMandatoryFields'].map((v) => FieldType.values[v]));
    this.invalidCharacterFields =
        List<FieldType>.from(nativeAdditionalProcessingInfo['invalidCharacterFields'].map((v) => FieldType.values[v]));
    this.extraPresentFields =
        List<FieldType>.from(nativeAdditionalProcessingInfo['extraPresentFields'].map((v) => FieldType.values[v]));
  }
}

class DateResult {
  Date? date;

  /// original date string
  StringResult? originalDateStringResult;

  /// is filled by domain knowledge
  bool? isFilledByDomainKnowledge;

  DateResult(Map<String, dynamic> nativeDateResult) {
    this.date = Date(nativeDateResult);
    this.originalDateStringResult = createStringResult(nativeDateResult, 'originalDateStringResult');
    this.isFilledByDomainKnowledge = nativeDateResult["isFilledByDomainKnowledge"];
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
  PDF417
}

/// Gives more info on data match
class DataMatchResult {
  ///  State for the whole document result
  DataMatchState? stateForWholeDocument;

  /// Date of birth result
  DataMatchState? dateOfBirth;

  /// Date of expiry result
  DataMatchState? dateOfExpiry;

  /// Document number result
  DataMatchState? documentNumber;

  DataMatchResult(Map<String, dynamic> nativeDataMatchResult) {
    this.stateForWholeDocument = DataMatchState.values[nativeDataMatchResult['stateForWholeDocument']];
    this.dateOfBirth = DataMatchState.values[nativeDataMatchResult['states'][0]['state']];
    this.dateOfExpiry = DataMatchState.values[nativeDataMatchResult['states'][1]['state']];
    this.documentNumber = DataMatchState.values[nativeDataMatchResult['states'][2]['state']];
  }
}

/// Represents data extracted from the Driver's license barcode.
class BarcodeDriverLicenseDetailedInfo {
  ///  Restrictions to driving privileges for the driver license owner.
  String? restrictions;

  /// Additional privileges granted to the driver license owner.
  String? endorsements;

  /// The type of vehicle the driver license owner has privilege to drive.
  String? vehicleClass;

  /// The driver license conditions.
  String? conditions;

  /// The additional information on vehicle class.
  List<BarcodeVehicleClassInfo>? vehicleClassesInfo;

  BarcodeDriverLicenseDetailedInfo(Map<String, dynamic> nativeDriverLicenseDetailedInfo) {
    this.restrictions = nativeDriverLicenseDetailedInfo['restrictions'];
    this.endorsements = nativeDriverLicenseDetailedInfo['endorsements'];
    this.vehicleClass = nativeDriverLicenseDetailedInfo['vehicleClass'];
    this.conditions = nativeDriverLicenseDetailedInfo['conditions'];
    this.vehicleClassesInfo = nativeDriverLicenseDetailedInfo['vehicleClassesInfo'] != null
        ? List<BarcodeVehicleClassInfo>.from(
            nativeDriverLicenseDetailedInfo['vehicleClassesInfo'].map((v) => BarcodeVehicleClassInfo(v)))
        : null;
  }
}

/// Represents data extracted from the Driver's license.
class DriverLicenseDetailedInfo {
  ///  Restrictions to driving privileges for the driver license owner.
  StringResult? restrictions;

  /// Additional privileges granted to the driver license owner.
  StringResult? endorsements;

  /// The type of vehicle the driver license owner has privilege to drive.
  StringResult? vehicleClass;

  /// The driver license conditions.
  StringResult? conditions;

  /// The additional information on vehicle class.
  List<VehicleClassInfo>? vehicleClassesInfo;

  DriverLicenseDetailedInfo(Map<String, dynamic> nativeDriverLicenseDetailedInfo) {
    this.restrictions = createStringResult(nativeDriverLicenseDetailedInfo, 'restrictions');
    this.endorsements = createStringResult(nativeDriverLicenseDetailedInfo, 'endorsements');
    this.vehicleClass = createStringResult(nativeDriverLicenseDetailedInfo, 'vehicleClass');
    this.conditions = createStringResult(nativeDriverLicenseDetailedInfo, 'conditions');
    this.vehicleClassesInfo = nativeDriverLicenseDetailedInfo['vehicleClassesInfo'] != null
        ? List<VehicleClassInfo>.from(
            nativeDriverLicenseDetailedInfo['vehicleClassesInfo'].map((v) => VehicleClassInfo(v)))
        : null;
  }
}

class BarcodeVehicleClassInfo {
  /// The type of driver licence.
  String? licenceType;

  /// The type of vehicle the driver license owner has privilege to drive.
  String? vehicleClass;

  /// The date since licence is effective.
  Date? effectiveDate;

  /// The date of expiry of licence.
  Date? expiryDate;

  BarcodeVehicleClassInfo(Map<String, dynamic> nativeVehicleClassInfo) {
    this.licenceType = nativeVehicleClassInfo['licenceType'];
    this.vehicleClass = nativeVehicleClassInfo['vehicleClass'];
    this.effectiveDate = nativeVehicleClassInfo['effectiveDate'] != null
        ? Date(Map<String, dynamic>.from(nativeVehicleClassInfo['effectiveDate']))
        : null;
    this.expiryDate = nativeVehicleClassInfo['expiryDate'] != null
        ? Date(Map<String, dynamic>.from(nativeVehicleClassInfo['expiryDate']))
        : null;
  }
}

class VehicleClassInfo {
  /// The type of driver licence.
  StringResult? licenceType;

  /// The type of vehicle the driver license owner has privilege to drive.
  StringResult? vehicleClass;

  /// The date since licence is effective.
  DateResult? effectiveDate;

  /// The date of expiry of licence.
  DateResult? expiryDate;

  VehicleClassInfo(Map<String, dynamic> nativeVehicleClassInfo) {
    this.licenceType = createStringResult(nativeVehicleClassInfo, 'licenceType');
    this.vehicleClass = createStringResult(nativeVehicleClassInfo, 'vehicleClass');
    this.effectiveDate = nativeVehicleClassInfo['effectiveDate'] != null
        ? DateResult(Map<String, dynamic>.from(nativeVehicleClassInfo['effectiveDate']))
        : null;
    this.expiryDate = nativeVehicleClassInfo['expiryDate'] != null
        ? DateResult(Map<String, dynamic>.from(nativeVehicleClassInfo['expiryDate']))
        : null;
  }
}

/// Represents the classification information.
class ClassInfo {
  /// The document country.
  Country? country;

  /// The document region.
  Region? region;

  /// The type of the scanned document.
  Type? type;

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

  ClassInfo(Map<String, dynamic> nativeClassInfo) {
    this.country = Country.values[nativeClassInfo['country']];
    this.region = Region.values[nativeClassInfo['region']];
    this.type = Type.values[nativeClassInfo['type']];
    this.empty = nativeClassInfo['empty'];
    this.countryName = nativeClassInfo['countryName'];
    this.isoNumericCountryCode = nativeClassInfo['isoNumericCountryCode'];
    this.isoAlpha2CountryCode = nativeClassInfo['isoAlpha2CountryCode'];
    this.isoAlpha3CountryCode = nativeClassInfo['isoAlpha3CountryCode'];
  }
}

/// Possible types of Machine Readable Travel Documents (MRTDs).
enum MrtdDocumentType {
  /// Unknown document type
  Unknown,

  /// Identity card
  IdentityCard,

  /// Passport
  Passport,

  /// Visa
  Visa,

  /// US Green Card
  GreenCard,

  /// Malaysian PASS type IMM13P
  MalaysianPassIMM13P,

  /// Border Crossing Card
  BorderCrossingCard
}

/// Possible types of documents scanned with IdBarcodeRecognizer.
enum IdBarcodeDocumentType {
  /// No document was scanned
  None,

  /// AAMVACompliant document was scanned
  AAMVACompliant,

  /// Argentina ID document was scanned
  ArgentinaID,

  /// ArgentinaAlienID document was scanned
  ArgentinaAlienID,

  /// Argentina driver license document was scanned
  ArgentinaDL,

  /// Colombia ID document was scanned
  ColombiaID,

  /// Colombia driver license document was scanned
  ColombiaDL,

  /// NigeriaVoter ID document was scanned
  NigeriaVoterID,

  /// Nigeria driver license document was scanned
  NigeriaDL,

  /// Panama ID document was scanned
  PanamaID,

  /// SouthAfrica ID document was scanned
  SouthAfricaID0
}

/// Document specific extended elements that contain all barcode fields in their original form.
class BarcodeElements {
  ///  Flag that indicates if barcode elements is empty
  bool? empty;

  /// Values inside barcodes. Available Keys are listed in BarcodeElementKey enum.
  List<String>? _values;

  /// Returns value for the given BarcodeElementKey, or empty string if it
  /// does not exist.
  String? getValue(BarcodeElementKey key) {
    return _values != null ? _values![key.index] : null;
  }

  BarcodeElements(Map<String, dynamic> nativeBarcodeElements) {
    this.empty = nativeBarcodeElements['empty'];
    this._values = nativeBarcodeElements['values'] != null ? List<String>.from(nativeBarcodeElements['values']) : null;
  }
}

enum BarcodeElementKey {
  //==============================================================/
  //============== 1. DETERMINING BARCODE VERSION ================/
  //==============================================================/

  /// Mandatory on all driver's licenses. All barcodes which are using 3-track magnetic
  /// stripe encoding used in the interest of smoothing a transition from legacy documents
  /// shall be designated as "Magnetic". All barcodes which are using compact encoding
  /// compliant with ISO/IEC 18013-2 shall be designated as "Compact". All barcodes (majority
  /// compliant with Mandatory PDF417 Bar Code of the American Association of Motor Vehicle
  /// Administrators (AAMVA Card Design Standard from AAMVA DL/ID-2000 standard to DL/ID-2013
  /// shall be designated as "AAMVA".
  DocumentType,

  /// AAMVA Version Number: This is a decimal value between 0 and 99 that specifies the version level of the PDF417 bar code format.
  /// Version "0" and "00" is reserved for bar codes printed to the specification of the American Association of Motor Vehicle Administrators (AAMVA prior to the adoption of the AAMVA DL/ID-2000 standard.
  ///
  /// - All barcodes compliant with AAMVA DL/ID-2000 standard shall be designated Version "01."
  /// - All barcodes compliant with AAMVA Card Design Specification version 1.0, dated 09-2003 shall be designated Version "02."
  /// - All barcodes compliant with AAMVA Card Design Specification version 2.0, dated 03-2005 shall be designated Version "03."
  /// - All barcodes compliant with AAMVA Card Design Standard version 1.0, dated 07-2009 shall be designated Version "04."
  /// - All barcodes compliant with AAMVA Card Design Standard version 1.0, dated 07-2010 shall be designated Version "05."
  /// - All barcodes compliant with AAMVA Card Design Standard version 1.0, dated 07-2011 shall be designated Version "06".
  /// - All barcodes compliant with AAMVA Card Design Standard version 1.0, dated 06-2012 shall be designated Version "07".
  /// - All barcodes compliant with this current AAMVA standard shall be designated "08".
  ///
  /// Should a need arise requiring major revision to the format, this field provides the means to accommodate additional revision.
  ///
  /// If the document type is not "AAMVA", this field defines the version number of the given document type's standard.
  StandardVersionNumber,

  //==============================================================/
  //==========          2. PERSONAL DATA KEYS          ===========/
  //==============================================================/

  /// Family name of the cardholder. (Family name is sometimes also called "last name" or "surname."
  /// Collect full name for record, print as many characters as possible on portrait side of DL/ID.
  ///
  /// Mandatory on all AAMVA, Magnetic and Compact barcodes.
  CustomerFamilyName,

  /// First name of the cardholder.
  /// Mandatory on all AAMVA, Magnetic and Compact barcodes.
  CustomerFirstName,

  /// Full name of the individual holding the Driver's License or ID.
  ///
  /// The Name field contains up to four portions, separated with the "," delimiter:
  /// Last Name (required),
  /// First Name (required),
  /// Middle Name(s) (optional),
  /// Suffix (optional).
  ///
  /// If the individual has more than one middle name they are separated with space.
  ///
  /// Mandatory on all AAMVA, Magnetic and Compact barcodes.
  CustomerFullName,

  /// Date on which the cardholder was born. (MMDDCCYY format)
  /// Mandatory on all AAMVA, Magnetic and Compact barcodes.
  DateOfBirth,

  /// Gender of the cardholder. 1 = male, 2 = female.
  ///
  /// This field is mandatory on all AAMVA and Magnetic barcodes, and optional on Compact barcodes.
  Sex,

  /// Mandatory on AAMVA 02, 03, 04, 05, 06, 07, 08 barcodes.
  /// Optional on AAMVA 01, Magnetic and Compact barcodes.
  ///
  /// Color of cardholder's eyes. (ANSI D-20 codes)
  ///
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
  EyeColor,

  /// Mandatory on all AAMVA and Magnetic barcodes. On compact barcodes, use kFullAddress.
  /// Street portion of the cardholder address. The place where the registered driver of a vehicle (individual or corporation
  /// may be contacted such as a house number, street address, etc.
  AddressStreet,

  /// Mandatory on all AAMVA and Magnetic barcodes. On compact barcodes, use kFullAddress.
  /// City portion of the cardholder address.
  AddressCity,

  /// Mandatory on all AAMVA and Magnetic barcodes. On compact barcodes, use kFullAddress.
  ///
  /// State portion of the cardholder address.
  AddressJurisdictionCode,

  /// Postal code portion of the cardholder address in the U.S. and Canada. If the
  /// trailing portion of the postal code in the U.S. is not known, zeros can be used
  /// to fill the trailing set of numbers up to nine (9 digits).
  ///
  /// This field is mandatory on all AAMVA and Magnetic barcodes. On compact barcodes, use kFullAddress.
  AddressPostalCode,

  /// Mandatory on all AAMVA and Magnetic barcodes.
  /// Optional on Compact barcodes.
  ///
  /// Full address of the individual holding the Driver's License or ID.
  ///
  /// The full address field contains up to four portions, separated with the "," delimiter:
  /// Street Address (required
  /// , (required if other address portions follow, otherwise optional
  /// City (optional
  /// , (required if other address portions follow, otherwise optional
  /// Jurisdiction Code (optional
  /// , (required if other address portions follow, otherwise optional
  /// ZIP - Postal Code (optional
  FullAddress,

  /// Mandatory on AAMVA 02, 03, 04, 05, 06, 07, 08 and Compact barcodes.
  /// Optional on AAMVA 01 and Magnetic barcodes.
  ///
  /// Height of cardholder, either in Inches or in Centimeters.
  ///
  /// Inches (in: number of inches followed by " in"
  /// example: 6'1'' = "73 in"
  ///
  /// Centimeters (cm: number of centimeters followed by " cm"
  /// example: 181 centimeters = "181 cm"
  Height,

  /// Mandatory on AAMVA 02, 03, 04, 05, 06, 07, 08 and Compact barcodes.
  /// Optional on AAMVA 01 and Magnetic barcodes.
  ///
  /// Height of cardholder in Inches.
  /// Example: 5'9'' = "69".
  HeightIn,

  /// Mandatory on AAMVA 02, 03, 04, 05, 06, 07, 08 Compact barcodes.
  /// Optional on AAMVA 01 and Magnetic barcodes.
  ///
  /// Height of cardholder in Centimeters.
  /// Example: 180 Centimeters = "180".
  HeightCm,

  /// Mandatory on AAMVA 04, 05, 06, 07, 08 barcodes.
  /// Optional on AAMVA 01, 02, 03, Magnetic and Compcat barcodes.
  ///
  /// Middle name(s of the cardholder. In the case of multiple middle names they
  /// shall be separated by space " ".
  ///
  /// CustomerMiddleName,

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
  HairColor,

  /// Mandatory on AAMVA 02 barcodes.
  /// Optional on AAMVA 01, 03, 04, 05, 06, 07, 08, Magnetic and Compact barcodes.
  ///
  /// Name Suffix (If jurisdiction participates in systems requiring name suffix (PDPS, CDLIS, etc.,
  /// the suffix must be collected and displayed on the DL/ID and in the MRT.
  /// - JR (Junior
  /// - SR (Senior
  /// - 1ST or I (First
  /// - 2ND or II (Second
  /// - 3RD or III (Third
  /// - 4TH or IV (Fourth
  /// - 5TH or V (Fifth
  /// - 6TH or VI (Sixth
  /// - 7TH or VII (Seventh
  /// - 8TH or VIII (Eighth
  /// - 9TH or IX (Ninth
  NameSuffix,

  /// Optional on all AAMVA and Compact barcodes.
  ///
  /// Other name by which the cardholder is known. ALTERNATIVE NAME(S of the individual
  /// holding the Driver License or ID.
  ///
  /// The Name field contains up to four portions, separated with the "," delimiter:
  /// AKA Last Name (required
  /// , (required
  /// AKA First Name (required
  /// , (required if other name portions follow, otherwise optional
  /// AKA Middle Name(s (optional
  /// , (required if other name portions follow, otherwise optional
  /// AKA Suffix (optional
  /// , (optional
  ///
  /// If the individual has more than one AKA middle name they are separated with space.
  AKAFullName,

  /// Optional on all AAMVA and Compact barcodes.
  ///
  /// Other family name by which the cardholder is known.
  AKAFamilyName,

  /// Optional on all AAMVA and Compact barcodes.
  ///
  /// Other given name by which the cardholder is known
  AKAGivenName,

  /// Optional on all AAMVA and Compact barcodes.
  ///
  /// Other suffix by which the cardholder is known.
  ///
  /// The Suffix Code Portion, if submitted, can contain only the Suffix Codes shown in the following table (e.g., Andrew Johnson, III = JOHNSON@ANDREW@@3RD:
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
  ///
  AKASuffixName,

  /// Mandatory on AAMVA 02 barcodes.
  /// Optional on AAMVA 01, 03, 04, 05, 06, 07, 08, Magnetic and Compact barcodes.
  ///
  /// Indicates the approximate weight range of the cardholder:
  /// 0 = up to 31 kg (up to 70 lbs
  /// 1 = 32 – 45 kg (71 – 100 lbs
  /// 2 = 46 - 59 kg (101 – 130 lbs
  /// 3 = 60 - 70 kg (131 – 160 lbs
  /// 4 = 71 - 86 kg (161 – 190 lbs
  /// 5 = 87 - 100 kg (191 – 220 lbs
  /// 6 = 101 - 113 kg (221 – 250 lbs
  /// 7 = 114 - 127 kg (251 – 280 lbs
  /// 8 = 128 – 145 kg (281 – 320 lbs
  /// 9 = 146+ kg (321+ lbs
  WeightRange,

  /// Mandatory on AAMVA 02 barcodes.
  /// Optional on AAMVA 01, 03, 04, 05, 06, 07, 08, Magnetic and Compact barcodes.
  ///
  /// Cardholder weight in pounds Example: 185 lb = "185"
  WeightPounds,

  /// Mandatory on AAMVA 02 barcodes.
  /// Optional on AAMVA 01, 03, 04, 05, 06, 07, 08, Magnetic and Compact barcodes.
  ///
  /// Cardholder weight in kilograms Example: 84 kg = "084"
  WeightKilograms,

  /// Mandatory on all AAMVA and Compact barcodes.
  ///
  /// The number assigned or calculated by the issuing authority.
  CustomerIdNumber,

  /// Mandatory on AAMVA 04, 05, 06, 07, 08 barcodes.
  /// Optional on Compact barcodes.
  ///
  /// A code that indicates whether a field has been truncated (T, has not been
  /// truncated (N, or – unknown whether truncated (U.
  FamilyNameTruncation,

  /// Mandatory on AAMVA 04, 05, 06, 07, 08 barcodes.
  /// Optional on Compact barcodes.

  /// A code that indicates whether a field has been truncated (T, has not been
  /// truncated (N, or – unknown whether truncated (U.
  FirstNameTruncation,

  /// Mandatory on AAMVA 04, 05, 06, 07, 08 barcodes.
  ///
  /// A code that indicates whether a field has been truncated (T, has not been
  /// truncated (N, or – unknown whether truncated (U.
  MiddleNameTruncation,

  /// Optional on AAMVA 02, 03, 04, 05, 06, 07, 08 and Compact barcodes.
  ///
  /// Country and municipality and/or state/province.
  PlaceOfBirth,

  /// Optional on all AAMVA barcodes.
  ///
  /// On Compact barcodes, use kFullAddress.
  ///
  /// Second line of street portion of the cardholder address.
  AddressStreet2,

  /// Optional on AAMVA 02, 03, 04, 05, 06, 07, 08 and Compact barcodes.
  ///
  /// Codes for race or ethnicity of the cardholder, as defined in ANSI D20.
  ///
  /// Race:
  /// Code   Description
  /// AI     Alaskan or American Indian (Having Origins in Any of The Original Peoples of
  ///         North America, and Maintaining Cultural Identification Through Tribal
  ///         Affiliation of Community Recognition
  /// AP     Asian or Pacific Islander (Having Origins in Any of the Original Peoples of
  ///         the Far East, Southeast Asia, or Pacific Islands. This Includes China, India,
  ///         Japan, Korea, the Philippines Islands, and Samoa
  /// BK     Black (Having Origins in Any of the Black Racial Groups of Africa
  /// W      White (Having Origins in Any of The Original Peoples of Europe, North Africa,
  ///         or the Middle East
  ///
  /// Ethnicity:
  /// Code   Description
  /// H      Hispanic Origin (A Person of Mexican, Puerto Rican, Cuban, Central or South
  ///         American or Other Spanish Culture or Origin, Regardless of Race
  /// O      Not of Hispanic Origin (Any Person Other Than Hispanic
  /// U      Unknown
  RaceEthnicity,

  /// Optional on AAMVA 01 barcodes.
  ///
  /// PREFIX to Driver Name. Freeform as defined by issuing jurisdiction.
  NamePrefix,

  /// Mandatory on AAMVA 02, 03, 04, 05, 06, 07, 08 and Compact barcodes.
  ///
  /// Country in which DL/ID is issued. U.S. = USA, Canada = CAN.
  CountryIdentification,

  /// Optional on AAMVA version 01.
  ///
  /// Driver Residence Street Address 1.
  ResidenceStreetAddress,

  /// Optional on AAMVA version 01.
  ///
  /// Driver Residence Street Address 2.
  ResidenceStreetAddress2,

  /// Optional on AAMVA version 01.
  ///
  /// Driver Residence City
  ResidenceCity,

  /// Optional on AAMVA version 01.
  ///
  /// Driver Residence Jurisdiction Code.
  ResidenceJurisdictionCode,

  /// Optional on AAMVA 01 barcodes.
  ///
  /// Driver Residence Postal Code.
  ResidencePostalCode,

  /// Optional on AAMVA 01 barcodes.
  ///
  /// Full residence address of the individual holding the Driver's License or ID.
  ///
  /// The full address field contains up to four portions, separated with the "," delimiter:
  /// Residence Street Address (required
  /// , (required if other address portions follow, otherwise optional
  /// Residence City (optional
  /// , (required if other address portions follow, otherwise optional
  /// Residence Jurisdiction Code (optional
  /// , (required if other address portions follow, otherwise optional
  /// Residence ZIP - Residence Postal Code (optional)

  ResidenceFullAddress,

  /// Optional on AAMVA 05, 06, 07, 08 barcodes.
  ///
  /// Date on which the cardholder turns 18 years old. (MMDDCCYY format)
  Under18,

  /// Optional on AAMVA 05, 06, 07, 08 barcodes.
  ///
  /// Date on which the cardholder turns 19 years old. (MMDDCCYY format)
  Under19,

  /// Optional on AAMVA 05, 06, 07, 08 barcodes.
  ///
  /// Date on which the cardholder turns 21 years old. (MMDDCCYY format)
  Under21,

  /// Optional on AAMVA version 01.
  ///
  /// The number assigned to the individual by the Social Security Administration.
  SocialSecurityNumber,

  /// Optional on AAMVA version 01.
  ///
  /// Driver "AKA" Social Security Number. FORMAT SAME AS DRIVER SOC SEC NUM. ALTERNATIVE NUMBERS(S used as SS NUM.
  AKASocialSecurityNumber,

  /// Optional on AAMVA 01 barcodes.
  ///
  /// ALTERNATIVE MIDDLE NAME(s or INITIALS of the individual holding the Driver License or ID.
  /// Hyphenated names acceptable, spaces between names acceptable, but no other
  /// use of special symbols.
  AKAMiddleName,

  /// Optional on AAMVA 01 barcodes.
  ///
  /// ALTERNATIVE PREFIX to Driver Name. Freeform as defined by issuing jurisdiction.
  AKAPrefixName,

  /// Optional on AAMVA 01, 06, 07, 08 barcodes.
  ///
  /// Field that indicates that the cardholder is an organ donor = "1".
  OrganDonor,

  /// Optional on AAMVA 07, 08 barcodes.
  ///
  /// Field that indicates that the cardholder is a veteran = "1"
  Veteran,

  /// Optional on AAMVA 01. (MMDDCCYY format)
  ///
  /// ALTERNATIVE DATES(S given as date of birth.
  AKADateOfBirth,

  //==============================================================/
  //==========          3. LICENSE DATA KEYS          ============/
  //==============================================================/

  /// Mandatory on all AAMVA, Magnetic and Compact barcodes.
  ///
  /// This number uniquely identifies the issuing jurisdiction and can
  /// be obtained by contacting the ISO Issuing Authority (AAMVA
  IssuerIdentificationNumber,

  /// Mandatory on all AAMVA, Magnetic and Compact barcodes.
  ///
  /// If the document is non expiring then "Non expiring" is written in this field.
  ///
  /// Date on which the driving and identification privileges granted by the document are
  /// no longer valid. (MMDDCCYY format)
  DocumentExpirationDate,

  /// Mandatory on all AAMVA and Compact barcodes.
  /// Optional on Magnetic barcodes.
  ///
  /// Jurisdiction Version Number: This is a decimal value between 0 and 99 that
  /// specifies the jurisdiction version level of the PDF417 barcode format.
  /// Notwithstanding iterations of this standard, jurisdictions implement incremental
  /// changes to their barcodes, including new jurisdiction-specific data, compression
  /// algorithms for digitized images, digital signatures, or new truncation
  /// conventions used for names and addresses. Each change to the barcode format
  /// within each AAMVA version (above must be noted, beginning with Jurisdiction
  /// Version 00.
  JurisdictionVersionNumber,

  /// Mandatory on all AAMVA and Magnetic barcodes.
  ///
  /// Jurisdiction-specific vehicle class / group code, designating the type
  /// of vehicle the cardholder has privilege to drive.
  JurisdictionVehicleClass,

  /// Mandatory on all AAMVA barcodes.
  /// Optional on Magnetic barcodes.
  ///
  /// Jurisdiction-specific codes that represent restrictions to driving
  /// privileges (such as airbrakes, automatic transmission, daylight only, etc..
  JurisdictionRestrictionCodes,

  /// Mandatory on all AAMVA barcodes.
  /// Optional on Magnetic barcodes.
  ///
  /// Jurisdiction-specific codes that represent additional privileges
  /// granted to the cardholder beyond the vehicle class (such as transportation of
  /// passengers, hazardous materials, operation of motorcycles, etc..
  JurisdictionEndorsementCodes,

  /// Mandatory on all AAMVA and Compact barcodes.
  ///
  /// Date on which the document was issued. (MMDDCCYY format)
  DocumentIssueDate,

  /// Mandatory on AAMVA versions 02 and 03.
  ///
  /// Federally established codes for vehicle categories, endorsements, and restrictions
  /// that are generally applicable to commercial motor vehicles. If the vehicle is not a
  /// commercial vehicle, "NONE" is to be entered.
  FederalCommercialVehicleCodes,

  /// Optional on all AAMVA barcodes.
  /// Mandatory on Compact barcodes.
  /// Jurisdictions may define a subfile to contain jurisdiction-specific information.
  /// These subfiles are designated with the first character of “Z” and the second
  /// character is the first letter of the jurisdiction's name. For example, "ZC" would
  /// be the designator for a California or Colorado jurisdiction-defined subfile, "ZQ"
  /// would be the designator for a Quebec jurisdiction-defined subfile. In the case of
  /// a jurisdiction-defined subfile that has a first letter that could be more than
  /// one jurisdiction (e.g. California, Colorado, Connecticut then other data, like
  /// the IIN or address, must be examined to determine the jurisdiction.
  IssuingJurisdiction,

  /// Optional on all AAMVA barcodes.
  /// Mandatory on Compact barcodes.
  ///
  /// Standard vehicle classification code(s for cardholder. This data element is a
  /// placeholder for future efforts to standardize vehicle classifications.
  StandardVehicleClassification,

  /// Optional on all AAMVA and Magnetic barcodes.
  ///
  /// Name of issuing jurisdiction, for example: Alabama, Alaska ...
  IssuingJurisdictionName,

  /// Optional on all AAMVA barcodes.
  ///
  /// Standard endorsement code(s for cardholder. See codes in D20. This data element is a
  /// placeholder for future efforts to standardize endorsement codes.
  ///
  /// Code   Description
  /// H      Hazardous Material - This endorsement is required for the operation of any vehicle
  ///         transporting hazardous materials requiring placarding, as defined by U.S.
  ///         Department of Transportation regulations.
  /// L      Motorcycles – Including Mopeds/Motorized Bicycles.
  /// N      Tank - This endorsement is required for the operation of any vehicle transporting,
  ///         as its primary cargo, any liquid or gaseous material within a tank attached to the vehicle.
  /// O      Other Jurisdiction Specific Endorsement(s - This code indicates one or more
  ///         additional jurisdiction assigned endorsements.
  /// P      Passenger - This endorsement is required for the operation of any vehicle used for
  ///         transportation of sixteen or more occupants, including the driver.
  /// S      School Bus - This endorsement is required for the operation of a school bus. School bus means a
  ///         CMV used to transport pre-primary, primary, or secondary school students from home to school,
  ///         from school to home, or to and from school sponsored events. School bus does not include a
  ///         bus used as common carrier (49 CRF 383.5.
  /// T      Doubles/Triples - This endorsement is required for the operation of any vehicle that would be
  ///         referred to as a double or triple.
  /// X      Combined Tank/HAZ-MAT - This endorsement may be issued to any driver who qualifies for
  ///         both the N and H endorsements.
  StandardEndorsementCode,

  /// Optional on all AAMVA barcodes.
  ///
  /// Standard restriction code(s for cardholder. See codes in D20. This data element is a placeholder
  /// for future efforts to standardize restriction codes.
  ///
  /// Code   Description
  /// B      Corrective Lenses
  /// C      Mechanical Devices (Special Brakes, Hand Controls, or Other Adaptive Devices
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
  StandardRestrictionCode,

  /// Optional on AAMVA 02, 03, 04, 05, 06, 07, 08 and Compact barcodes.
  ///
  /// Text that explains the jurisdiction-specific code(s for classifications
  /// of vehicles cardholder is authorized to drive.
  JurisdictionVehicleClassificationDescription,

  /// Optional on AAMVA 02, 03, 04, 05, 06, 07, 08 and Compact barcodes.
  ///
  /// Text that explains the jurisdiction-specific code(s that indicates additional
  /// driving privileges granted to the cardholder beyond the vehicle class.
  JurisdictionEndorsmentCodeDescription,

  /// Optional on AAMVA 02, 03, 04, 05, 06, 07, 08 and Compact barcodes.
  ///
  /// Text describing the jurisdiction-specific restriction code(s that curtail driving privileges.
  JurisdictionRestrictionCodeDescription,

  /// Optional on AAMVA 02, 03, 04, 05, 06, 07, 08 barcodes.
  ///
  /// A string of letters and/or numbers that is affixed to the raw materials (card stock,
  /// laminate, etc. used in producing driver's licenses and ID cards. (DHS recommended field

  InventoryControlNumber,

  /// Optional on AAMVA 04, 05, 06, 07, 08 and Compact barcodes.
  ///
  /// DHS required field that indicates date of the most recent version change or
  /// modification to the visible format of the DL/ID. (MMDDCCYY format
  CardRevisionDate,

  /// Mandatory on AAMVA 02, 03, 04, 05, 06, 07, 08 and Magnetic barcodes.
  /// Optional and Compact barcodes.
  ///
  /// Number must uniquely identify a particular document issued to that customer
  /// from others that may have been issued in the past. This number may serve multiple
  /// purposes of document discrimination, audit information number, and/or inventory control.
  DocumentDiscriminator,

  /// Optional on AAMVA 04, 05, 06, 07, 08 and Compact barcodes.
  ///
  /// DHS required field that indicates that the cardholder has temporary lawful status = "1".
  LimitedDurationDocument,

  /// Optional on AAMVA 02, 03, 04, 05, 06, 07, 08 and Compact barcodes.
  ///
  /// A string of letters and/or numbers that identifies when, where, and by whom a driver's
  /// license/ID card was made. If audit information is not used on the card or the MRT, it
  /// must be included in the driver record.
  AuditInformation,

  /// Optional on AAMVA 04, 05, 06, 07, 08 and Compact barcodes.
  ///
  /// DHS required field that indicates compliance: "M" = materially compliant,
  /// "F" = fully compliant, and, "N" = non-compliant.
  ComplianceType,

  /// Optional on AAMVA version 01 barcodes.
  ///
  /// Issue Timestamp. A string used by some jurisdictions to validate the document against their data base.
  IssueTimestamp,

  /// Optional on AAMVA version 01 barcodes.
  ///
  /// Driver Permit Expiration Date. MMDDCCYY format. Date permit expires.
  PermitExpirationDate,

  /// Optional on AAMVA version 01 barcodes.
  ///
  /// Type of permit.
  PermitIdentifier,

  /// Optional on AAMVA version 01 barcodes.
  ///
  /// Driver Permit Issue Date. MMDDCCYY format. Date permit was issued.
  PermitIssueDate,

  /// Optional on AAMVA version 01.
  ///
  /// Number of duplicate cards issued for a license or ID if any.
  NumberOfDuplicates,

  /// Optional on AAMVA 04, 05, 06, 07, 08 and Compact barcodes.
  ///
  /// Date on which the hazardous material endorsement granted by the document is
  /// no longer valid. (MMDDCCYY format)
  HAZMATExpirationDate,

  /// Optional on AAMVA version 01.
  ///
  /// Medical Indicator/Codes.
  /// STATE SPECIFIC. Freeform, Standard "TBD"
  MedicalIndicator,

  /// Optional on AAMVA version 01.
  ///
  /// Non-Resident Indicator. "Y". Used by some jurisdictions to indicate holder of the document is a non-resident.
  NonResident,

  /// Optional on AAMVA version 01.
  ///
  /// A number or alphanumeric string used by some jurisdictions to identify a "customer" across multiple data bases.
  UniqueCustomerId,

  /// Optional on compact barcodes.
  ///
  /// Document discriminator.
  DataDiscriminator,

  /// Optional on Magnetic barcodes.
  ///
  /// Month on which the driving and identification privileges granted by the document are
  /// no longer valid. (MMYY format
  DocumentExpirationMonth,

  /// Optional on Magnetic barcodes.
  ///
  /// Field that indicates that the driving and identification privileges granted by the
  /// document are nonexpiring = "1".
  DocumentNonexpiring,

  /// Optional on Magnetic barcodes.

  /// Security version beeing used.

  SecurityVersion
}

/// Defines possible color statuses determined from scanned image scanned with BlinkID or BlinkID MultiSide Recognizer
enum DocumentImageColorStatus {
  /// Determining image color status was not performed
  NotAvailable,

  /// Black-and-white image scanned
  BlackAndWhite,

  /// Color image scanned
  Color
}

/// Defines possible states of detection.
enum ImageAnalysisDetectionStatus {
  /// Detection was not performed
  NotAvailable,

  /// Not detected on input image
  NotDetected,

  /// Detected on input image
  Detected
}

/// Defines possible document card rotation positions
enum CardRotation {
  /// Zero degrees
  Zero,

  /// Clockwise 90 degrees
  Clockwise90,

  /// Counter clockwise 90 degrees
  CounterClockwise90,

  ///Upside down
  UpsideDown,

  ///Card rotation was not performed
  None
}

/// Defines possible the document country from ClassInfo scanned with BlinkID or BlinkID MultiSide Recognizer
enum Country {
  @JsonValue(0)
  None,
  @JsonValue(1)
  Albania,
  @JsonValue(2)
  Algeria,
  @JsonValue(3)
  Argentina,
  @JsonValue(4)
  Australia,
  @JsonValue(5)
  Austria,
  @JsonValue(6)
  Azerbaijan,
  @JsonValue(7)
  Bahrain,
  @JsonValue(8)
  Bangladesh,
  @JsonValue(9)
  Belgium,
  @JsonValue(10)
  BosniaAndHerzegovina,
  @JsonValue(11)
  Brunei,
  @JsonValue(12)
  Bulgaria,
  @JsonValue(13)
  Cambodia,
  @JsonValue(14)
  Canada,
  @JsonValue(15)
  Chile,
  @JsonValue(16)
  Colombia,
  @JsonValue(17)
  CostaRica,
  @JsonValue(18)
  Croatia,
  @JsonValue(19)
  Cyprus,
  @JsonValue(20)
  Czechia,
  @JsonValue(21)
  Denmark,
  @JsonValue(22)
  DominicanRepublic,
  @JsonValue(23)
  Egypt,
  @JsonValue(24)
  Estonia,
  @JsonValue(25)
  Finland,
  @JsonValue(26)
  France,
  @JsonValue(27)
  Georgia,
  @JsonValue(28)
  Germany,
  @JsonValue(29)
  Ghana,
  @JsonValue(30)
  Greece,
  @JsonValue(31)
  Guatemala,
  @JsonValue(32)
  HongKong,
  @JsonValue(33)
  Hungary,
  @JsonValue(34)
  India,
  @JsonValue(35)
  Indonesia,
  @JsonValue(36)
  Ireland,
  @JsonValue(37)
  Israel,
  @JsonValue(38)
  Italy,
  @JsonValue(39)
  Jordan,
  @JsonValue(40)
  Kazakhstan,
  @JsonValue(41)
  Kenya,
  @JsonValue(42)
  Kosovo,
  @JsonValue(43)
  Kuwait,
  @JsonValue(44)
  Latvia,
  @JsonValue(45)
  Lithuania,
  @JsonValue(46)
  Malaysia,
  @JsonValue(47)
  Maldives,
  @JsonValue(48)
  Malta,
  @JsonValue(49)
  Mauritius,
  @JsonValue(50)
  Mexico,
  @JsonValue(51)
  Morocco,
  @JsonValue(52)
  Netherlands,
  @JsonValue(53)
  NewZealand,
  @JsonValue(54)
  Nigeria,
  @JsonValue(55)
  Pakistan,
  @JsonValue(56)
  Panama,
  @JsonValue(57)
  Paraguay,
  @JsonValue(58)
  Philippines,
  @JsonValue(59)
  Poland,
  @JsonValue(60)
  Portugal,
  @JsonValue(61)
  PuertoRico,
  @JsonValue(62)
  Qatar,
  @JsonValue(63)
  Romania,
  @JsonValue(64)
  Russia,
  @JsonValue(65)
  SaudiArabia,
  @JsonValue(66)
  Serbia,
  @JsonValue(67)
  Singapore,
  @JsonValue(68)
  Slovakia,
  @JsonValue(69)
  Slovenia,
  @JsonValue(70)
  SouthAfrica,
  @JsonValue(71)
  Spain,
  @JsonValue(72)
  Sweden,
  @JsonValue(73)
  Switzerland,
  @JsonValue(74)
  Taiwan,
  @JsonValue(75)
  Thailand,
  @JsonValue(76)
  Tunisia,
  @JsonValue(77)
  Turkey,
  @JsonValue(78)
  UAE,
  @JsonValue(79)
  Uganda,
  @JsonValue(80)
  UK,
  @JsonValue(81)
  Ukraine,
  @JsonValue(82)
  Usa,
  @JsonValue(83)
  Vietnam,
  @JsonValue(84)
  Brazil,
  @JsonValue(85)
  Norway,
  @JsonValue(86)
  Oman,
  @JsonValue(87)
  Ecuador,
  @JsonValue(88)
  ElSalvador,
  @JsonValue(89)
  SriLanka,
  @JsonValue(90)
  Peru,
  @JsonValue(91)
  Uruguay,
  @JsonValue(92)
  Bahamas,
  @JsonValue(93)
  Bermuda,
  @JsonValue(94)
  Bolivia,
  @JsonValue(95)
  China,
  @JsonValue(96)
  EuropeanUnion,
  @JsonValue(97)
  Haiti,
  @JsonValue(98)
  Honduras,
  @JsonValue(99)
  Iceland,
  @JsonValue(100)
  Japan,
  @JsonValue(101)
  Luxembourg,
  @JsonValue(102)
  Montenegro,
  @JsonValue(103)
  Nicaragua,
  @JsonValue(104)
  SouthKorea,
  @JsonValue(105)
  Venezuela,
  @JsonValue(106)
  Afghanistan,
  @JsonValue(107)
  AlandIslands,
  @JsonValue(108)
  AmericanSamoa,
  @JsonValue(109)
  Andorra,
  @JsonValue(110)
  Angola,
  @JsonValue(111)
  Anguilla,
  @JsonValue(112)
  Antarctica,
  @JsonValue(113)
  AntiguaAndBarbuda,
  @JsonValue(114)
  Armenia,
  @JsonValue(115)
  Aruba,
  @JsonValue(116)
  BailiwickOfGuernsey,
  @JsonValue(117)
  BailiwickOfJersey,
  @JsonValue(118)
  Barbados,
  @JsonValue(119)
  Belarus,
  @JsonValue(120)
  Belize,
  @JsonValue(121)
  Benin,
  @JsonValue(122)
  Bhutan,
  @JsonValue(123)
  BonaireSaintEustatiusAndSaba,
  @JsonValue(124)
  Botswana,
  @JsonValue(125)
  BouvetIsland,
  @JsonValue(126)
  BritishIndianOceanTerritory,
  @JsonValue(127)
  BurkinaFaso,
  @JsonValue(128)
  Burundi,
  @JsonValue(129)
  Cameroon,
  @JsonValue(130)
  CapeVerde,
  @JsonValue(131)
  CaribbeanNetherlands,
  @JsonValue(132)
  CaymanIslands,
  @JsonValue(133)
  CentralAfricanRepublic,
  @JsonValue(134)
  Chad,
  @JsonValue(135)
  ChristmasIsland,
  @JsonValue(136)
  CocosIslands,
  @JsonValue(137)
  Comoros,
  @JsonValue(138)
  Congo,
  @JsonValue(139)
  CookIslands,
  @JsonValue(140)
  Cuba,
  @JsonValue(141)
  Curacao,
  @JsonValue(142)
  DemocraticRepublicOfTheCongo,
  @JsonValue(143)
  Djibouti,
  @JsonValue(144)
  Dominica,
  @JsonValue(145)
  EastTimor,
  @JsonValue(146)
  EquatorialGuinea,
  @JsonValue(147)
  Eritrea,
  @JsonValue(148)
  Ethiopia,
  @JsonValue(149)
  FalklandIslands,
  @JsonValue(150)
  FaroeIslands,
  @JsonValue(151)
  FederatedStatesOfMicronesia,
  @JsonValue(152)
  Fiji,
  @JsonValue(153)
  FrenchGuiana,
  @JsonValue(154)
  FrenchPolynesia,
  @JsonValue(155)
  FrenchSouthernTerritories,
  @JsonValue(156)
  Gabon,
  @JsonValue(157)
  Gambia,
  @JsonValue(158)
  Gibraltar,
  @JsonValue(159)
  Greenland,
  @JsonValue(160)
  Grenada,
  @JsonValue(161)
  Guadeloupe,
  @JsonValue(162)
  Guam,
  @JsonValue(163)
  Guinea,
  @JsonValue(164)
  GuineaBissau,
  @JsonValue(165)
  Guyana,
  @JsonValue(166)
  HeardIslandAndMcdonaldIslands,
  @JsonValue(167)
  Iran,
  @JsonValue(168)
  Iraq,
  @JsonValue(169)
  IsleOfMan,
  @JsonValue(170)
  IvoryCoast,
  @JsonValue(171)
  Jamaica,
  @JsonValue(172)
  Kiribati,
  @JsonValue(173)
  Kyrgyzstan,
  @JsonValue(183)
  Laos,
  @JsonValue(184)
  Lebanon,
  @JsonValue(185)
  Lesotho,
  @JsonValue(186)
  Liberia,
  @JsonValue(187)
  Libya,
  @JsonValue(188)
  Liechtenstein,
  @JsonValue(189)
  Macau,
  @JsonValue(190)
  Madagascar,
  @JsonValue(191)
  Malawi,
  @JsonValue(192)
  Mali,
  @JsonValue(193)
  MarshallIslands,
  @JsonValue(194)
  Martinique,
  @JsonValue(195)
  Mauritania,
  @JsonValue(196)
  Mayotte,
  @JsonValue(197)
  Moldova,
  @JsonValue(198)
  Monaco,
  @JsonValue(199)
  Mongolia,
  @JsonValue(200)
  Montserrat,
  @JsonValue(201)
  Mozambique,
  @JsonValue(202)
  Myanmar,
  @JsonValue(203)
  Namibia,
  @JsonValue(204)
  Nauru,
  @JsonValue(205)
  Nepal,
  @JsonValue(206)
  NewCaledonia,
  @JsonValue(207)
  Niger,
  @JsonValue(208)
  Niue,
  @JsonValue(209)
  NorfolkIsland,
  @JsonValue(210)
  NorthernCyprus,
  @JsonValue(211)
  NorthernMarianaIslands,
  @JsonValue(212)
  NorthKorea,
  @JsonValue(213)
  NorthMacedonia,
  @JsonValue(214)
  Palau,
  @JsonValue(215)
  Palestine,
  @JsonValue(216)
  PapuaNewGuinea,
  @JsonValue(217)
  Pitcairn,
  @JsonValue(218)
  Reunion,
  @JsonValue(219)
  Rwanda,
  @JsonValue(220)
  SaintBarthelemy,
  @JsonValue(221)
  SaintHelenaAscensionAndTristianDaCunha,
  @JsonValue(222)
  SaintKittsAndNevis,
  @JsonValue(223)
  SaintLucia,
  @JsonValue(224)
  SaintMartin,
  @JsonValue(225)
  SaintPierreAndMiquelon,
  @JsonValue(226)
  SaintVincentAndTheGrenadines,
  @JsonValue(227)
  Samoa,
  @JsonValue(228)
  SanMarino,
  @JsonValue(229)
  SaoTomeAndPrincipe,
  @JsonValue(230)
  Senegal,
  @JsonValue(231)
  Seychelles,
  @JsonValue(232)
  SierraLeone,
  @JsonValue(233)
  SintMaarten,
  @JsonValue(234)
  SolomonIslands,
  @JsonValue(235)
  Somalia,
  @JsonValue(236)
  SouthGeorgiaAndTheSouthSandwichIslands,
  @JsonValue(237)
  SouthSudan,
  @JsonValue(238)
  Sudan,
  @JsonValue(239)
  Suriname,
  @JsonValue(240)
  SvalbardAndJanMayen,
  @JsonValue(241)
  Eswatini,
  @JsonValue(242)
  Syria,
  @JsonValue(243)
  Tajikistan,
  @JsonValue(244)
  Tanzania,
  @JsonValue(245)
  Togo,
  @JsonValue(246)
  Tokelau,
  @JsonValue(247)
  Tonga,
  @JsonValue(248)
  TrinidadAndTobago,
  @JsonValue(249)
  Turkmenistan,
  @JsonValue(250)
  TurksAndCaicosIslands,
  @JsonValue(251)
  Tuvalu,
  @JsonValue(252)
  UnitedStatesMinorOutlyingIslands,
  @JsonValue(253)
  Uzbekistan,
  @JsonValue(254)
  Vanuatu,
  @JsonValue(255)
  VaticanCity,
  @JsonValue(256)
  VirginIslandsBritish,
  @JsonValue(257)
  VirginIslandsUs,
  @JsonValue(258)
  WallisAndFutuna,
  @JsonValue(259)
  WesternSahara,
  @JsonValue(260)
  Yemen,
  @JsonValue(261)
  Yugoslavia,
  @JsonValue(262)
  Zambia,
  @JsonValue(263)
  Zimbabwe,
  @JsonValue(264)
  SchengenArea
}

/// Defines possible the document country's region from ClassInfo scanned with BlinkID or BlinkID MultiSide Recognizer
enum Region {
  @JsonValue(0)
  None,
  @JsonValue(1)
  Alabama,
  @JsonValue(2)
  Alaska,
  @JsonValue(3)
  Alberta,
  @JsonValue(4)
  Arizona,
  @JsonValue(5)
  Arkansas,
  @JsonValue(6)
  AustralianCapitalTerritory,
  @JsonValue(7)
  BritishColumbia,
  @JsonValue(8)
  California,
  @JsonValue(9)
  Colorado,
  @JsonValue(10)
  Connecticut,
  @JsonValue(11)
  Delaware,
  @JsonValue(12)
  DistrictOfColumbia,
  @JsonValue(13)
  Florida,
  @JsonValue(14)
  Georgia,
  @JsonValue(15)
  Hawaii,
  @JsonValue(16)
  Idaho,
  @JsonValue(17)
  Illinois,
  @JsonValue(18)
  Indiana,
  @JsonValue(19)
  Iowa,
  @JsonValue(20)
  Kansas,
  @JsonValue(21)
  Kentucky,
  @JsonValue(22)
  Louisiana,
  @JsonValue(23)
  Maine,
  @JsonValue(24)
  Manitoba,
  @JsonValue(25)
  Maryland,
  @JsonValue(26)
  Massachusetts,
  @JsonValue(27)
  Michigan,
  @JsonValue(28)
  Minnesota,
  @JsonValue(29)
  Mississippi,
  @JsonValue(30)
  Missouri,
  @JsonValue(31)
  Montana,
  @JsonValue(32)
  Nebraska,
  @JsonValue(33)
  Nevada,
  @JsonValue(34)
  NewBrunswick,
  @JsonValue(35)
  NewHampshire,
  @JsonValue(36)
  NewJersey,
  @JsonValue(37)
  NewMexico,
  @JsonValue(38)
  NewSouthWales,
  @JsonValue(39)
  NewYork,
  @JsonValue(40)
  NorthernTerritory,
  @JsonValue(41)
  NorthCarolina,
  @JsonValue(42)
  NorthDakota,
  @JsonValue(43)
  NovaScotia,
  @JsonValue(44)
  Ohio,
  @JsonValue(45)
  Oklahoma,
  @JsonValue(46)
  Ontario,
  @JsonValue(47)
  Oregon,
  @JsonValue(48)
  Pennsylvania,
  @JsonValue(49)
  Quebec,
  @JsonValue(50)
  Queensland,
  @JsonValue(51)
  RhodeIsland,
  @JsonValue(52)
  Saskatchewan,
  @JsonValue(53)
  SouthAustralia,
  @JsonValue(54)
  SouthCarolina,
  @JsonValue(55)
  SouthDakota,
  @JsonValue(56)
  Tasmania,
  @JsonValue(57)
  Tennessee,
  @JsonValue(58)
  Texas,
  @JsonValue(59)
  Utah,
  @JsonValue(60)
  Vermont,
  @JsonValue(61)
  Victoria,
  @JsonValue(62)
  Virginia,
  @JsonValue(63)
  Washington,
  @JsonValue(64)
  WesternAustralia,
  @JsonValue(65)
  WestVirginia,
  @JsonValue(66)
  Wisconsin,
  @JsonValue(67)
  Wyoming,
  @JsonValue(68)
  Yukon,
  @JsonValue(69)
  CiudadDeMexico,
  @JsonValue(70)
  Jalisco,
  @JsonValue(71)
  NewfoundlandAndLabrador,
  @JsonValue(72)
  NuevoLeon,
  @JsonValue(73)
  BajaCalifornia,
  @JsonValue(74)
  Chihuahua,
  @JsonValue(75)
  Guanajuato,
  @JsonValue(76)
  Guerrero,
  @JsonValue(77)
  Mexico,
  @JsonValue(78)
  Michoacan,
  @JsonValue(79)
  NewYorkCity,
  @JsonValue(80)
  Tamaulipas,
  @JsonValue(81)
  Veracruz,
  @JsonValue(82)
  Chiapas,
  @JsonValue(83)
  Coahuila,
  @JsonValue(84)
  Durango,
  @JsonValue(85)
  GuerreroCocula,
  @JsonValue(86)
  GuerreroJuchitan,
  @JsonValue(87)
  GuerreroTepecoacuilco,
  @JsonValue(88)
  GuerreroTlacoapa,
  @JsonValue(89)
  Gujarat,
  @JsonValue(90)
  Hidalgo,
  @JsonValue(91)
  Karnataka,
  @JsonValue(92)
  Kerala,
  @JsonValue(93)
  KhyberPakhtunkhwa,
  @JsonValue(94)
  MadhyaPradesh,
  @JsonValue(95)
  Maharashtra,
  @JsonValue(96)
  Morelos,
  @JsonValue(97)
  Nayarit,
  @JsonValue(98)
  Oaxaca,
  @JsonValue(99)
  Puebla,
  @JsonValue(100)
  Punjab,
  @JsonValue(101)
  Queretaro,
  @JsonValue(102)
  SanLuisPotosi,
  @JsonValue(103)
  Sinaloa,
  @JsonValue(104)
  Sonora,
  @JsonValue(105)
  Tabasco,
  @JsonValue(106)
  TamilNadu,
  @JsonValue(107)
  Yucatan,
  @JsonValue(108)
  Zacatecas,
  @JsonValue(109)
  Aguascalientes,
  @JsonValue(110)
  BajaCaliforniaSur,
  @JsonValue(111)
  Campeche,
  @JsonValue(112)
  Colima,
  @JsonValue(113)
  QuintanaRooBenitoJuarez,
  @JsonValue(114)
  QuintanaRoo,
  @JsonValue(115)
  QuintanaRooSolidaridad,
  @JsonValue(116)
  Tlaxcala,
  @JsonValue(117)
  QuintanaRooCozumel,
  @JsonValue(118)
  SaoPaolo,
  @JsonValue(119)
  RioDeJaneiro,
  @JsonValue(120)
  RioGrandeDoSul,
  @JsonValue(121)
  NorthWestTerritories,
  @JsonValue(122)
  Nunavut,
  @JsonValue(123)
  PrinceEdwardIsland,
  @JsonValue(124)
  DistritoFederal,
  @JsonValue(125)
  Maranhao,
  @JsonValue(126)
  MatoGrosso,
  @JsonValue(127)
  MinasGerais,
  @JsonValue(128)
  Para,
  @JsonValue(129)
  Parana,
  @JsonValue(130)
  Pernambuco,
  @JsonValue(131)
  SantaCatarina
}

/// Defines possible the document type from ClassInfo scanned with BlinkID or BlinkID MultiSide Recognizer
enum Type {
  @JsonValue(0)
  None,
  @JsonValue(1)
  ConsularId,
  @JsonValue(2)
  Dl,
  @JsonValue(3)
  DlPublicServicesCard,
  @JsonValue(4)
  EmploymentPass,
  @JsonValue(5)
  FinCard,
  @JsonValue(6)
  Id,
  @JsonValue(7)
  MultipurposeId,
  @JsonValue(8)
  MyKad,
  @JsonValue(9)
  MyKid,
  @JsonValue(10)
  MyPR,
  @JsonValue(11)
  MyTentera,
  @JsonValue(12)
  PanCard,
  @JsonValue(13)
  ProfessionalId,
  @JsonValue(14)
  PublicServicesCard,
  @JsonValue(15)
  ResidencePermit,
  @JsonValue(16)
  ResidentId,
  @JsonValue(17)
  TemporaryResidencePermit,
  @JsonValue(18)
  VoterId,
  @JsonValue(19)
  WorkPermit,
  @JsonValue(20)
  iKad,
  @JsonValue(21)
  MilitaryId,
  @JsonValue(22)
  MyKas,
  @JsonValue(23)
  SocialSecurityCard,
  @JsonValue(24)
  HealthInsuranceCard,
  @JsonValue(25)
  Passport,
  @JsonValue(26)
  SPass,
  @JsonValue(27)
  AddressCard,
  @JsonValue(28)
  AlienId,
  @JsonValue(29)
  AlienPassport,
  @JsonValue(30)
  GreenCard,
  @JsonValue(31)
  MinorsId,
  @JsonValue(32)
  PostalId,
  @JsonValue(33)
  ProfessionalDl,
  @JsonValue(34)
  TaxId,
  @JsonValue(35)
  WeaponPermit,
  @JsonValue(36)
  Visa,
  @JsonValue(37)
  BorderCrossingCard,
  @JsonValue(38)
  DriverCard,
  @JsonValue(39)
  GlobalEntryCard,
  @JsonValue(40)
  Mypolis,
  @JsonValue(41)
  NexusCard,
  @JsonValue(42)
  PassportCard,
  @JsonValue(43)
  ProofOfAgeCard,
  @JsonValue(44)
  RefugeeId,
  @JsonValue(45)
  TribalId,
  @JsonValue(46)
  VeteranId,
  @JsonValue(47)
  CitizenshipCertificate,
  @JsonValue(48)
  MyNumberCard,
  @JsonValue(49)
  ConsularPassport,
  @JsonValue(50)
  MinorsPassport,
  @JsonValue(51)
  MinorsPublicServicesCard,
  @JsonValue(52)
  DrivingPriviligeCard,
  @JsonValue(53)
  AsylumRequest,
  @JsonValue(54)
  DriverQualificationCard,
  @JsonValue(55)
  ProvisionalDl,
  @JsonValue(56)
  RefugeePassport,
  @JsonValue(57)
  SpecialId,
  @JsonValue(58)
  UniformedServicesId,
  @JsonValue(59)
  ImmigrantVisa,
  @JsonValue(60)
  ConsularVoterId,
  @JsonValue(61)
  TwicCard
}

/// Represents data extracted from MRZ (Machine Readable Zone) of Machine Readable Travel Document (MRTD).
class MrzResult {
  /// Type of recognized document. It is always one of the values represented by BlinkIDScanner.MRTDDocumentType
  MrtdDocumentType? documentType;

  /// The primary indentifier. If there is more than one component, they are separated with space.
  String? primaryId;

  /// The secondary identifier. If there is more than one component, they are separated with space.
  String? secondaryId;

  /// Three-letter or two-letter code which indicate the issuing State. Three-letter codes are based
  /// on Aplha-3 codes for entities specified in ISO 3166-1, with extensions for certain States. Two-letter
  /// codes are based on Alpha-2 codes for entities specified in ISO 3166-1, with extensions for certain States.
  String? issuer;

  /// Holder's date of birth
  Date? dateOfBirth;

  /// The document number. Document number contains up to 9 characters.
  /// Element does not exist on US Green Card. To see which document was scanned use documentType property.
  String? documentNumber;

  /// The nationality of the holder represented by a three-letter or two-letter code. Three-letter
  /// codes are based on Alpha-3 codes for entities specified in ISO 3166-1, with extensions for certain
  /// States. Two-letter codes are based on Aplha-2 codes for entities specified in ISO 3166-1, with
  /// extensions for certain States.
  String? nationality;

  /// The gender of the card holder. Gender is specified by use of the single initial, capital letter F for female,
  /// M for male or <code>&lt;</code> for unspecified.
  String? gender;

  /// The document code. Document code contains two characters. For MRTD the first character shall
  /// be A, C or I. The second character shall be discretion of the issuing State or organization except
  /// that V shall not be used, and `C` shall not be used after `A` except in the crew member certificate.
  /// On machine-readable passports (MRP) first character shall be `P` to designate an MRP. One additional
  /// letter may be used, at the discretion of the issuing State or organization, to designate a particular
  /// MRP. If the second character position is not used for this purpose, it shall be filled by the filter
  /// character <code>&lt;</code>.
  String? documentCode;

  /// The date of expiry
  Date? dateOfExpiry;

  /// The first optional data. Contains empty string if not available.
  /// Element does not exist on US Green Card. To see which document was scanned use the documentType property.
  String? opt1;

  /// The second optional data. Contains empty string if not available.
  /// Element does not exist on Passports and Visas. To see which document was scanned use the documentType property.
  String? opt2;

  /// The alien number. Contains empty string if not available.
  /// Exists only on US Green Cards. To see which document was scanned use the documentType property.
  String? alienNumber;

  /// The application receipt number. Contains empty string if not available.
  /// Exists only on US Green Cards. To see which document was scanned use the documentType property.
  String? applicationReceiptNumber;

  /// The immigrant case number. Contains empty string if not available.
  /// Exists only on US Green Cards. To see which document was scanned use the documentType property.
  String? immigrantCaseNumber;

  /// The entire Machine Readable Zone text from ID. This text is usually used for parsing
  /// other elements.
  /// NOTE: This string is available only if OCR result was parsed successfully.
  String? mrzText;

  /// true if Machine Readable Zone has been parsed, false otherwise.
  bool? mrzParsed;

  /// true if all check digits inside MRZ are correct, false otherwise.
  bool? mrzVerified;

  /// Sanitized field opt1
  String? sanitizedOpt1;

  /// Sanitized field opt2
  String? sanitizedOpt2;

  /// Sanitized field nationality
  String? sanitizedNationality;

  /// Sanitized field issuer
  String? sanitizedIssuer;

  /// Sanitized document code
  String? sanitizedDocumentCode;

  /// Sanitized document number
  String? sanitizedDocumentNumber;

  /// The current age of the document owner in years. It is calculated difference
  /// between now and date of birth. Now is current time on the device.
  /// @return current age of the document owner in years or -1 if date of birth is unknown.
  int? age;

  MrzResult(Map<String, dynamic> nativeMRZResult) {
    this.documentType = MrtdDocumentType.values[nativeMRZResult['documentType']];
    this.primaryId = nativeMRZResult['primaryId'];
    this.secondaryId = nativeMRZResult['secondaryId'];
    this.issuer = nativeMRZResult['issuer'];
    this.dateOfBirth =
        nativeMRZResult['dateOfBirth'] != null ? Date(Map<String, dynamic>.from(nativeMRZResult['dateOfBirth'])) : null;
    this.documentNumber = nativeMRZResult['documentNumber'];
    this.nationality = nativeMRZResult['nationality'];
    this.gender = nativeMRZResult['gender'];
    this.documentCode = nativeMRZResult['documentCode'];
    this.dateOfExpiry = nativeMRZResult['dateOfExpiry'] != null
        ? Date(Map<String, dynamic>.from(nativeMRZResult['dateOfExpiry']))
        : null;
    this.opt1 = nativeMRZResult['opt1'];
    this.opt2 = nativeMRZResult['opt2'];
    this.alienNumber = nativeMRZResult['alienNumber'];
    this.applicationReceiptNumber = nativeMRZResult['applicationReceiptNumber'];
    this.immigrantCaseNumber = nativeMRZResult['immigrantCaseNumber'];
    this.mrzText = nativeMRZResult['mrzText'];
    this.mrzParsed = nativeMRZResult['mrzParsed'];
    this.mrzVerified = nativeMRZResult['mrzVerified'];
    this.sanitizedOpt1 = nativeMRZResult['sanitizedOpt1'];
    this.sanitizedOpt2 = nativeMRZResult['sanitizedOpt2'];
    this.sanitizedNationality = nativeMRZResult['sanitizedNationality'];
    this.sanitizedIssuer = nativeMRZResult['sanitizedIssuer'];
    this.sanitizedDocumentCode = nativeMRZResult['sanitizedDocumentCode'];
    this.sanitizedDocumentNumber = nativeMRZResult['sanitizedDocumentNumber'];
    this.age = nativeMRZResult['age'];
  }
}

/// Possible supported detectors for documents containing face image
enum DocumentFaceDetectorType {
  /// Uses document detector for TD1 size identity cards
  @JsonValue(0)
  TD1,

  /// Uses document detector for TD2 size identity cards
  @JsonValue(1)
  TD2,

  /// Uses MRTD detector for detecting documents with MRZ
  @JsonValue(2)
  PassportsAndVisas
}

/// RecognitionModeFilter is used to enable/disable recognition of specific document groups.
/// Setting is taken into account only if the right for that document is purchased.
@JsonSerializable()
class RecognitionModeFilter {
  /// Enable scanning of MRZ IDs. Setting is taken into account only if the mrz_id right is purchased.
  bool enableMrzId = true;

  /// Enable scanning of visa MRZ. Setting is taken into account only if the visa right is purchased.
  bool enableMrzVisa = true;

  /// Enable scanning of Passport MRZ. Setting is taken into account only if the passport right is purchased.
  bool enableMrzPassport = true;

  /// Enable scanning of Photo ID. Setting is taken into account only if the photo_id right is purchased.
  bool enablePhotoId = true;

  /// Enable scanning of barcode IDs. Setting is taken into account only if the barcode right to scan that barcode is purchased.
  bool enableBarcodeId = true;

  /// Enable full document recognition. Setting is taken into account only if the document right to scan that document is purchased.
  bool enableFullDocumentRecognition = true;

  RecognitionModeFilter();

  factory RecognitionModeFilter.fromJson(Map<String, dynamic> json) => _$RecognitionModeFilterFromJson(json);
  Map<String, dynamic> toJson() => _$RecognitionModeFilterToJson(this);
}

/// ClassAnonymizationSettings is used to anonymize specific documents and fields.
/// It can be modified with countries, regions, document types and document fields.
/// See Country, Region, Type and FieldType objects to get more information which fields can be anonymized.
/// Setting is taken into account if AnonymizationMode is set to ImageOnly,ResultFieldsOnly or FullResult.
@JsonSerializable()
class ClassAnonymizationSettings {
  Country? country;

  Region? region;

  Type? type;

  List<FieldType> fields = [];

  ClassAnonymizationSettings();

  factory ClassAnonymizationSettings.fromJson(Map<String, dynamic> json) => _$ClassAnonymizationSettingsFromJson(json);
  Map<String, dynamic> toJson() => _$ClassAnonymizationSettingsToJson(this);
}

/// Define level of anonymization performed on recognizer result
enum AnonymizationMode {
  /// Anonymization will not be performed.
  @JsonValue(0)
  None,

  /// FullDocumentImage is anonymized with black boxes covering sensitive data.
  @JsonValue(1)
  ImageOnly,

  /// Result fields containing sensitive data are removed from result.
  @JsonValue(2)
  ResultFieldsOnly,

  /// This mode is combination of ImageOnly and ResultFieldsOnly modes.
  @JsonValue(3)
  FullResult
}

/// Defines status of the last recognition process.
enum ProcessingStatus {
  /// Recognition was successful.
  Success,

  /// Detection of the document failed.
  DetectionFailed,

  /// Preprocessing of the input image has failed.
  ImagePreprocessingFailed,

  /// Recognizer has inconsistent results.
  StabilityTestFailed,

  /// Wrong side of the document has been scanned.
  ScanningWrongSide,

  /// Identification of the fields present on the document has failed.
  FieldIdentificationFailed,

  /// Mandatory field for the specific document is missing.
  MandatoryFieldMissing,

  /// Result contains invalid characters in some of the fields.
  InvalidCharactersFound,

  /// Failed to return a requested image.
  ImageReturnFailed,

  /// Reading or parsing of the barcode has failed.
  BarcodeRecognitionFailed,

  /// Parsing of the MRZ has failed.
  MrzParsingFailed,

  /// Document class has been filtered out.
  ClassFiltered,

  /// Document currently not supported by the recognizer.
  UnsupportedClass,

  /// License for the detected document is missing.
  UnsupportedByLicense,

  /// Front side recognition has completed successfully, and recognizer is waiting for the other side to be scanned.
  AwaitingOtherSide,

  /// Side not scanned.
  NotScanned
}

/// Define level of anonymization performed on recognizer result
enum RecognitionMode {
  /// No recognition performed.
  None,

  /// Recognition of mrz document (does not include visa and passport)
  MrzId,

  /// Recognition of visa mrz.
  MrzVisa,

  /// Recognition of passport mrz.
  MrzPassport,

  /// Recognition of documents that have face photo on the front.
  PhotoId,

  /// Detailed document recognition.
  FullRecognition,

  /// Recognition of barcode document.
  BarcodeId
}

/// Define document side where the document field is located
enum DocumentSide {
  ///The field was not detected
  None,

  ///The field is located on the front side of the document
  Front,

  ///The field is located on the back side of the document
  Back
}

/// Defines possible color and moire statuses determined from scanned image.
class ImageAnalysisResult {
  /// Whether the image is blurred.
  bool? blurred;

  /// The color status determined from scanned image.
  DocumentImageColorStatus? documentImageColorStatus;

  /// The Moire pattern detection status determined from the scanned image.
  ImageAnalysisDetectionStatus? documentImageMoireStatus;

  /// Face detection status determined from the scanned image.
  ImageAnalysisDetectionStatus? faceDetectionStatus;

  /// Mrz detection status determined from the scanned image.
  ImageAnalysisDetectionStatus? mrzDetectionStatus;

  /// TBarcode detection status determined from the scanned image.
  ImageAnalysisDetectionStatus? barcodeDetectionStatus;

  /// Document card rotation status determined from the scanned image.
  CardRotation? cardRotation;
  ImageAnalysisResult(Map<String, dynamic> nativeImageAnalysisResult) {
    this.blurred = nativeImageAnalysisResult['blurred'];
    this.documentImageColorStatus =
        DocumentImageColorStatus.values[nativeImageAnalysisResult['documentImageColorStatus']];
    this.documentImageMoireStatus =
        ImageAnalysisDetectionStatus.values[nativeImageAnalysisResult['documentImageMoireStatus']];
    this.faceDetectionStatus = ImageAnalysisDetectionStatus.values[nativeImageAnalysisResult['faceDetectionStatus']];
    this.mrzDetectionStatus = ImageAnalysisDetectionStatus.values[nativeImageAnalysisResult['mrzDetectionStatus']];
    this.barcodeDetectionStatus =
        ImageAnalysisDetectionStatus.values[nativeImageAnalysisResult['barcodeDetectionStatus']];
    this.cardRotation = CardRotation.values[nativeImageAnalysisResult['cardRotation']];
  }
}

/// Defines the data extracted from the barcode.
class BarcodeResult {
  /// Type of the barcode scanned
  BarcodeType? barcodeType;

  /// Byte array with result of the scan
  String? rawData;

  /// Retrieves string content of scanned data
  String? stringData;

  /// Flag indicating uncertain scanning data
  bool? uncertain;

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

  /// The nationality of the documet owner.
  String? nationality;

  /// The race of the document owner.
  String? race;

  /// The religion of the document owner.
  String? religion;

  /// The profession of the document owner.
  String? profession;

  /// The marital status of the document owner.
  String? maritalStatus;

  /// The residential stauts of the document owner.
  String? residentialStatus;

  /// The employer of the document owner.
  String? employer;

  /// The sex of the document owner.
  String? sex;

  /// The date of birth of the document owner.
  Date? dateOfBirth;

  /// The date of issue of the document.
  Date? dateOfIssue;

  /// The date of expiry of the document.
  Date? dateOfExpiry;

  /// The document number.
  String? documentNumber;

  ///  The personal identification number.
  String? personalIdNumber;

  /// The additional number of the document.
  String? documentAdditionalNumber;

  /// The issuing authority of the document.
  String? issuingAuthority;

  /// The street address portion of the document owner.
  String? street;

  /// The postal code address portion of the document owner.
  String? postalCode;

  /// The city address portion of the document owner.
  String? city;

  /// The jurisdiction code address portion of the document owner.
  String? jurisdiction;

  /// The driver license detailed info.
  BarcodeDriverLicenseDetailedInfo? driverLicenseDetailedInfo;

  /// Flag that indicates if barcode result is empty
  bool? empty;

  /// Document specific extended elements that contain all barcode fields in their original form. Currently this is only filled for AAMVACompliant documents.
  BarcodeElements? extendedElements;

  BarcodeResult(Map<String, dynamic> nativeBarcodeResult) {
    this.barcodeType = BarcodeType.values[nativeBarcodeResult['barcodeType']];
    this.rawData = nativeBarcodeResult['rawData'];
    this.stringData = nativeBarcodeResult['stringData'];
    this.uncertain = nativeBarcodeResult['uncertain'];
    this.firstName = nativeBarcodeResult['firstName'];
    this.middleName = nativeBarcodeResult['middleName'];
    this.lastName = nativeBarcodeResult['lastName'];
    this.fullName = nativeBarcodeResult['fullName'];
    this.additionalNameInformation = nativeBarcodeResult['additionalNameInformation'];
    this.address = nativeBarcodeResult['address'];
    this.placeOfBirth = nativeBarcodeResult['placeOfBirth'];
    this.nationality = nativeBarcodeResult['nationality'];
    this.race = nativeBarcodeResult['race'];
    this.religion = nativeBarcodeResult['religion'];
    this.profession = nativeBarcodeResult['profession'];
    this.maritalStatus = nativeBarcodeResult['maritalStatus'];
    this.residentialStatus = nativeBarcodeResult['residentialStatus'];
    this.employer = nativeBarcodeResult['employer'];
    this.sex = nativeBarcodeResult['sex'];
    this.dateOfBirth = nativeBarcodeResult['dateOfBirth'] != null
        ? Date(Map<String, dynamic>.from(nativeBarcodeResult['dateOfBirth']))
        : null;
    this.dateOfBirth = nativeBarcodeResult['dateOfIssue'] != null
        ? Date(Map<String, dynamic>.from(nativeBarcodeResult['dateOfIssue']))
        : null;
    this.dateOfBirth = nativeBarcodeResult['dateOfExpiry'] != null
        ? Date(Map<String, dynamic>.from(nativeBarcodeResult['dateOfExpiry']))
        : null;
    this.documentNumber = nativeBarcodeResult['documentNumber'];
    this.personalIdNumber = nativeBarcodeResult['personalIdNumber'];
    this.documentAdditionalNumber = nativeBarcodeResult['documentAdditionalNumber'];
    this.issuingAuthority = nativeBarcodeResult['issuingAuthority'];
    this.street = nativeBarcodeResult['street'];
    this.postalCode = nativeBarcodeResult['postalCode'];
    this.city = nativeBarcodeResult['city'];
    this.jurisdiction = nativeBarcodeResult['jurisdiction'];
    this.driverLicenseDetailedInfo = nativeBarcodeResult['driverLicenseDetailedInfo'] != null
        ? BarcodeDriverLicenseDetailedInfo(Map<String, dynamic>.from(nativeBarcodeResult['driverLicenseDetailedInfo']))
        : null;
    this.empty = nativeBarcodeResult['empty'];
    this.extendedElements = nativeBarcodeResult['extendedElements'] != null
        ? BarcodeElements(Map<String, dynamic>.from(nativeBarcodeResult['extendedElements']))
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

  /// The address of the document owner.
  StringResult? address;

  /// The additional address information of the document owner.
  StringResult? additionalAddressInformation;

  /// The place of birth of the document owner.
  StringResult? placeOfBirth;

  /// The nationality of the documet owner.
  StringResult? nationality;

  /// The race of the document owner.
  StringResult? race;

  /// The religion of the document owner.
  StringResult? religion;

  /// The profession of the document owner.
  StringResult? profession;

  /// The marital status of the document owner.
  StringResult? maritalStatus;

  /// The residential stauts of the document owner.
  StringResult? residentialStatus;

  /// The employer of the document owner.
  StringResult? employer;

  /// The sex of the document owner.
  StringResult? sex;

  /// The date of birth of the document owner.
  DateResult? dateOfBirth;

  /// The date of issue of the document.
  DateResult? dateOfIssue;

  /// The date of expiry of the document.
  DateResult? dateOfExpiry;

  /// The document number.
  StringResult? documentNumber;

  /// The personal identification number.
  StringResult? personalIdNumber;

  /// The additional number of the document.
  StringResult? documentAdditionalNumber;

  /// The additional personal identification number.
  StringResult? additionalPersonalIdNumber;

  /// The issuing authority of the document.
  StringResult? issuingAuthority;

  /// The driver license detailed info.
  DriverLicenseDetailedInfo? driverLicenseDetailedInfo;

  /// Flag that indicates if barcode result is empty
  bool? empty;

  /// The one more additional number of the document.
  StringResult? documentOptionalAdditionalNumber;

  VizResult(Map<String, dynamic> nativeVizResult) {
    this.firstName = createStringResult(nativeVizResult, 'firstName');
    this.lastName = createStringResult(nativeVizResult, 'lastName');
    this.fullName = createStringResult(nativeVizResult, 'fullName');
    this.additionalNameInformation = createStringResult(nativeVizResult, 'additionalNameInformation');
    this.localizedName = createStringResult(nativeVizResult, 'localizedName');
    this.address = createStringResult(nativeVizResult, 'address');
    this.additionalAddressInformation = createStringResult(nativeVizResult, 'additionalAddressInformation');
    this.placeOfBirth = createStringResult(nativeVizResult, 'placeOfBirth');
    this.nationality = createStringResult(nativeVizResult, 'nationality');
    this.race = createStringResult(nativeVizResult, 'race');
    this.religion = createStringResult(nativeVizResult, 'religion');
    this.profession = createStringResult(nativeVizResult, 'profession');
    this.maritalStatus = createStringResult(nativeVizResult, 'maritalStatus');
    this.residentialStatus = createStringResult(nativeVizResult, 'residentialStatus');
    this.employer = createStringResult(nativeVizResult, 'employer');
    this.sex = createStringResult(nativeVizResult, 'sex');
    this.dateOfBirth = nativeVizResult['dateOfBirth'] != null
        ? DateResult(Map<String, dynamic>.from(nativeVizResult['dateOfBirth']))
        : null;
    this.dateOfIssue = nativeVizResult['dateOfIssue'] != null
        ? DateResult(Map<String, dynamic>.from(nativeVizResult['dateOfIssue']))
        : null;
    this.dateOfExpiry = nativeVizResult['dateOfExpiry'] != null
        ? DateResult(Map<String, dynamic>.from(nativeVizResult['dateOfExpiry']))
        : null;
    this.documentNumber = createStringResult(nativeVizResult, 'documentNumber');
    this.personalIdNumber = createStringResult(nativeVizResult, 'personalIdNumber');
    this.documentAdditionalNumber = createStringResult(nativeVizResult, 'documentAdditionalNumber');
    this.additionalPersonalIdNumber = createStringResult(nativeVizResult, 'additionalPersonalIdNumber');
    this.issuingAuthority = createStringResult(nativeVizResult, 'issuingAuthority');
    this.driverLicenseDetailedInfo = nativeVizResult['driverLicenseDetailedInfo'] != null
        ? DriverLicenseDetailedInfo(Map<String, dynamic>.from(nativeVizResult['driverLicenseDetailedInfo']))
        : null;
    this.empty = nativeVizResult['empty'];
    this.documentOptionalAdditionalNumber = createStringResult(nativeVizResult, 'documentOptionalAdditionalNumber');
  }
}

StringResult? createStringResult(Map<String, dynamic> result, String propertyName) {
  return result[propertyName] != null ? StringResult(Map<String, dynamic>.from(result[propertyName])) : null;
}

/// Extension factors relative to corresponding dimension of the full image. For example,
/// upFactor and downFactor define extensions relative to image height, e.g.
/// when upFactor is 0.5, upper image boundary will be extended for half of image's full
/// height.
@JsonSerializable()
class ImageExtensionFactors {
  /// image extension factor relative to full image height in UP direction.
  double? upFactor = 0.0;

  /// image extension factor relative to full image height in RIGHT direction.
  double? rightFactor = 0.0;

  /// image extension factor relative to full image height in DOWN direction.
  double? downFactor = 0.0;

  /// image extension factor relative to full image height in LEFT direction.
  double? leftFactor = 0.0;

  ImageExtensionFactors();

  factory ImageExtensionFactors.fromJson(Map<String, dynamic> json) => _$ImageExtensionFactorsFromJson(json);
  Map<String, dynamic> toJson() => _$ImageExtensionFactorsToJson(this);
}

/// Result of the data matching algorithm for scanned parts/sides of the document.
enum DataMatchState {
  /// Data matching has not been performed.
  NotPerformed,

  /// Data does not match.
  Failed,

  /// Data match.
  Success
}

enum DetectionStatus {
  @JsonValue('FAILED')
  Failed,

  @JsonValue('SUCCESS')
  Success,

  @JsonValue('CAMERA_TOO_FAR')
  CameraTooFar,

  @JsonValue('FALLBACK_SUCCESS')
  FallbackSuccess,

  @JsonValue('DOCUMENT_PARTIALLY_VISIBLE')
  DocumentPartiallyVisible,

  @JsonValue('CAMERA_ANGLE_TOO_STEEP')
  CameraAngleTooSteep,

  @JsonValue('CAMERA_TOO_CLOSE')
  CameraTooClose,

  @JsonValue('DOCUMENT_TOO_CLOSE_TO_CAMERA_EDGE')
  DocumentTooCloseToCameraEdge,
}

@JsonSerializable()
class DetectionStatusUpdate {
  final DetectionStatus detectionStatus;

  DetectionStatusUpdate(this.detectionStatus);

  factory DetectionStatusUpdate.fromJson(Map<String, dynamic> json) => _$DetectionStatusUpdateFromJson(json);

  Map<String, dynamic> toJson() => _$DetectionStatusUpdateToJson(this);
}
