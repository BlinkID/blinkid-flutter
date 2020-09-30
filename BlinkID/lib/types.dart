import 'package:json_annotation/json_annotation.dart';

part 'types.g.dart';
/// Represents a date extracted from image.
class Date {

    /// day in month
    int day;
    /// month in year
    int month;
    /// year
    int year;

    Date(Map<String, dynamic> nativeDate) {
        this.day = nativeDate['day'];
        this.month = nativeDate['month'];
        this.year = nativeDate['year'];
    }
}

/// Represents a point in image
class Point {

    /// x coordinate of the point
    double x;
    /// y coordinate of the point
    double y;

    Point(Map<String, dynamic> nativePoint) {
        this.x = nativePoint['x']*1.0;
        this.y = nativePoint['y']*1.0;
    }
}

/// Represents a quadrilateral location in the image
class Quadrilateral {

    /// upper left point of the quadrilateral
    Point upperLeft;
    /// upper right point of the quadrilateral
    Point upperRight;
    /// lower left point of the quadrilateral
    Point lowerLeft;
    /// lower right point of the quadrilateral
    Point lowerRight;

    Quadrilateral(Map<String, dynamic> nativeQuad) {
        this.upperLeft = Point(Map<String, dynamic>.from(nativeQuad['upperLeft']));
        this.upperRight = Point(Map<String, dynamic>.from(nativeQuad['upperRight']));
        this.lowerLeft = Point(Map<String, dynamic>.from(nativeQuad['lowerLeft']));
        this.lowerRight = Point(Map<String, dynamic>.from(nativeQuad['lowerRight']));
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

/// Represents data extracted from the Driver's license.
class DriverLicenseDetailedInfo {

    ///  Restrictions to driving privileges for the driver license owner.
    String restrictions;
    /// Additional privileges granted to the driver license owner.
    String endorsements;
    /// The type of vehicle the driver license owner has privilege to drive.
    String vehicleClass;
    /// The driver license conditions.
    String conditions;

    DriverLicenseDetailedInfo(Map<String, dynamic> nativeDriverLicenseDetailedInfo) {
        this.restrictions = nativeDriverLicenseDetailedInfo['restrictions'];
        this.endorsements = nativeDriverLicenseDetailedInfo['endorsements'];
        this.vehicleClass = nativeDriverLicenseDetailedInfo['vehicleClass'];
        this.conditions = nativeDriverLicenseDetailedInfo['conditions'];
    }
}

/// Result of the data matching algorithm for scanned parts/sides of the document.
enum DataMatchResult {
    /// Data matching has not been performed.
    NotPerformed,
    /// Data does not match.
    Failed,
    /// Data match.
    Success
}

/// Represents the classification information.
class ClassInfo {

  /// The document country.
  Country country;

  /// The document region.
  Region region;

  /// The type of the scanned document.
  Type type;

  ClassInfo(Map<String, dynamic> nativeClassInfo) {
    this.country = Country.values[nativeClassInfo['country']];
    this.region = Region.values[nativeClassInfo['region']];
    this.type = Type.values[nativeClassInfo['type']];
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
    MalaysianPassIMM13P
}

/// Possible types of documents scanned with IdBarcodeRecognizer.
enum IdBarcodeDocumentType {
    /// No document was scanned
    None,
    /// AAMVACompliant document was scanned
    AAMVACompliant,
    /// Argentina ID document was scanned
    ArgentinaID,
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

/// Defines possible color statuses determined from scanned image scanned with BlinkID or BlinkID Combined Recognizer
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

/// Defines possible the document country from ClassInfo scanned with BlinkID or BlinkID Combined Recognizer
enum Country {
    None,
    Albania,
    Algeria,
    Argentina,
    Australia,
    Austria,
    Azerbaijan,
    Bahrain,
    Bangladesh,
    Belgium,
    BosniaAndHerzegovina,
    Brunei,
    Bulgaria,
    Cambodia,
    Canada,
    Chile,
    Colombia,
    CostaRica,
    Croatia,
    Cyprus,
    Czechia,
    Denmark,
    DominicanRepublic,
    Egypt,
    Estonia,
    Finland,
    France,
    Georgia,
    Germany,
    Ghana,
    Greece,
    Guatemala,
    HongKong,
    Hungary,
    India,
    Indonesia,
    Ireland,
    Israel,
    Italy,
    Jordan,
    Kazakhstan,
    Kenya,
    Kosovo,
    Kuwait,
    Latvia,
    Lithuania,
    Malaysia,
    Maldives,
    Malta,
    Mauritius,
    Mexico,
    Morocco,
    Netherlands,
    NewZealand,
    Nigeria,
    Pakistan,
    Panama,
    Paraguay,
    Philippines,
    Poland,
    Portugal,
    PuertoRico,
    Qatar,
    Romania,
    Russia,
    SaudiArabia,
    Serbia,
    Singapore,
    Slovakia,
    Slovenia,
    SouthAfrica,
    Spain,
    Sweden,
    Switzerland,
    Taiwan,
    Thailand,
    Tunisia,
    Turkey,
    UAE,
    Uganda,
    UK,
    Ukraine,
    Usa,
    Vietnam,
    Brazil,
    Norway,
    Oman,
    Ecuador,
    ElSalvador,
    SriLanka,
    Peru,
    Uruguay
}

/// Defines possible the document country's region from ClassInfo scanned with BlinkID or BlinkID Combined Recognizer
enum Region {
    None,
    Alabama,
    Alaska,
    Alberta,
    Arizona,
    Arkansas,
    AustralianCapitalTerritory,
    BritishColumbia,
    California,
    Colorado,
    Connecticut,
    Delaware,
    DistrictOfColumbia,
    Florida,
    Georgia,
    Hawaii,
    Idaho,
    Illinois,
    Indiana,
    Iowa,
    Kansas,
    Kentucky,
    Louisiana,
    Maine,
    Manitoba,
    Maryland,
    Massachusetts,
    Michigan,
    Minnesota,
    Mississippi,
    Missouri,
    Montana,
    Nebraska,
    Nevada,
    NewBrunswick,
    NewHampshire,
    NewJersey,
    NewMexico,
    NewSouthWales,
    NewYork,
    NorthernTerritory,
    NorthCarolina,
    NorthDakota,
    NovaScotia,
    Ohio,
    Oklahoma,
    Ontario,
    Oregon,
    Pennsylvania,
    Quebec,
    Queensland,
    RhodeIsland,
    Saskatchewan,
    SouthAustralia,
    SouthCarolina,
    SouthDakota,
    Tasmania,
    Tennessee,
    Texas,
    Utah,
    Vermont,
    Victoria,
    Virginia,
    Washington,
    WesternAustralia,
    WestVirginia,
    Wisconsin,
    Wyoming,
    Yukon,
    CiudadDeMexico,
    Jalisco,
    NewfoundlandAndLabrador,
    NuevoLeon
}

/// Defines possible the document type from ClassInfo scanned with BlinkID or BlinkID Combined Recognizer
enum Type {
    None,
    ConsularId,
    Dl,
    DlPublicServicesCard,
    EmploymentPass,
    FinCard,
    Id,
    MultipurposeId,
    MyKad,
    MyKid,
    MyPR,
    MyTentera,
    PanCard,
    ProfessionalId,
    PublicServicesCard,
    ResidencePermit,
    ResidentId,
    TemporaryResidencePermit,
    VoterId,
    WorkPermit,
    iKad,
    MilitaryId,
    MyKas,
    SocialSecurityCard,
    HealthInsuranceCard,
    Passport,
    SPass
}

/// Represents data extracted from MRZ (Machine Readable Zone) of Machine Readable Travel Document (MRTD).
class MrzResult {
    /// Type of recognized document. It is always one of the values represented by BlinkIDScanner.MRTDDocumentType
    MrtdDocumentType documentType;

    /// The primary indentifier. If there is more than one component, they are separated with space.
    String primaryId;

    /// The secondary identifier. If there is more than one component, they are separated with space.
    String secondaryId;

    /// Three-letter or two-letter code which indicate the issuing State. Three-letter codes are based
    /// on Aplha-3 codes for entities specified in ISO 3166-1, with extensions for certain States. Two-letter
    /// codes are based on Alpha-2 codes for entities specified in ISO 3166-1, with extensions for certain States.
    String issuer;

    /// Holder's date of birth
    Date dateOfBirth;

    /// The document number. Document number contains up to 9 characters.
    /// Element does not exist on US Green Card. To see which document was scanned use documentType property.
    String documentNumber;

    /// The nationality of the holder represented by a three-letter or two-letter code. Three-letter
    /// codes are based on Alpha-3 codes for entities specified in ISO 3166-1, with extensions for certain
    /// States. Two-letter codes are based on Aplha-2 codes for entities specified in ISO 3166-1, with
    /// extensions for certain States.
    String nationality;

    /// The gender of the card holder. Gender is specified by use of the single initial, capital letter F for female,
    /// M for male or <code>&lt;</code> for unspecified.
    String gender;

    /// The document code. Document code contains two characters. For MRTD the first character shall
    /// be A, C or I. The second character shall be discretion of the issuing State or organization except
    /// that V shall not be used, and `C` shall not be used after `A` except in the crew member certificate.
    /// On machine-readable passports (MRP) first character shall be `P` to designate an MRP. One additional
    /// letter may be used, at the discretion of the issuing State or organization, to designate a particular
    /// MRP. If the second character position is not used for this purpose, it shall be filled by the filter
    /// character <code>&lt;</code>.
    String documentCode;

    /// The date of expiry
    Date dateOfExpiry;

    /// The first optional data. Contains empty string if not available.
    /// Element does not exist on US Green Card. To see which document was scanned use the documentType property.
    String opt1;

    /// The second optional data. Contains empty string if not available.
    /// Element does not exist on Passports and Visas. To see which document was scanned use the documentType property.
    String opt2;

    /// The alien number. Contains empty string if not available.
    /// Exists only on US Green Cards. To see which document was scanned use the documentType property.
    String alienNumber;

    /// The application receipt number. Contains empty string if not available.
    /// Exists only on US Green Cards. To see which document was scanned use the documentType property.
    String applicationReceiptNumber;

    /// The immigrant case number. Contains empty string if not available.
    /// Exists only on US Green Cards. To see which document was scanned use the documentType property.
    String immigrantCaseNumber;

    /// The entire Machine Readable Zone text from ID. This text is usually used for parsing
    /// other elements.
    /// NOTE: This string is available only if OCR result was parsed successfully.
    String mrzText;

    /// true if Machine Readable Zone has been parsed, false otherwise.
    bool mrzParsed;

    /// true if all check digits inside MRZ are correct, false otherwise.
    bool mrzVerified;

    /// Sanitized field opt1
    String sanitizedOpt1;

    /// Sanitized field opt2
    String sanitizedOpt2;

    /// Sanitized field nationality
    String sanitizedNationality;

    /// Sanitized field issuer
    String sanitizedIssuer;

    /// Sanitized document code
    String sanitizedDocumentCode;

    /// Sanitized document number
    String sanitizedDocumentNumber;

    /// The current age of the document owner in years. It is calculated difference
    /// between now and date of birth. Now is current time on the device.
    /// @return current age of the document owner in years or -1 if date of birth is unknown.
    int age;

    MrzResult(Map<String, dynamic> nativeMRZResult) {
        this.documentType = MrtdDocumentType.values[nativeMRZResult['documentType']];
        this.primaryId = nativeMRZResult['primaryId'];
        this.secondaryId = nativeMRZResult['secondaryId'];
        this.issuer = nativeMRZResult['issuer'];
        this.dateOfBirth = nativeMRZResult['dateOfBirth'] != null ? Date(Map<String, dynamic>.from(nativeMRZResult['dateOfBirth'])) : null;
        this.documentNumber = nativeMRZResult['documentNumber'];
        this.nationality = nativeMRZResult['nationality'];
        this.gender = nativeMRZResult['gender'];
        this.documentCode = nativeMRZResult['documentCode'];
        this.dateOfExpiry = nativeMRZResult['dateOfExpiry'] != null ? Date(Map<String, dynamic>.from(nativeMRZResult['dateOfExpiry'])) : null;
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
    TD1,
    /// Uses document detector for TD2 size identity cards
    TD2,
    /// Uses MRTD detector for detecting documents with MRZ
    PassportsAndVisas
}

/// Extension factors relative to corresponding dimension of the full image. For example,
/// upFactor and downFactor define extensions relative to image height, e.g.
/// when upFactor is 0.5, upper image boundary will be extended for half of image's full
/// height.
@JsonSerializable()
class ImageExtensionFactors {

    /// image extension factor relative to full image height in UP direction.
    double upFactor = 0.0;
    /// image extension factor relative to full image height in RIGHT direction.
    double rightFactor = 0.0;
    /// image extension factor relative to full image height in DOWN direction.
    double downFactor = 0.0;
    /// image extension factor relative to full image height in LEFT direction.
    double leftFactor = 0.0;

    ImageExtensionFactors();

    factory ImageExtensionFactors.fromJson(Map<String, dynamic> json) => _$ImageExtensionFactorsFromJson(json);

    Map<String, dynamic> toJson() => _$ImageExtensionFactorsToJson(this);
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
    /// Enable full document recognition. Setting is taken into account only if the document right to scan that document is purchased.
    bool enableFullDocumentRecognition = true;

    RecognitionModeFilter();

    factory RecognitionModeFilter.fromJson(Map<String, dynamic> json) => _$RecognitionModeFilterFromJson(json);

    Map<String, dynamic> toJson() => _$RecognitionModeFilterToJson(this);
}



/// Define level of anonymization performed on recognizer result
enum AnonymizationMode {
    /// Anonymization will not be performed.
    None,
    /// FullDocumentImage is anonymized with black boxes covering sensitive data.
    ImageOnly,
    /// Result fields containing sensitive data are removed from result.
    ResultFieldsOnly,
    /// This mode is combination of ImageOnly and ResultFieldsOnly modes.
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
    UnsupportedByLicense
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
    FullRecognition
}

/// Defines possible color and moire statuses determined from scanned image.
class ImageAnalysisResult {

    /// Whether the image is blurred.
    bool blurred;
    /// The color status determined from scanned image.
    DocumentImageColorStatus documentImageColorStatus;
    /// The Moire pattern detection status determined from the scanned image.
    ImageAnalysisDetectionStatus documentImageMoireStatus;
      /// Face detection status determined from the scanned image.
    ImageAnalysisDetectionStatus faceDetectionStatus;
      /// Mrz detection status determined from the scanned image.
    ImageAnalysisDetectionStatus mrzDetectionStatus;
      /// TBarcode detection status determined from the scanned image.
    ImageAnalysisDetectionStatus barcodeDetectionStatus;

    ImageAnalysisResult(Map<String, dynamic> nativeImageAnalysisResult) {
        this.blurred = nativeImageAnalysisResult['blurred'];
        this.documentImageColorStatus = DocumentImageColorStatus.values[nativeImageAnalysisResult['documentImageColorStatus']];
        this.documentImageMoireStatus = ImageAnalysisDetectionStatus.values[nativeImageAnalysisResult['documentImageMoireStatus']];
        this.faceDetectionStatus = ImageAnalysisDetectionStatus.values[nativeImageAnalysisResult['faceDetectionStatus']];
        this.mrzDetectionStatus = ImageAnalysisDetectionStatus.values[nativeImageAnalysisResult['mrzDetectionStatus']];
        this.barcodeDetectionStatus = ImageAnalysisDetectionStatus.values[nativeImageAnalysisResult['barcodeDetectionStatus']];
    }
}

/// Defines the data extracted from the barcode.
class BarcodeResult {

    /// Type of the barcode scanned
    BarcodeType barcodeType;
    /// Byte array with result of the scan
    String rawData;
    /// Retrieves string content of scanned data
    String stringData;
    /// Flag indicating uncertain scanning data
    bool uncertain;
    /// The first name of the document owner.
    String firstName;
    /// The middle name of the document owner.
    String middleName;
    /// The last name of the document owner.
    String lastName;
    /// The full name of the document owner.
    String fullName;
    /// The additional name information of the document owner.
    String additionalNameInformation;
    /// The address of the document owner.
    String address;
    /// The place of birth of the document owner.
    String placeOfBirth;
    /// The nationality of the documet owner.
    String nationality;
    /// The race of the document owner.
    String race;
    /// The religion of the document owner.
    String religion;
    /// The profession of the document owner.
    String profession;
    /// The marital status of the document owner.
    String maritalStatus;
    /// The residential stauts of the document owner.
    String residentialStatus;
    /// The employer of the document owner.
    String employer;
    /// The sex of the document owner.
    String sex;
    /// The date of birth of the document owner.
    Date dateOfBirth;
    /// The date of issue of the document.
    Date dateOfIssue;
    /// The date of expiry of the document.
    Date dateOfExpiry;
    /// The document number.
    String documentNumber;
    ///  The personal identification number.
    String personalIdNumber;
    /// The additional number of the document.
    String documentAdditionalNumber;
    /// The issuing authority of the document.
    String issuingAuthority;
    /// The street address portion of the document owner.
    String street;
    /// The postal code address portion of the document owner.
    String postalCode;
    /// The city address portion of the document owner.
    String city;
    /// The jurisdiction code address portion of the document owner.
    String jurisdiction;
    /// The driver license detailed info.
    DriverLicenseDetailedInfo driverLicenseDetailedInfo;
    /// Flag that indicates if barcode result is empty
    bool empty;

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
        this.dateOfBirth = nativeBarcodeResult['dateOfBirth'] != null ? Date(Map<String, dynamic>.from(nativeBarcodeResult['dateOfBirth'])) : null;
        this.dateOfBirth = nativeBarcodeResult['dateOfIssue'] != null ? Date(Map<String, dynamic>.from(nativeBarcodeResult['dateOfIssue'])) : null;
        this.dateOfBirth = nativeBarcodeResult['dateOfExpiry'] != null ? Date(Map<String, dynamic>.from(nativeBarcodeResult['dateOfExpiry'])) : null;
        this.documentNumber = nativeBarcodeResult['documentNumber'];
        this.personalIdNumber = nativeBarcodeResult['personalIdNumber'];
        this.documentAdditionalNumber = nativeBarcodeResult['documentAdditionalNumber'];
        this.issuingAuthority = nativeBarcodeResult['issuingAuthority'];
        this.street = nativeBarcodeResult['street'];
        this.postalCode = nativeBarcodeResult['postalCode'];
        this.city = nativeBarcodeResult['city'];
        this.jurisdiction = nativeBarcodeResult['jurisdiction'];
        this.driverLicenseDetailedInfo = nativeBarcodeResult['driverLicenseDetailedInfo'] != null ? DriverLicenseDetailedInfo(Map<String, dynamic>.from(nativeBarcodeResult['driverLicenseDetailedInfo'])) : null;
        this.empty = nativeBarcodeResult['empty'];
    }
}

class VizResult {

    /// The first name of the document owner.
    String firstName;
    /// The last name of the document owner.
    String lastName;
    /// The full name of the document owner.
    String fullName;
    /// The additional name information of the document owner.
    String additionalNameInformation;
    /// The localized name of the document owner.
    String localizedName;
    /// The address of the document owner.
    String address;
    /// The additional address information of the document owner.
    String additionalAddressInformation;
    /// The place of birth of the document owner.
    String placeOfBirth;
    /// The nationality of the documet owner.
    String nationality;
    /// The race of the document owner.
    String race;
    /// The religion of the document owner.
    String religion;
    /// The profession of the document owner.
    String profession;
    /// The marital status of the document owner.
    String maritalStatus;
    /// The residential stauts of the document owner.
    String residentialStatus;
    /// The employer of the document owner.
    String employer;
    /// The sex of the document owner.
    String sex;
    /// The date of birth of the document owner.
    Date dateOfBirth;
    /// The date of issue of the document.
    Date dateOfIssue;
    /// The date of expiry of the document.
    Date dateOfExpiry;
    /// The document number.
    String documentNumber;
    /// The personal identification number.
    String personalIdNumber;
    /// The additional number of the document.
    String documentAdditionalNumber;
    /// The additional personal identification number.
    String additionalPersonalIdNumber;
    /// The issuing authority of the document.
    String issuingAuthority;
    /// The driver license detailed info.
    DriverLicenseDetailedInfo driverLicenseDetailedInfo;
    /// Flag that indicates if barcode result is empty
    bool empty;

    VizResult(Map<String, dynamic> nativeVizResult) {
        this.firstName = nativeVizResult['firstName'];
        this.lastName = nativeVizResult['lastName'];
        this.fullName = nativeVizResult['fullName'];
        this.additionalNameInformation = nativeVizResult['additionalNameInformation'];
        this.localizedName = nativeVizResult['localizedName'];
        this.address = nativeVizResult['address'];
        this.additionalAddressInformation = nativeVizResult['additionalAddressInformation'];
        this.placeOfBirth = nativeVizResult['placeOfBirth'];
        this.nationality = nativeVizResult['nationality'];
        this.race = nativeVizResult['race'];
        this.religion = nativeVizResult['religion'];
        this.profession = nativeVizResult['profession'];
        this.maritalStatus = nativeVizResult['maritalStatus'];
        this.residentialStatus = nativeVizResult['residentialStatus'];
        this.employer = nativeVizResult['employer'];
        this.sex = nativeVizResult['sex'];
        this.dateOfBirth = nativeVizResult['dateOfBirth'] != null ? Date(Map<String, dynamic>.from(nativeVizResult['dateOfBirth'])) : null;
        this.dateOfIssue = nativeVizResult['dateOfIssue'] != null ? Date(Map<String, dynamic>.from(nativeVizResult['dateOfIssue'])) : null;
        this.dateOfExpiry = nativeVizResult['dateOfExpiry'] != null ? Date(Map<String, dynamic>.from(nativeVizResult['dateOfExpiry'])) : null;
        this.documentNumber = nativeVizResult['documentNumber'];
        this.personalIdNumber = nativeVizResult['personalIdNumber'];
        this.documentAdditionalNumber = nativeVizResult['documentAdditionalNumber'];
        this.additionalPersonalIdNumber = nativeVizResult['additionalPersonalIdNumber'];
        this.issuingAuthority = nativeVizResult['issuingAuthority'];
        this.driverLicenseDetailedInfo = nativeVizResult['driverLicenseDetailedInfo'] != null ? DriverLicenseDetailedInfo(Map<String, dynamic>.from(nativeVizResult['driverLicenseDetailedInfo'])) : null;
        this.empty = nativeVizResult['empty'];
    }
}