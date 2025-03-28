import '../recognizer.dart';
import '../types.dart';
import 'package:json_annotation/json_annotation.dart';

part 'blink_id_single_side_recognizer.g.dart';

/// Result object for BlinkIdSingleSideRecognizer.
class BlinkIdSingleSideRecognizerResult extends RecognizerResult {
    
    ///The additional address information of the document owner.
    StringResult? additionalAddressInformation;
    
    ///The additional name information of the document owner.
    StringResult? additionalNameInformation;
    
    ///The one more additional address information of the document owner.
    StringResult? additionalOptionalAddressInformation;
    
    ///Additional info on processing.
    AdditionalProcessingInfo? additionalProcessingInfo;
    
    ///The address of the document owner.
    StringResult? address;
    
    ///The current age of the document owner in years. It is calculated difference
    /// between now and date of birth. Now is current time on the device.
    /// @return current age of the document owner in years or -1 if date of birth is unknown.
    int? age;
    
    ///The barcode raw camera frame.
    String? barcodeCameraFrame;
    
    ///Defines the data extracted from the barcode.
    BarcodeResult? barcodeResult;
    
    ///This member indicates whether the barcode scanning step was utilized during the
    /// process.
    /// If the barcode scanning step was executed: a parsable barcode image will be stored in the
    /// `barcodeCameraFrame`.
    /// If the barcode scanning step was not executed: a parsable barcode image will be stored in the
    /// `fullDocumentImage`.
    bool? barcodeStepUsed;
    
    ///The blood type of the document owner.
    StringResult? bloodType;
    
    ///The raw camera frame.
    String? cameraFrame;
    
    ///The classification information.
    ClassInfo? classInfo;
    
    ///The date of birth of the document owner.
    DateResult? dateOfBirth;
    
    ///The date of expiry of the document.
    DateResult? dateOfExpiry;
    
    ///Determines if date of expiry is permanent.
    bool? dateOfExpiryPermanent;
    
    ///The date of issue of the document.
    DateResult? dateOfIssue;
    
    ///The additional number of the document.
    StringResult? documentAdditionalNumber;
    
    ///The document number.
    StringResult? documentNumber;
    
    ///The one more additional number of the document.
    StringResult? documentOptionalAdditionalNumber;
    
    ///The transcription of the document subtype.
    StringResult? documentSubtype;
    
    ///The driver license detailed info.
    DriverLicenseDetailedInfo? driverLicenseDetailedInfo;
    
    ///The manufacturing year..
    StringResult? eligibilityCategory;
    
    ///The employer of the document owner.
    StringResult? employer;
    
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
    
    ///face image location from the document if enabled with returnFaceImage property.
    Rectangle? faceImageLocation;
    
    ///side of document that face image is located on if enabled with returnFaceImage property.
    DocumentSide? faceImageSide;
    
    ///The father's name of the document owner.
    StringResult? fathersName;
    
    ///The first name of the document owner.
    StringResult? firstName;
    
    ///full document image if enabled with returnFullDocumentImage property.
    String? fullDocumentImage;
    
    ///The full name of the document owner.
    StringResult? fullName;
    
    ///Defines possible color and moire statuses determined from scanned image.
    ImageAnalysisResult? imageAnalysisResult;
    
    ///The issuing authority of the document.
    StringResult? issuingAuthority;
    
    ///The last name of the document owner.
    StringResult? lastName;
    
    ///The localized name of the document owner.
    StringResult? localizedName;
    
    ///The manufacturing year.
    StringResult? manufacturingYear;
    
    ///The marital status of the document owner.
    StringResult? maritalStatus;
    
    ///The mother's name of the document owner.
    StringResult? mothersName;
    
    ///The data extracted from the machine readable zone
    MrzResult? mrzResult;
    
    ///The nationality of the documet owner.
    StringResult? nationality;
    
    ///The personal identification number.
    StringResult? personalIdNumber;
    
    ///The place of birth of the document owner.
    StringResult? placeOfBirth;
    
    ///Defines status of the last recognition process.
    ProcessingStatus? processingStatus;
    
    ///The profession of the document owner.
    StringResult? profession;
    
    ///The race of the document owner.
    StringResult? race;
    
