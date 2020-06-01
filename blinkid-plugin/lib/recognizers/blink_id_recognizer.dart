import '../recognizer.dart';
import '../types.dart';
import 'package:json_annotation/json_annotation.dart';

part 'blink_id_recognizer.g.dart';

/// Result object for BlinkIdRecognizer.
class BlinkIdRecognizerResult extends RecognizerResult {
    
    ///The additional address information of the document owner. 
    String additionalAddressInformation;
    
    ///The additional name information of the document owner. 
    String additionalNameInformation;
    
    ///The address of the document owner. 
    String address;
    
    ///The current age of the document owner in years. It is calculated difference
    /// between now and date of birth. Now is current time on the device.
    /// @return current age of the document owner in years or -1 if date of birth is unknown. 
    int age;
    
    ///The classification information. 
    ClassInfo classInfo;
    
    ///The driver license conditions. 
    String conditions;
    
    ///The date of birth of the document owner. 
    Date dateOfBirth;
    
    ///The date of expiry of the document. 
    Date dateOfExpiry;
    
    ///Determines if date of expiry is permanent. 
    bool dateOfExpiryPermanent;
    
    ///The date of issue of the document. 
    Date dateOfIssue;
    
    ///The additional number of the document. 
    String documentAdditionalNumber;
    
    ///Defines possible color statuses determined from scanned image. 
    DocumentImageColorStatus documentImageColorStatus;
    
    ///The document number. 
    String documentNumber;
    
    ///The driver license detailed info. 
    DriverLicenseDetailedInfo driverLicenseDetailedInfo;
    
    ///The employer of the document owner. 
    String employer;
    
    ///face image from the document if enabled with returnFaceImage property. 
    String faceImage;
    
    ///The first name of the document owner. 
    String firstName;
    
    ///full document image if enabled with returnFullDocumentImage property. 
    String fullDocumentImage;
    
    ///The full name of the document owner. 
    String fullName;
    
    ///The issuing authority of the document. 
    String issuingAuthority;
    
    ///The last name of the document owner. 
    String lastName;
    
    ///The localized name of the document owner. 
    String localizedName;
    
    ///The marital status of the document owner. 
    String maritalStatus;
    
    ///The data extracted from the machine readable zone 
    MrzResult mrzResult;
    
    ///The nationality of the documet owner. 
    String nationality;
    
    ///The personal identification number. 
    String personalIdNumber;
    
    ///The place of birth of the document owner. 
    String placeOfBirth;
    
    ///The profession of the document owner. 
    String profession;
    
    ///The race of the document owner. 
    String race;
    
    ///The religion of the document owner. 
    String religion;
    
    ///The residential stauts of the document owner. 
    String residentialStatus;
    
    ///The sex of the document owner. 
    String sex;
    
