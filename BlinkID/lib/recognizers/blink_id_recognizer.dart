import '../recognizer.dart';
import '../types.dart';
import 'package:json_annotation/json_annotation.dart';

part 'blink_id_recognizer.g.dart';

/// Result object for BlinkIdRecognizer.
class BlinkIdRecognizerResult extends RecognizerResult {
    
    ///The additional address information of the document owner. 
    String? additionalAddressInformation;
    
    ///The additional name information of the document owner. 
    String? additionalNameInformation;
    
    ///The one more additional address information of the document owner. 
    String? additionalOptionalAddressInformation;
    
    ///The address of the document owner. 
    String? address;
    
    ///The current age of the document owner in years. It is calculated difference
    /// between now and date of birth. Now is current time on the device.
    /// @return current age of the document owner in years or -1 if date of birth is unknown. 
    int? age;
    
    ///The barcode raw camera frame. 
    String? barcodeCameraFrame;
    
    ///Defines the data extracted from the barcode. 
    BarcodeResult? barcodeResult;
    
    ///The raw camera frame. 
    String? cameraFrame;
    
    ///The classification information. 
    ClassInfo? classInfo;
    
    ///The date of birth of the document owner. 
    Date? dateOfBirth;
    
    ///The date of expiry of the document. 
    Date? dateOfExpiry;
    
    ///Determines if date of expiry is permanent. 
    bool? dateOfExpiryPermanent;
    
    ///The date of issue of the document. 
    Date? dateOfIssue;
    
    ///The additional number of the document. 
    String? documentAdditionalNumber;
    
    ///The document number. 
    String? documentNumber;
    
    ///The one more additional number of the document. 
    String? documentOptionalAdditionalNumber;
    
    ///The driver license detailed info. 
    DriverLicenseDetailedInfo? driverLicenseDetailedInfo;
    
    ///The employer of the document owner. 
    String? employer;
    
    ///Checks whether the document has expired or not by comparing the current
    /// time on the device with the date of expiry.
    /// 
    /// @return true if the document has expired, false in following cases:
    /// document does not expire (date of expiry is permanent)
    /// date of expiry has passed
    /// date of expiry is unknown and it is not permanent 
    bool? expired;
    
    ///face image from the document if enabled with returnFaceImage property. 
    String? faceImage;
    
    ///The father's name of the document owner. 
    String? fathersName;
    
    ///The first name of the document owner. 
    String? firstName;
    
    ///full document image if enabled with returnFullDocumentImage property. 
    String? fullDocumentImage;
    
    ///The full name of the document owner. 
    String? fullName;
    
    ///Defines possible color and moire statuses determined from scanned image. 
    ImageAnalysisResult? imageAnalysisResult;
    
    ///The issuing authority of the document. 
    String? issuingAuthority;
    
    ///The last name of the document owner. 
    String? lastName;
    
    ///The localized name of the document owner. 
    String? localizedName;
    
    ///The marital status of the document owner. 
    String? maritalStatus;
    
    ///The mother's name of the document owner. 
    String? mothersName;
    
    ///The data extracted from the machine readable zone 
    MrzResult? mrzResult;
    
    ///The nationality of the documet owner. 
    String? nationality;
    
    ///The personal identification number. 
    String? personalIdNumber;
    
    ///The place of birth of the document owner. 
    String? placeOfBirth;
    
    ///Defines status of the last recognition process. 
    ProcessingStatus? processingStatus;
    
    ///The profession of the document owner. 
    String? profession;
    
    ///The race of the document owner. 
    String? race;
    
    ///Recognition mode used to scan current document. 
    RecognitionMode? recognitionMode;
    
    ///The religion of the document owner. 
    String? religion;
    
    ///The residential stauts of the document owner. 
    String? residentialStatus;
    
    ///The sex of the document owner. 
    String? sex;
    
    ///image of the signature if enabled with returnSignatureImage property. 
    String? signatureImage;
    
    ///Defines the data extracted from the visual inspection zone 
    VizResult? vizResult;
    