    ///Recognition mode used to scan current document.
    RecognitionMode? recognitionMode;
    
    ///The religion of the document owner.
    StringResult? religion;
    
    ///The remarks on the residence permit.
    StringResult? remarks;
    
    ///The residence permit type.
    StringResult? residencePermitType;
    
    ///The residential stauts of the document owner.
    StringResult? residentialStatus;
    
    ///The sex of the document owner.
    StringResult? sex;
    
    ///image of the signature if enabled with returnSignatureImage property.
    String? signatureImage;
    
    ///The specific document validity.
    StringResult? specificDocumentValidity;
    
    ///The sponsor of the document owner.
    StringResult? sponsor;
    
    ///The vehicle owner.
    StringResult? vehicleOwner;
    
    ///The eligibility category.
    StringResult? vehicleType;
    
    ///The visa type.
    StringResult? visaType;
    
    ///Defines the data extracted from the visual inspection zone
    VizResult? vizResult;
    
    ///The dependents info.
    List<DependentInfo>? dependentsInfo;
    
    BlinkIdSingleSideRecognizerResult(Map<String, dynamic> nativeResult): super(RecognizerResultState.values[nativeResult['resultState']]) {
        
        this.additionalAddressInformation = nativeResult["additionalAddressInformation"] != null ? StringResult(Map<String, dynamic>.from(nativeResult["additionalAddressInformation"])) : null;
        
        this.additionalNameInformation = nativeResult["additionalNameInformation"] != null ? StringResult(Map<String, dynamic>.from(nativeResult["additionalNameInformation"])) : null;
        
        this.additionalOptionalAddressInformation = nativeResult["additionalOptionalAddressInformation"] != null ? StringResult(Map<String, dynamic>.from(nativeResult["additionalOptionalAddressInformation"])) : null;
        
        this.additionalProcessingInfo = nativeResult["additionalProcessingInfo"] != null ? AdditionalProcessingInfo(Map<String, dynamic>.from(nativeResult["additionalProcessingInfo"])) : null;
        
        this.address = nativeResult["address"] != null ? StringResult(Map<String, dynamic>.from(nativeResult["address"])) : null;
        
        this.age = nativeResult["age"];
        
        this.barcodeCameraFrame = nativeResult["barcodeCameraFrame"];
        
        this.barcodeResult = nativeResult["barcodeResult"] != null ? BarcodeResult(Map<String, dynamic>.from(nativeResult["barcodeResult"])) : null;
        
        this.barcodeStepUsed = nativeResult["barcodeStepUsed"];
        
        this.bloodType = nativeResult["bloodType"] != null ? StringResult(Map<String, dynamic>.from(nativeResult["bloodType"])) : null;
        
        this.cameraFrame = nativeResult["cameraFrame"];
        
        this.classInfo = nativeResult["classInfo"] != null ? ClassInfo(Map<String, dynamic>.from(nativeResult["classInfo"])) : null;
        
        this.dateOfBirth = nativeResult["dateOfBirth"] != null ? DateResult(Map<String, dynamic>.from(nativeResult["dateOfBirth"])) : null;
        
        this.dateOfExpiry = nativeResult["dateOfExpiry"] != null ? DateResult(Map<String, dynamic>.from(nativeResult["dateOfExpiry"])) : null;
        
        this.dateOfExpiryPermanent = nativeResult["dateOfExpiryPermanent"];
        
        this.dateOfIssue = nativeResult["dateOfIssue"] != null ? DateResult(Map<String, dynamic>.from(nativeResult["dateOfIssue"])) : null;
        
        this.documentAdditionalNumber = nativeResult["documentAdditionalNumber"] != null ? StringResult(Map<String, dynamic>.from(nativeResult["documentAdditionalNumber"])) : null;
        
        this.documentNumber = nativeResult["documentNumber"] != null ? StringResult(Map<String, dynamic>.from(nativeResult["documentNumber"])) : null;
        
        this.documentOptionalAdditionalNumber = nativeResult["documentOptionalAdditionalNumber"] != null ? StringResult(Map<String, dynamic>.from(nativeResult["documentOptionalAdditionalNumber"])) : null;
        
        this.documentSubtype = nativeResult["documentSubtype"] != null ? StringResult(Map<String, dynamic>.from(nativeResult["documentSubtype"])) : null;
        
        this.driverLicenseDetailedInfo = nativeResult["driverLicenseDetailedInfo"] != null ? DriverLicenseDetailedInfo(Map<String, dynamic>.from(nativeResult["driverLicenseDetailedInfo"])) : null;
        
        this.eligibilityCategory = nativeResult["eligibilityCategory"] != null ? StringResult(Map<String, dynamic>.from(nativeResult["eligibilityCategory"])) : null;
        
        this.employer = nativeResult["employer"] != null ? StringResult(Map<String, dynamic>.from(nativeResult["employer"])) : null;
        
        this.expired = nativeResult["expired"];
        
        this.faceImage = nativeResult["faceImage"];
        
        this.faceImageLocation = nativeResult["faceImageLocation"] != null ? Rectangle(Map<String, dynamic>.from(nativeResult["faceImageLocation"])) : null;
        
        this.faceImageSide = nativeResult["faceImageSide"] != null ? DocumentSide.values[nativeResult["faceImageSide"]] : null;
        
        this.fathersName = nativeResult["fathersName"] != null ? StringResult(Map<String, dynamic>.from(nativeResult["fathersName"])) : null;
        
        this.firstName = nativeResult["firstName"] != null ? StringResult(Map<String, dynamic>.from(nativeResult["firstName"])) : null;
        
        this.fullDocumentImage = nativeResult["fullDocumentImage"];
        
        this.fullName = nativeResult["fullName"] != null ? StringResult(Map<String, dynamic>.from(nativeResult["fullName"])) : null;
        
        this.imageAnalysisResult = nativeResult["imageAnalysisResult"] != null ? ImageAnalysisResult(Map<String, dynamic>.from(nativeResult["imageAnalysisResult"])) : null;
        
        this.issuingAuthority = nativeResult["issuingAuthority"] != null ? StringResult(Map<String, dynamic>.from(nativeResult["issuingAuthority"])) : null;
        
        this.lastName = nativeResult["lastName"] != null ? StringResult(Map<String, dynamic>.from(nativeResult["lastName"])) : null;
        
        this.localizedName = nativeResult["localizedName"] != null ? StringResult(Map<String, dynamic>.from(nativeResult["localizedName"])) : null;
        
        this.manufacturingYear = nativeResult["manufacturingYear"] != null ? StringResult(Map<String, dynamic>.from(nativeResult["manufacturingYear"])) : null;
        
        this.maritalStatus = nativeResult["maritalStatus"] != null ? StringResult(Map<String, dynamic>.from(nativeResult["maritalStatus"])) : null;
        
        this.mothersName = nativeResult["mothersName"] != null ? StringResult(Map<String, dynamic>.from(nativeResult["mothersName"])) : null;
        
        this.mrzResult = nativeResult["mrzResult"] != null ? MrzResult(Map<String, dynamic>.from(nativeResult["mrzResult"])) : null;
        
        this.nationality = nativeResult["nationality"] != null ? StringResult(Map<String, dynamic>.from(nativeResult["nationality"])) : null;
        
        this.personalIdNumber = nativeResult["personalIdNumber"] != null ? StringResult(Map<String, dynamic>.from(nativeResult["personalIdNumber"])) : null;
        
        this.placeOfBirth = nativeResult["placeOfBirth"] != null ? StringResult(Map<String, dynamic>.from(nativeResult["placeOfBirth"])) : null;
        
        this.processingStatus = ProcessingStatus.values[nativeResult["processingStatus"]];
        
        this.profession = nativeResult["profession"] != null ? StringResult(Map<String, dynamic>.from(nativeResult["profession"])) : null;
        
        this.race = nativeResult["race"] != null ? StringResult(Map<String, dynamic>.from(nativeResult["race"])) : null;
        
        this.recognitionMode = RecognitionMode.values[nativeResult["recognitionMode"]];
        
        this.religion = nativeResult["religion"] != null ? StringResult(Map<String, dynamic>.from(nativeResult["religion"])) : null;
        
        this.remarks = nativeResult["remarks"] != null ? StringResult(Map<String, dynamic>.from(nativeResult["remarks"])) : null;
        
        this.residencePermitType = nativeResult["residencePermitType"] != null ? StringResult(Map<String, dynamic>.from(nativeResult["residencePermitType"])) : null;
        
        this.residentialStatus = nativeResult["residentialStatus"] != null ? StringResult(Map<String, dynamic>.from(nativeResult["residentialStatus"])) : null;
        
        this.sex = nativeResult["sex"] != null ? StringResult(Map<String, dynamic>.from(nativeResult["sex"])) : null;
        
        this.signatureImage = nativeResult["signatureImage"];
        
        this.specificDocumentValidity = nativeResult["specificDocumentValidity"] != null ? StringResult(Map<String, dynamic>.from(nativeResult["specificDocumentValidity"])) : null;
        
        this.sponsor = nativeResult["sponsor"] != null ? StringResult(Map<String, dynamic>.from(nativeResult["sponsor"])) : null;
        
        this.vehicleOwner = nativeResult["vehicleOwner"] != null ? StringResult(Map<String, dynamic>.from(nativeResult["vehicleOwner"])) : null;
        
        this.vehicleType = nativeResult["vehicleType"] != null ? StringResult(Map<String, dynamic>.from(nativeResult["vehicleType"])) : null;
        
        this.visaType = nativeResult["visaType"] != null ? StringResult(Map<String, dynamic>.from(nativeResult["visaType"])) : null;
        
        this.vizResult = nativeResult["vizResult"] != null ? VizResult(Map<String, dynamic>.from(nativeResult["vizResult"])) : null;
        
        this.dependentsInfo = nativeResult["dependentsInfo"] != null ? (nativeResult["dependentsInfo"] as List<dynamic>).map((item) => DependentInfo(Map<String, dynamic>.from(item))).toList(): null;
        
    }
}