    BlinkIdRecognizerResult(Map<String, dynamic> nativeResult): super(RecognizerResultState.values[nativeResult['resultState'] - 1]) {
        
        this.additionalAddressInformation = nativeResult["additionalAddressInformation"];
        
        this.additionalNameInformation = nativeResult["additionalNameInformation"];
        
        this.address = nativeResult["address"];
        
        this.age = nativeResult["age"];
        
        this.classInfo = nativeResult["classInfo"] != null ? ClassInfo(Map<String, dynamic>.from(nativeResult["classInfo"])) : null;
        
        this.conditions = nativeResult["conditions"];
        
        this.dateOfBirth = nativeResult["dateOfBirth"] != null ? Date(Map<String, dynamic>.from(nativeResult["dateOfBirth"])) : null;
        
        this.dateOfExpiry = nativeResult["dateOfExpiry"] != null ? Date(Map<String, dynamic>.from(nativeResult["dateOfExpiry"])) : null;
        
        this.dateOfExpiryPermanent = nativeResult["dateOfExpiryPermanent"];
        
        this.dateOfIssue = nativeResult["dateOfIssue"] != null ? Date(Map<String, dynamic>.from(nativeResult["dateOfIssue"])) : null;
        
        this.documentAdditionalNumber = nativeResult["documentAdditionalNumber"];
        
        this.documentImageColorStatus = DocumentImageColorStatus.values[nativeResult["documentImageColorStatus"] - 1];
        
        this.documentNumber = nativeResult["documentNumber"];
        
        this.driverLicenseDetailedInfo = nativeResult["driverLicenseDetailedInfo"] != null ? DriverLicenseDetailedInfo(Map<String, dynamic>.from(nativeResult["driverLicenseDetailedInfo"])) : null;
        
        this.employer = nativeResult["employer"];
        
        this.faceImage = nativeResult["faceImage"];
        
        this.firstName = nativeResult["firstName"];
        
        this.fullDocumentImage = nativeResult["fullDocumentImage"];
        
        this.fullName = nativeResult["fullName"];
        
        this.issuingAuthority = nativeResult["issuingAuthority"];
        
        this.lastName = nativeResult["lastName"];
        
        this.localizedName = nativeResult["localizedName"];
        
        this.maritalStatus = nativeResult["maritalStatus"];
        
        this.mrzResult = nativeResult["mrzResult"] != null ? MrzResult(Map<String, dynamic>.from(nativeResult["mrzResult"])) : null;
        
        this.nationality = nativeResult["nationality"];
        
        this.personalIdNumber = nativeResult["personalIdNumber"];
        
        this.placeOfBirth = nativeResult["placeOfBirth"];
        
        this.profession = nativeResult["profession"];
        
        this.race = nativeResult["race"];
        
        this.religion = nativeResult["religion"];
        
        this.residentialStatus = nativeResult["residentialStatus"];
        
        this.sex = nativeResult["sex"];
        
    }
}


///The Blink ID Recognizer is used for scanning Blink ID.
@JsonSerializable()
class BlinkIdRecognizer extends Recognizer {
    
    ///Defines whether blured frames filtering is allowed
    /// 
    /// 
    bool allowBlurFilter = true;
    
    ///Defines whether returning of unparsed MRZ (Machine Readable Zone) results is allowed
    /// 
    /// 
    bool allowUnparsedMrzResults = false;
    
    ///Defines whether returning unverified MRZ (Machine Readable Zone) results is allowed
    /// Unverified MRZ is parsed, but check digits are incorrect
    /// 
    /// 
    bool allowUnverifiedMrzResults = true;
    
    ///Property for setting DPI for face images
    /// Valid ranges are [100,400]. Setting DPI out of valid ranges throws an exception
    /// 
    /// 
    int faceImageDpi = 250;
    
    ///Property for setting DPI for full document images
    /// Valid ranges are [100,400]. Setting DPI out of valid ranges throws an exception
    /// 
    /// 
    int fullDocumentImageDpi = 250;
    
    ///Image extension factors for full document image.
    /// 
    /// @see ImageExtensionFactors
    /// 
    ImageExtensionFactors fullDocumentImageExtensionFactors = ImageExtensionFactors();
    
    ///Pading is a minimum distance from the edge of the frame and is defined as a percentage of the frame width. Default value is 0.0f and in that case
    /// padding edge and image edge are the same.
    /// Recommended value is 0.02f.
    /// 
    /// 
    double paddingEdge = 0.0;
    
    ///Sets whether face image from ID card should be extracted
    /// 
    /// 
    bool returnFaceImage = false;
    
    ///Sets whether full document image of ID card should be extracted.
    /// 
    /// 
    bool returnFullDocumentImage = false;
    
    BlinkIdRecognizer(): super('BlinkIdRecognizer');

    RecognizerResult createResultFromNative(Map<String, dynamic> nativeResult) {
        return BlinkIdRecognizerResult(nativeResult);
    }

    factory BlinkIdRecognizer.fromJson(Map<String, dynamic> json) => _$BlinkIdRecognizerFromJson(json);

    Map<String, dynamic> toJson() => _$BlinkIdRecognizerToJson(this);
}