    BlinkIdRecognizerResult(Map<String, dynamic> nativeResult): super(RecognizerResultState.values[nativeResult['resultState']]) {
        
        this.additionalAddressInformation = nativeResult["additionalAddressInformation"];
        
        this.additionalNameInformation = nativeResult["additionalNameInformation"];
        
        this.additionalOptionalAddressInformation = nativeResult["additionalOptionalAddressInformation"];
        
        this.address = nativeResult["address"];
        
        this.age = nativeResult["age"];
        
        this.barcodeCameraFrame = nativeResult["barcodeCameraFrame"];
        
        this.barcodeResult = nativeResult["barcodeResult"] != null ? BarcodeResult(Map<String, dynamic>.from(nativeResult["barcodeResult"])) : null;
        
        this.cameraFrame = nativeResult["cameraFrame"];
        
        this.classInfo = nativeResult["classInfo"] != null ? ClassInfo(Map<String, dynamic>.from(nativeResult["classInfo"])) : null;
        
        this.dateOfBirth = nativeResult["dateOfBirth"] != null ? Date(Map<String, dynamic>.from(nativeResult["dateOfBirth"])) : null;
        
        this.dateOfExpiry = nativeResult["dateOfExpiry"] != null ? Date(Map<String, dynamic>.from(nativeResult["dateOfExpiry"])) : null;
        
        this.dateOfExpiryPermanent = nativeResult["dateOfExpiryPermanent"];
        
        this.dateOfIssue = nativeResult["dateOfIssue"] != null ? Date(Map<String, dynamic>.from(nativeResult["dateOfIssue"])) : null;
        
        this.documentAdditionalNumber = nativeResult["documentAdditionalNumber"];
        
        this.documentNumber = nativeResult["documentNumber"];
        
        this.documentOptionalAdditionalNumber = nativeResult["documentOptionalAdditionalNumber"];
        
        this.driverLicenseDetailedInfo = nativeResult["driverLicenseDetailedInfo"] != null ? DriverLicenseDetailedInfo(Map<String, dynamic>.from(nativeResult["driverLicenseDetailedInfo"])) : null;
        
        this.employer = nativeResult["employer"];
        
        this.expired = nativeResult["expired"];
        
        this.faceImage = nativeResult["faceImage"];
        
        this.fathersName = nativeResult["fathersName"];
        
        this.firstName = nativeResult["firstName"];
        
        this.fullDocumentImage = nativeResult["fullDocumentImage"];
        
        this.fullName = nativeResult["fullName"];
        
        this.imageAnalysisResult = nativeResult["imageAnalysisResult"] != null ? ImageAnalysisResult(Map<String, dynamic>.from(nativeResult["imageAnalysisResult"])) : null;
        
        this.issuingAuthority = nativeResult["issuingAuthority"];
        
        this.lastName = nativeResult["lastName"];
        
        this.localizedName = nativeResult["localizedName"];
        
        this.maritalStatus = nativeResult["maritalStatus"];
        
        this.mothersName = nativeResult["mothersName"];
        
        this.mrzResult = nativeResult["mrzResult"] != null ? MrzResult(Map<String, dynamic>.from(nativeResult["mrzResult"])) : null;
        
        this.nationality = nativeResult["nationality"];
        
        this.personalIdNumber = nativeResult["personalIdNumber"];
        
        this.placeOfBirth = nativeResult["placeOfBirth"];
        
        this.processingStatus = ProcessingStatus.values[nativeResult["processingStatus"]];
        
        this.profession = nativeResult["profession"];
        
        this.race = nativeResult["race"];
        
        this.recognitionMode = RecognitionMode.values[nativeResult["recognitionMode"]];
        
        this.religion = nativeResult["religion"];
        
        this.residentialStatus = nativeResult["residentialStatus"];
        
        this.sex = nativeResult["sex"];
        
        this.signatureImage = nativeResult["signatureImage"];
        
        this.vizResult = nativeResult["vizResult"] != null ? VizResult(Map<String, dynamic>.from(nativeResult["vizResult"])) : null;
        
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
    
    ///Defines whether sensitive data should be removed from images, result fields or both.
    /// The setting only applies to certain documents
    /// 
    /// 
    AnonymizationMode anonymizationMode = AnonymizationMode.FullResult;
    
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
    
    ///Enable or disable recognition of specific document groups supported by the current license.
    /// 
    /// 
    RecognitionModeFilter recognitionModeFilter = RecognitionModeFilter();
    
    ///Sets whether face image from ID card should be extracted
    /// 
    /// 
    bool returnFaceImage = false;
    
    ///Sets whether full document image of ID card should be extracted.
    /// 
    /// 
    bool returnFullDocumentImage = false;
    
    ///Sets whether signature image from ID card should be extracted.
    /// 
    /// 
    bool returnSignatureImage = false;
    
    ///Configure the recognizer to save the raw camera frames.
    /// This significantly increases memory consumption.
    /// 
    /// 
    bool saveCameraFrames = false;
    
    ///Configure the recognizer to only work on already cropped and dewarped images.
    /// This only works for still images - video feeds will ignore this setting.
    /// 
    /// 
    bool scanCroppedDocumentImage = false;
    
    ///Property for setting DPI for signature images
    /// Valid ranges are [100,400]. Setting DPI out of valid ranges throws an exception
    /// 
    /// 
    int signatureImageDpi = 250;
    
    ///Defines whether result characters validatation is performed.
    /// If a result member contains invalid character, the result state cannot be valid
    /// 
    /// 
    bool validateResultCharacters = true;
    
    BlinkIdRecognizer(): super('BlinkIdRecognizer');

    RecognizerResult createResultFromNative(Map<String, dynamic> nativeResult) {
        return BlinkIdRecognizerResult(nativeResult);
    }

    factory BlinkIdRecognizer.fromJson(Map<String, dynamic> json) => _$BlinkIdRecognizerFromJson(json);
    Map<String, dynamic> toJson() => _$BlinkIdRecognizerToJson(this);
}