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

        this.x = nativePoint['x'] != null? nativePoint['x']*1.0 : null;
        this.y = nativePoint['y'] != null? nativePoint['y']*1.0 : null;
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
    String? restrictions;
    /// Additional privileges granted to the driver license owner.
    String? endorsements;
    /// The type of vehicle the driver license owner has privilege to drive.
    String? vehicleClass;
    /// The driver license conditions.
    String? conditions;

    DriverLicenseDetailedInfo(Map<String, dynamic> nativeDriverLicenseDetailedInfo) {
        this.restrictions = nativeDriverLicenseDetailedInfo['restrictions'];
        this.endorsements = nativeDriverLicenseDetailedInfo['endorsements'];
        this.vehicleClass = nativeDriverLicenseDetailedInfo['vehicleClass'];
        this.conditions = nativeDriverLicenseDetailedInfo['conditions'];
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

        /**
        Mandatory on all driver's licenses. All barcodes which are using 3-track magnetic
        stripe encoding used in the interest of smoothing a transition from legacy documents
        shall be designated as "Magnetic". All barcodes which are using compact encoding
        compliant with ISO/IEC 18013-2 shall be designated as "Compact". All barcodes (majority
        compliant with Mandatory PDF417 Bar Code of the American Association of Motor Vehicle
        Administrators (AAMVA Card Design Standard from AAMVA DL/ID-2000 standard to DL/ID-2013
        shall be designated as "AAMVA".
        */
        DocumentType,

        /**
        Mandatory on all driver's licenses.

        AAMVA Version Number: This is a decimal value between 0 and 99 that
        specifies the version level of the PDF417 bar code format. Version "0" and "00"
        is reserved for bar codes printed to the specification of the American Association
        of Motor Vehicle Administrators (AAMVA prior to the adoption of the AAMVA DL/ID-2000
        standard.

        - All barcodes compliant with AAMVA DL/ID-2000 standard shall be designated Version "01."
        - All barcodes compliant with AAMVA Card Design Specification version 1.0, dated 09-2003
        shall be designated Version "02."
        - All barcodes compliant with AAMVA Card Design Specification version 2.0, dated 03-2005
        shall be designated Version "03."
        - All barcodes compliant with AAMVA Card Design Standard version 1.0, dated 07-2009
        shall be designated Version "04."
        - All barcodes compliant with AAMVA Card Design Standard version 1.0, dated 07-2010
        shall be designated Version "05."
        - All barcodes compliant with AAMVA Card Design Standard version 1.0, dated 07-2011
        shall be designated Version "06".
        - All barcodes compliant with AAMVA Card Design Standard version 1.0, dated 06-2012
        shall be designated Version "07".
        - All barcodes compliant with this current AAMVA standard shall be designated "08".

        Should a need arise requiring major revision to the format, this field provides the
        means to accommodate additional revision.

        If the document type is not "AAMVA", this field defines the version number of the
        given document type's standard.
        */
        StandardVersionNumber,

        //==============================================================/
        //==========          2. PERSONAL DATA KEYS          ===========/
        //==============================================================/

        /**
        Mandatory on all AAMVA, Magnetic and Compact barcodes.

        Family name of the cardholder. (Family name is sometimes also called "last name" or "surname."
        Collect full name for record, print as many characters as possible on portrait side of DL/ID.
        */
        CustomerFamilyName,

        /**
        Mandatory on all AAMVA, Magnetic and Compact barcodes.

        First name of the cardholder.
        */
        CustomerFirstName,

        /**
        Mandatory on all AAMVA, Magnetic and Compact barcodes.

        Full name of the individual holding the Driver's License or ID.

        The Name field contains up to four portions, separated with the "," delimiter:
        Last Name (required
        , (required
        First Name (required
        , (required if other name portions follow, otherwise optional
        Middle Name(s (optional
        , (required if other name portions follow, otherwise optional
        Suffix (optional
        , (optional

        If the individual has more than one middle name they are separated with space.
        */
        CustomerFullName,

        /**
        Mandatory on all AAMVA, Magnetic and Compact barcodes.

        Date on which the cardholder was born. (MMDDCCYY format
        */
        DateOfBirth,

        /**
        Mandatory on all AAMVA, Magnetic barcodes.
        Optional on Compact barcodes.

        Gender of the cardholder. 1 = male, 2 = female.
        */
        Sex,

        /**
        Mandatory on AAMVA 02, 03, 04, 05, 06, 07, 08 barcodes.
        Optional on AAMVA 01, Magnetic and Compact barcodes.

        Color of cardholder's eyes. (ANSI D-20 codes

        Code   Description
        BLK    Black
        BLU    Blue
        BRO    Brown
        GRY    Gray
        GRN    Green
        HAZ    Hazel
        MAR    Maroon
        PNK    Pink
        DIC    Dichromatic
        UNK    Unknown
        */
        EyeColor,

        /**
        Mandatory on all AAMVA and Magnetic barcodes.

        On compact barcodes, use kFullAddress.

        Street portion of the cardholder address.
        The place where the registered driver of a vehicle (individual or corporation
        may be contacted such as a house number, street address, etc.
        */
        AddressStreet,

        /**
        Mandatory on all AAMVA and Magnetic barcodes.

        On compact barcodes, use kFullAddress.

        City portion of the cardholder address.
        */
        AddressCity,

        /**
        Mandatory on all AAMVA and Magnetic barcodes.

        On compact barcodes, use kFullAddress.

        State portion of the cardholder address.
        */
        AddressJurisdictionCode,

        /**
        Mandatory on all AAMVA and Magnetic barcodes.

        On compact barcodes, use kFullAddress.

        Postal code portion of the cardholder address in the U.S. and Canada. If the
        trailing portion of the postal code in the U.S. is not known, zeros can be used
        to fill the trailing set of numbers up to nine (9 digits.
        */
        AddressPostalCode,

        /**
        Mandatory on all AAMVA and Magnetic barcodes.
        Optional on Compact barcodes.

        Full address of the individual holding the Driver's License or ID.

        The full address field contains up to four portions, separated with the "," delimiter:
        Street Address (required
        , (required if other address portions follow, otherwise optional
        City (optional
        , (required if other address portions follow, otherwise optional
        Jurisdiction Code (optional
        , (required if other address portions follow, otherwise optional
        ZIP - Postal Code (optional

        */
        FullAddress,

        /**
        Mandatory on AAMVA 02, 03, 04, 05, 06, 07, 08 and Compact barcodes.
        Optional on AAMVA 01 and Magnetic barcodes.

        Height of cardholder, either in Inches or in Centimeters.

        Inches (in: number of inches followed by " in"
        example: 6'1'' = "73 in"

        Centimeters (cm: number of centimeters followed by " cm"
        example: 181 centimeters = "181 cm"
        */
        Height,

        /**
        Mandatory on AAMVA 02, 03, 04, 05, 06, 07, 08 and Compact barcodes.
        Optional on AAMVA 01 and Magnetic barcodes.

        Height of cardholder in Inches.
        Example: 5'9'' = "69".
        */
        HeightIn,

        /**
        Mandatory on AAMVA 02, 03, 04, 05, 06, 07, 08 Compact barcodes.
        Optional on AAMVA 01 and Magnetic barcodes.

        Height of cardholder in Centimeters.
        Example: 180 Centimeters = "180".
        */
        HeightCm,

        /**
        Mandatory on AAMVA 04, 05, 06, 07, 08 barcodes.
        Optional on AAMVA 01, 02, 03, Magnetic and Compcat barcodes.

        Middle name(s of the cardholder. In the case of multiple middle names they
        shall be separated by space " ".
        */
        CustomerMiddleName,

        /**
        Optional on all AAMVA, Magnetic and Compact barcodes.

        Bald, black, blonde, brown, gray, red/auburn, sandy, white, unknown. If the issuing
        jurisdiction wishes to abbreviate colors, the three-character codes provided in ANSI D20 must be
        used.

        Code   Description
        BAL    Bald
        BLK    Black
        BLN    Blond
        BRO    Brown
        GRY    Grey
        RED    Red/Auburn
        SDY    Sandy
        WHI    White
        UNK    Unknown
        */
        HairColor,

        /**
        Mandatory on AAMVA 02 barcodes.
        Optional on AAMVA 01, 03, 04, 05, 06, 07, 08, Magnetic and Compact barcodes.

        Name Suffix (If jurisdiction participates in systems requiring name suffix (PDPS, CDLIS, etc.,
        the suffix must be collected and displayed on the DL/ID and in the MRT.
        - JR (Junior
        - SR (Senior
        - 1ST or I (First
        - 2ND or II (Second
        - 3RD or III (Third
        - 4TH or IV (Fourth
        - 5TH or V (Fifth
        - 6TH or VI (Sixth
        - 7TH or VII (Seventh
        - 8TH or VIII (Eighth
        - 9TH or IX (Ninth
        */
        NameSuffix,

        /**
        Optional on all AAMVA and Compact barcodes.

        Other name by which the cardholder is known. ALTERNATIVE NAME(S of the individual
        holding the Driver License or ID.

        The Name field contains up to four portions, separated with the "," delimiter:
        AKA Last Name (required
        , (required
        AKA First Name (required
        , (required if other name portions follow, otherwise optional
        AKA Middle Name(s (optional
        , (required if other name portions follow, otherwise optional
        AKA Suffix (optional
        , (optional

        If the individual has more than one AKA middle name they are separated with space.
        */
        AKAFullName,

        /**
        Optional on all AAMVA and Compact barcodes.

        Other family name by which the cardholder is known.
        */
        AKAFamilyName,

        /**
        Optional on all AAMVA and Compact barcodes.

        Other given name by which the cardholder is known
        */
        AKAGivenName,

        /**
        Optional on all AAMVA and Compact barcodes.

        Other suffix by which the cardholder is known.

        The Suffix Code Portion, if submitted, can contain only the Suffix Codes shown in the following table (e.g., Andrew Johnson, III = JOHNSON@ANDREW@@3RD:

        Suffix     Meaning or Synonym
        JR         Junior
        SR         Senior or Esquire 1ST First
        2ND        Second
        3RD        Third
        4TH        Fourth
        5TH        Fifth
        6TH        Sixth
        7TH        Seventh
        8TH        Eighth
        9TH        Ninth
        */
        AKASuffixName,

        /**
        Mandatory on AAMVA 02 barcodes.
        Optional on AAMVA 01, 03, 04, 05, 06, 07, 08, Magnetic and Compact barcodes.

        Indicates the approximate weight range of the cardholder:
        0 = up to 31 kg (up to 70 lbs
        1 = 32 – 45 kg (71 – 100 lbs
        2 = 46 - 59 kg (101 – 130 lbs
        3 = 60 - 70 kg (131 – 160 lbs
        4 = 71 - 86 kg (161 – 190 lbs
        5 = 87 - 100 kg (191 – 220 lbs
        6 = 101 - 113 kg (221 – 250 lbs
        7 = 114 - 127 kg (251 – 280 lbs
        8 = 128 – 145 kg (281 – 320 lbs
        9 = 146+ kg (321+ lbs
        */
        WeightRange,

        /**
        Mandatory on AAMVA 02 barcodes.
        Optional on AAMVA 01, 03, 04, 05, 06, 07, 08, Magnetic and Compact barcodes.

        Cardholder weight in pounds Example: 185 lb = "185"
        */
        WeightPounds,

        /**
        Mandatory on AAMVA 02 barcodes.
        Optional on AAMVA 01, 03, 04, 05, 06, 07, 08, Magnetic and Compact barcodes.

        Cardholder weight in kilograms Example: 84 kg = "084"
        */
        WeightKilograms,

        /**
        Mandatory on all AAMVA and Compact barcodes.

        The number assigned or calculated by the issuing authority.
        */
        CustomerIdNumber,

        /**
        Mandatory on AAMVA 04, 05, 06, 07, 08 barcodes.
        Optional on Compact barcodes.

        A code that indicates whether a field has been truncated (T, has not been
        truncated (N, or – unknown whether truncated (U.
        */
        FamilyNameTruncation,

        /**
        Mandatory on AAMVA 04, 05, 06, 07, 08 barcodes.
        Optional on Compact barcodes.

        A code that indicates whether a field has been truncated (T, has not been
        truncated (N, or – unknown whether truncated (U.
        */
        FirstNameTruncation,

        /**
        Mandatory on AAMVA 04, 05, 06, 07, 08 barcodes.

        A code that indicates whether a field has been truncated (T, has not been
        truncated (N, or – unknown whether truncated (U.
        */
        MiddleNameTruncation,

        /**
        Optional on AAMVA 02, 03, 04, 05, 06, 07, 08 and Compact barcodes.

        Country and municipality and/or state/province.
        */
        PlaceOfBirth,

        /**
        Optional on all AAMVA barcodes.

        On Compact barcodes, use kFullAddress.

        Second line of street portion of the cardholder address.
        */
        AddressStreet2,

        /**
        Optional on AAMVA 02, 03, 04, 05, 06, 07, 08 and Compact barcodes.

        Codes for race or ethnicity of the cardholder, as defined in ANSI D20.

        Race:
        Code   Description
        AI     Alaskan or American Indian (Having Origins in Any of The Original Peoples of
                North America, and Maintaining Cultural Identification Through Tribal
                Affiliation of Community Recognition
        AP     Asian or Pacific Islander (Having Origins in Any of the Original Peoples of
                the Far East, Southeast Asia, or Pacific Islands. This Includes China, India,
                Japan, Korea, the Philippines Islands, and Samoa
        BK     Black (Having Origins in Any of the Black Racial Groups of Africa
        W      White (Having Origins in Any of The Original Peoples of Europe, North Africa,
                or the Middle East

        Ethnicity:
        Code   Description
        H      Hispanic Origin (A Person of Mexican, Puerto Rican, Cuban, Central or South
                American or Other Spanish Culture or Origin, Regardless of Race
        O      Not of Hispanic Origin (Any Person Other Than Hispanic
        U      Unknown

        */
        RaceEthnicity,

        /**
        Optional on AAMVA 01 barcodes.

        PREFIX to Driver Name. Freeform as defined by issuing jurisdiction.
        */
        NamePrefix,

        /**
        Mandatory on AAMVA 02, 03, 04, 05, 06, 07, 08 and Compact barcodes.

        Country in which DL/ID is issued. U.S. = USA, Canada = CAN.
        */
        CountryIdentification,

        /**
        Optional on AAMVA version 01.

        Driver Residence Street Address 1.
        */
        ResidenceStreetAddress,

        /**
        Optional on AAMVA version 01.

        Driver Residence Street Address 2.
        */
        ResidenceStreetAddress2,

        /**
        Optional on AAMVA version 01.

        Driver Residence City
        */
        ResidenceCity,

        /**
        Optional on AAMVA version 01.

        Driver Residence Jurisdiction Code.
        */
        ResidenceJurisdictionCode,

        /**
        Optional on AAMVA 01 barcodes.

        Driver Residence Postal Code.
        */
        ResidencePostalCode,

        /**
        Optional on AAMVA 01 barcodes.

        Full residence address of the individual holding the Driver's License or ID.

        The full address field contains up to four portions, separated with the "," delimiter:
        Residence Street Address (required
        , (required if other address portions follow, otherwise optional
        Residence City (optional
        , (required if other address portions follow, otherwise optional
        Residence Jurisdiction Code (optional
        , (required if other address portions follow, otherwise optional
        Residence ZIP - Residence Postal Code (optional
        */
        ResidenceFullAddress,

        /**
        Optional on AAMVA 05, 06, 07, 08 barcodes.

        Date on which the cardholder turns 18 years old. (MMDDCCYY format
        */
        Under18,

        /**
        Optional on AAMVA 05, 06, 07, 08 barcodes.

        Date on which the cardholder turns 19 years old. (MMDDCCYY format
        */
        Under19,

        /**
        Optional on AAMVA 05, 06, 07, 08 barcodes.

        Date on which the cardholder turns 21 years old. (MMDDCCYY format
        */
        Under21,

        /**
        Optional on AAMVA version 01.

        The number assigned to the individual by the Social Security Administration.
        */
        SocialSecurityNumber,

        /**
        Optional on AAMVA version 01.

        Driver "AKA" Social Security Number. FORMAT SAME AS DRIVER SOC SEC NUM. ALTERNATIVE NUMBERS(S used as SS NUM.
        */
        AKASocialSecurityNumber,

        /**
        Optional on AAMVA 01 barcodes.

        ALTERNATIVE MIDDLE NAME(s or INITIALS of the individual holding the Driver License or ID.
        Hyphenated names acceptable, spaces between names acceptable, but no other
        use of special symbols.
        */
        AKAMiddleName,

        /**
        Optional on AAMVA 01 barcodes.

        ALTERNATIVE PREFIX to Driver Name. Freeform as defined by issuing jurisdiction.
        */
        AKAPrefixName,

        /**
        Optional on AAMVA 01, 06, 07, 08 barcodes.

        Field that indicates that the cardholder is an organ donor = "1".
        */
        OrganDonor,

        /**
        Optional on AAMVA 07, 08 barcodes.

        Field that indicates that the cardholder is a veteran = "1"
        */
        Veteran,

        /**
        Optional on AAMVA 01. (MMDDCCYY format

        ALTERNATIVE DATES(S given as date of birth.
        */
        AKADateOfBirth,

        //==============================================================/
        //==========          3. LICENSE DATA KEYS          ============/
        //==============================================================/

        /**
        Mandatory on all AAMVA, Magnetic and Compact barcodes.

        This number uniquely identifies the issuing jurisdiction and can
        be obtained by contacting the ISO Issuing Authority (AAMVA
        */
        IssuerIdentificationNumber,

        /**
        Mandatory on all AAMVA, Magnetic and Compact barcodes.

        If the document is non expiring then "Non expiring" is written in this field.

        Date on which the driving and identification privileges granted by the document are
        no longer valid. (MMDDCCYY format
        */
        DocumentExpirationDate,

        /**
        Mandatory on all AAMVA and Compact barcodes.
        Optional on Magnetic barcodes.

        Jurisdiction Version Number: This is a decimal value between 0 and 99 that
        specifies the jurisdiction version level of the PDF417 barcode format.
        Notwithstanding iterations of this standard, jurisdictions implement incremental
        changes to their barcodes, including new jurisdiction-specific data, compression
        algorithms for digitized images, digital signatures, or new truncation
        conventions used for names and addresses. Each change to the barcode format
        within each AAMVA version (above must be noted, beginning with Jurisdiction
        Version 00.
        */
        JurisdictionVersionNumber,

        /**
        Mandatory on all AAMVA and Magnetic barcodes.

        Jurisdiction-specific vehicle class / group code, designating the type
        of vehicle the cardholder has privilege to drive.
        */
        JurisdictionVehicleClass,

        /**
        Mandatory on all AAMVA barcodes.
        Optional on Magnetic barcodes.

        Jurisdiction-specific codes that represent restrictions to driving
        privileges (such as airbrakes, automatic transmission, daylight only, etc..
        */
        JurisdictionRestrictionCodes,

        /**
        Mandatory on all AAMVA barcodes.
        Optional on Magnetic barcodes.

        Jurisdiction-specific codes that represent additional privileges
        granted to the cardholder beyond the vehicle class (such as transportation of
        passengers, hazardous materials, operation of motorcycles, etc..
        */
        JurisdictionEndorsementCodes,

        /**
        Mandatory on all AAMVA and Compact barcodes.

        Date on which the document was issued. (MMDDCCYY format
        */
        DocumentIssueDate,

        /**
        Mandatory on AAMVA versions 02 and 03.

        Federally established codes for vehicle categories, endorsements, and restrictions
        that are generally applicable to commercial motor vehicles. If the vehicle is not a
        commercial vehicle, "NONE" is to be entered.
        */
        FederalCommercialVehicleCodes,

        /**
        Optional on all AAMVA barcodes.
        Mandatory on Compact barcodes.

        Jurisdictions may define a subfile to contain jurisdiction-specific information.
        These subfiles are designated with the first character of “Z” and the second
        character is the first letter of the jurisdiction's name. For example, "ZC" would
        be the designator for a California or Colorado jurisdiction-defined subfile, "ZQ"
        would be the designator for a Quebec jurisdiction-defined subfile. In the case of
        a jurisdiction-defined subfile that has a first letter that could be more than
        one jurisdiction (e.g. California, Colorado, Connecticut then other data, like
        the IIN or address, must be examined to determine the jurisdiction.
        */
        IssuingJurisdiction,

        /**
        Optional on all AAMVA barcodes.
        Mandatory on Compact barcodes.

        Standard vehicle classification code(s for cardholder. This data element is a
        placeholder for future efforts to standardize vehicle classifications.
        */
        StandardVehicleClassification,

        /**
        Optional on all AAMVA and Magnetic barcodes.

        Name of issuing jurisdiction, for example: Alabama, Alaska ...
        */
        IssuingJurisdictionName,

        /**
        Optional on all AAMVA barcodes.

        Standard endorsement code(s for cardholder. See codes in D20. This data element is a
        placeholder for future efforts to standardize endorsement codes.

        Code   Description
        H      Hazardous Material - This endorsement is required for the operation of any vehicle
                transporting hazardous materials requiring placarding, as defined by U.S.
                Department of Transportation regulations.
        L      Motorcycles – Including Mopeds/Motorized Bicycles.
        N      Tank - This endorsement is required for the operation of any vehicle transporting,
                as its primary cargo, any liquid or gaseous material within a tank attached to the vehicle.
        O      Other Jurisdiction Specific Endorsement(s - This code indicates one or more
                additional jurisdiction assigned endorsements.
        P      Passenger - This endorsement is required for the operation of any vehicle used for
                transportation of sixteen or more occupants, including the driver.
        S      School Bus - This endorsement is required for the operation of a school bus. School bus means a
                CMV used to transport pre-primary, primary, or secondary school students from home to school,
                from school to home, or to and from school sponsored events. School bus does not include a
                bus used as common carrier (49 CRF 383.5.
        T      Doubles/Triples - This endorsement is required for the operation of any vehicle that would be
                referred to as a double or triple.
        X      Combined Tank/HAZ-MAT - This endorsement may be issued to any driver who qualifies for
                both the N and H endorsements.
        */
        StandardEndorsementCode,

        /**
        Optional on all AAMVA barcodes.

        Standard restriction code(s for cardholder. See codes in D20. This data element is a placeholder
        for future efforts to standardize restriction codes.

        Code   Description
        B      Corrective Lenses
        C      Mechanical Devices (Special Brakes, Hand Controls, or Other Adaptive Devices
        D      Prosthetic Aid
        E      Automatic Transmission
        F      Outside Mirror
        G      Limit to Daylight Only
        H      Limit to Employment
        I      Limited Other
        J      Other
        K      CDL Intrastate Only
        L      Vehicles without air brakes
        M      Except Class A bus
        N      Except Class A and Class B bus
        O      Except Tractor-Trailer
        V      Medical Variance Documentation Required
        W      Farm Waiver
        */
        StandardRestrictionCode,

        /**
        Optional on AAMVA 02, 03, 04, 05, 06, 07, 08 and Compact barcodes.

        Text that explains the jurisdiction-specific code(s for classifications
        of vehicles cardholder is authorized to drive.
        */
        JurisdictionVehicleClassificationDescription,

        /**
        Optional on AAMVA 02, 03, 04, 05, 06, 07, 08 and Compact barcodes.

        Text that explains the jurisdiction-specific code(s that indicates additional
        driving privileges granted to the cardholder beyond the vehicle class.
        */
        JurisdictionEndorsmentCodeDescription,

        /**
        Optional on AAMVA 02, 03, 04, 05, 06, 07, 08 and Compact barcodes.

        Text describing the jurisdiction-specific restriction code(s that curtail driving privileges.
        */
        JurisdictionRestrictionCodeDescription,

        /**
        Optional on AAMVA 02, 03, 04, 05, 06, 07, 08 barcodes.

        A string of letters and/or numbers that is affixed to the raw materials (card stock,
        laminate, etc. used in producing driver's licenses and ID cards. (DHS recommended field
        */
        InventoryControlNumber,

        /**
        Optional on AAMVA 04, 05, 06, 07, 08 and Compact barcodes.

        DHS required field that indicates date of the most recent version change or
        modification to the visible format of the DL/ID. (MMDDCCYY format
        */
        CardRevisionDate,

        /**
        Mandatory on AAMVA 02, 03, 04, 05, 06, 07, 08 and Magnetic barcodes.
        Optional and Compact barcodes.

        Number must uniquely identify a particular document issued to that customer
        from others that may have been issued in the past. This number may serve multiple
        purposes of document discrimination, audit information number, and/or inventory control.
        */
        DocumentDiscriminator,

        /**
        Optional on AAMVA 04, 05, 06, 07, 08 and Compact barcodes.

        DHS required field that indicates that the cardholder has temporary lawful status = "1".
        */
        LimitedDurationDocument,

        /**
        Optional on AAMVA 02, 03, 04, 05, 06, 07, 08 and Compact barcodes.

        A string of letters and/or numbers that identifies when, where, and by whom a driver's
        license/ID card was made. If audit information is not used on the card or the MRT, it
        must be included in the driver record.
        */
        AuditInformation,

        /**
        Optional on AAMVA 04, 05, 06, 07, 08 and Compact barcodes.

        DHS required field that indicates compliance: "M" = materially compliant,
        "F" = fully compliant, and, "N" = non-compliant.
        */
        ComplianceType,

        /**
        Optional on AAMVA version 01 barcodes.

        Issue Timestamp. A string used by some jurisdictions to validate the document against their data base.
        */
        IssueTimestamp,

        /**
        Optional on AAMVA version 01 barcodes.

        Driver Permit Expiration Date. MMDDCCYY format. Date permit expires.
        */
        PermitExpirationDate,

        /**
        Optional on AAMVA version 01 barcodes..

        Type of permit.
        */
        PermitIdentifier,

        /**
        Optional on AAMVA version 01 barcodes..

        Driver Permit Issue Date. MMDDCCYY format. Date permit was issued.
        */
        PermitIssueDate,

        /**
        Optional on AAMVA version 01.

        Number of duplicate cards issued for a license or ID if any.
        */
        NumberOfDuplicates,

        /**
        Optional on AAMVA 04, 05, 06, 07, 08 and Compact barcodes.

        Date on which the hazardous material endorsement granted by the document is
        no longer valid. (MMDDCCYY format
        */
        HAZMATExpirationDate,

        /**
        Optional on AAMVA version 01.

        Medical Indicator/Codes.
        STATE SPECIFIC. Freeform, Standard "TBD"
        */
        MedicalIndicator,

        /**
        Optional on AAMVA version 01.

        Non-Resident Indicator. "Y". Used by some jurisdictions to indicate holder of the document is a non-resident.
        */
        NonResident,

        /**
        Optional on AAMVA version 01.

        A number or alphanumeric string used by some jurisdictions to identify a "customer" across multiple data bases.
        */
        UniqueCustomerId,

        /**
        Optional on compact barcodes.

        Document discriminator.
        */
        DataDiscriminator,

        /**
        Optional on Magnetic barcodes.

        Month on which the driving and identification privileges granted by the document are
        no longer valid. (MMYY format
        */
        DocumentExpirationMonth,

        /**
        Optional on Magnetic barcodes.

        Field that indicates that the driving and identification privileges granted by the
        document are nonexpiring = "1".
        */
        DocumentNonexpiring,

        /**
        Optional on Magnetic barcodes.

        Security version beeing used.
        */
        SecurityVersion
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
    Uruguay,
    Bahamas,
    Bermuda,
    Bolivia,
    China,
    EuropeanUnion,
    Haiti,
    Honduras,
    Iceland,
    Japan,
    Luxembourg,
    Montenegro,
    Nicaragua,
    SouthKorea,
    Venezuela,
    Afghanistan,
    AlandIslands,
    AmericanSamoa,
    Andorra,
    Angola,
    Anguilla,
    Antarctica,
    AntiguaAndBarbuda,
    Armenia,
    Aruba,
    BailiwickOfGuernsey,
    BailiwickOfJersey,
    Barbados,
    Belarus,
    Belize,
    Benin,
    Bhutan,
    BonaireSaintEustatiusAndSaba,
    Botswana,
    BouvetIsland,
    BritishIndianOceanTerritory,
    BurkinaFaso,
    Burundi,
    Cameroon,
    CapeVerde,
    CaribbeanNetherlands,
    CaymanIslands,
    CentralAfricanRepublic,
    Chad,
    ChristmasIsland,
    CocosIslands,
    Comoros,
    Congo,
    CookIslands,
    Cuba,
    Curacao,
    DemocraticRepublicOfTheCongo,
    Djibouti,
    Dominica,
    EastTimor,
    EquatorialGuinea,
    Eritrea,
    Ethiopia,
    FalklandIslands,
    FaroeIslands,
    FederatedStatesOfMicronesia,
    Fiji,
    FrenchGuiana,
    FrenchPolynesia,
    FrenchSouthernTerritories,
    Gabon,
    Gambia,
    Gibraltar,
    Greenland,
    Grenada,
    Guadeloupe,
    Guam,
    Guinea,
    GuineaBissau,
    Guyana,
    HeardIslandAndMcdonaldIslands,
    Iran,
    Iraq,
    IsleOfMan,
    IvoryCoast,
    Jamaica,
    Kiribati,
    Kyrgyzstan,
    Laos,
    Lebanon,
    Lesotho,
    Liberia,
    Libya,
    Liechtenstein,
    Macau,
    Madagascar,
    Malawi,
    Mali,
    MarshallIslands,
    Martinique,
    Mauritania,
    Mayotte,
    Moldova,
    Monaco,
    Mongolia,
    Montserrat,
    Mozambique,
    Myanmar,
    Namibia,
    Nauru,
    Nepal,
    NewCaledonia,
    Niger,
    Niue,
    NorfolkIsland,
    NorthernCyprus,
    NorthernMarianaIslands,
    NorthKorea,
    NorthMacedonia,
    Palau,
    Palestine,
    PapuaNewGuinea,
    Pitcairn,
    Reunion,
    Rwanda,
    SaintBarthelemy,
    SaintHelenaAscensionAndTristianDaCunha,
    SaintKittsAndNevis,
    SaintLucia,
    SaintMartin,
    SaintPierreAndMiquelon,
    SaintVincentAndTheGrenadines,
    Samoa,
    SanMarino,
    SaoTomeAndPrincipe,
    Senegal,
    Seychelles,
    SierraLeone,
    SintMaarten,
    SolomonIslands,
    Somalia,
    SouthGeorgiaAndTheSouthSandwichIslands,
    SouthSudan,
    Sudan,
    Suriname,
    SvalbardAndJanMayen,
    Eswatini,
    Syria,
    Tajikistan,
    Tanzania,
    Togo,
    Tokelau,
    Tonga,
    TrinidadAndTobago,
    Turkmenistan,
    TurksAndCaicosIslands,
    Tuvalu,
    UnitedStatesMinorOutlyingIslands,
    Uzbekistan,
    Vanuatu,
    VaticanCity,
    VirginIslandsBritish,
    VirginIslandsUs,
    WallisAndFutuna,
    WesternSahara,
    Yemen,
    Yugoslavia,
    Zambia,
    Zimbabwe
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
    NuevoLeon,
    BajaCalifornia,
    Chihuahua,
    Guanajuato,
    Guerrero,
    Mexico,
    Michoacan,
    NewYorkCity,
    Tamaulipas,
    Veracruz,
    Chiapas,
    Coahuila,
    Durango,
    GuerreroCocula,
    GuerreroJuchitan,
    GuerreroTepecoacuilco,
    GuerreroTlacoapa,
    Gujarat,
    Hidalgo,
    Karnataka,
    Kerala,
    KhyberPakhtunkhwa,
    MadhyaPradesh,
    Maharashtra,
    Morelos,
    Nayarit,
    Oaxaca,
    Puebla,
    Punjab,
    Queretaro,
    SanLuisPotosi,
    Sinaloa,
    Sonora,
    Tabasco,
    TamilNadu,
    Yucatan,
    Zacatecas,
    Aguascalientes,
    BajaCaliforniaSur,
    Campeche,
    Colima,
    QuintanaRooBenitoJuarez
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
    SPass,
    AddressCard,
    AlienId,
    AlienPassport,
    GreenCard,
    MinorsId,
    PostalId,
    ProfessionalDl,
    TaxId,
    WeaponPermit,
    Visa,
    BorderCrossingCard,
    DriverCard,
    GlobalEntryCard,
    Mypolis,
    NexusCard,
    PassportCard,
    ProofOfAgeCard,
    RefugeeId,
    TribalId,
    VeteranId,
    CitizenshipCertificate
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
    @JsonValue(1) TD1,
    /// Uses document detector for TD2 size identity cards
    @JsonValue(2) TD2,
    /// Uses MRTD detector for detecting documents with MRZ
    @JsonValue(3) PassportsAndVisas
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

/// Define level of anonymization performed on recognizer result
enum AnonymizationMode {
    /// Anonymization will not be performed.
    @JsonValue(1) None,
    /// FullDocumentImage is anonymized with black boxes covering sensitive data.
    @JsonValue(2) ImageOnly,
    /// Result fields containing sensitive data are removed from result.
    @JsonValue(3) ResultFieldsOnly,
    /// This mode is combination of ImageOnly and ResultFieldsOnly modes.
    @JsonValue(4) FullResult
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
    DriverLicenseDetailedInfo? driverLicenseDetailedInfo;
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
        this.extendedElements = nativeBarcodeResult['extendedElements'] != null ? BarcodeElements(Map<String, dynamic>.from(nativeBarcodeResult['extendedElements'])) : null;
    }
}

class VizResult {

    /// The first name of the document owner.
    String? firstName;
    /// The last name of the document owner.
    String? lastName;
    /// The full name of the document owner.
    String? fullName;
    /// The additional name information of the document owner.
    String? additionalNameInformation;
    /// The localized name of the document owner.
    String? localizedName;
    /// The address of the document owner.
    String? address;
    /// The additional address information of the document owner.
    String? additionalAddressInformation;
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
    /// The personal identification number.
    String? personalIdNumber;
    /// The additional number of the document.
    String? documentAdditionalNumber;
    /// The additional personal identification number.
    String? additionalPersonalIdNumber;
    /// The issuing authority of the document.
    String? issuingAuthority;
    /// The driver license detailed info.
    DriverLicenseDetailedInfo? driverLicenseDetailedInfo;
    /// Flag that indicates if barcode result is empty
    bool? empty;
    /// The one more additional number of the document.
    String? documentOptionalAdditionalNumber;

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
        this.documentOptionalAdditionalNumber = nativeVizResult['documentOptionalAdditionalNumber'];
    }
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
enum DataMatchResult {
    /// Data matching has not been performed.
    NotPerformed,
    /// Data does not match.
    Failed,
    /// Data match.
    Success
}