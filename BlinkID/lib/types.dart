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
        this.x = nativePoint['x'];
        this.y = nativePoint['y'];
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

    DriverLicenseDetailedInfo(Map<String, dynamic> nativeDriverLicenseDetailedInfo) {
        this.restrictions = nativeDriverLicenseDetailedInfo['restrictions'];
        this.endorsements = nativeDriverLicenseDetailedInfo['endorsements'];
        this.vehicleClass = nativeDriverLicenseDetailedInfo['vehicleClass'];
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

/// Defines possible states of Moire pattern detection.
enum DocumentImageMoireStatus {
    /// Detection of Moire patterns was not performed.
    NotAvailable,
    /// Moire pattern not detected on input image.
    NotDetected,
    /// Moire pattern detected on input image.
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
    Oman
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
    Yukon
}

/// Defines possible the document type from ClassInfo scanned with BlinkID or BlinkID Combined Recognizer
enum Type {
    None,
    ConsularId,
    Dl,
    DlPublicServicesCard,
    FinCard,
    EmploymentPass,
    GreenCard,
    Id,
    MultipurposeId,
    MyKad,
    MyKid,
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
    SocialSecurityCard
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

    // The gender of the card holder. Gender is specified by use of the single initial, capital letter F for female,
    // M for male or <code>&lt;</code> for unspecified.
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