///The Blink ID Recognizer is used for scanning Blink ID.
@JsonSerializable()
class BlinkIdSingleSideRecognizer extends Recognizer {
    
    ///Additional anonymization settings.

    List<ClassAnonymizationSettings> additionalAnonymization = [];
    
    ///Allows barcode recognition to proceed even if the initial extraction fails.
    /// This only works for still images - video feeds will ignore this setting.
    /// If the barcode recognition is successful, the recognizer will still end in a valid state.
    /// This setting is applicable only to photo frames. For multi-side recognizers, it is permitted only for the back side.
    /// 
    /// 

    bool allowBarcodeScanOnly = false;
    
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
    
    ///Strictness level for blur detection.
    /// 
    /// 

    StrictnessLevel blurStrictnessLevel = StrictnessLevel.Normal;
    
    ///Sets the ClassFilter that can determine whether the document should be processed or filtered out.

    ClassFilter classFilter = ClassFilter();
    
    ///Enables the aggregation of data from multiple frames.
    /// Disabling this setting will yield higher-quality captured images, but it may slow down the scanning process due to the additional effort required to find the optimal frame.
    /// Enabling this setting will simplify the extraction process, but the extracted data will be aggregated from multiple frames instead of being sourced from a single frame.
    /// 
    /// 

    bool combineFrameResults = true;
    
    ///Get custom class rules.

    List<CustomClassRules> customClassRules = [];
    
    ///Skip processing of the blurred frames.
    /// 
    /// 

    bool enableBlurFilter = true;
    
    ///Skip processing of the glared frames.
    /// 
    /// 

    bool enableGlareFilter = true;
    
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
    
    ///Strictness level for glare detection.
    /// 
    /// 

    StrictnessLevel glareStrictnessLevel = StrictnessLevel.Normal;
    
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
    
    BlinkIdSingleSideRecognizer(): super('BlinkIdSingleSideRecognizer');

    RecognizerResult createResultFromNative(Map<String, dynamic> nativeResult) {
        return BlinkIdSingleSideRecognizerResult(nativeResult);
    }

    factory BlinkIdSingleSideRecognizer.fromJson(Map<String, dynamic> json) => _$BlinkIdSingleSideRecognizerFromJson(json);
    Map<String, dynamic> toJson() => _$BlinkIdSingleSideRecognizerToJson(this);
}