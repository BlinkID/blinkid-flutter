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
    int? age;
    
    ///Barcode camera frame. 
    String? barcodeCameraFrame;
    
    ///The data extracted from the barcode. 
    BarcodeResult? barcodeResult;
    
    ///Camera frame. 
    String? cameraFrame;
    
    ///The document class information. 
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
    
    ///The driver license detailed info. 
    DriverLicenseDetailedInfo? driverLicenseDetailedInfo;
    
    ///The employer of the document owner. 
    StringResult? employer;
    
    ///Checks whether the document has expired or not by comparing the current 
    bool? expired;
    
    ///Face image from the document 
    String? faceImage;
    
    ///The fathers name of the document owner. 
    StringResult? fathersName;
    
    ///The first name of the document owner. 
    StringResult? firstName;
    
    ///Image of the full document 
    String? fullDocumentImage;
    
    ///The full name of the document owner. 
    StringResult? fullName;
    
    ///Image analysis result for the scanned document image 
    ImageAnalysisResult? imageAnalysisResult;
    
    ///The issuing authority of the document. 
    StringResult? issuingAuthority;
    
    ///The last name of the document owner. 
    StringResult? lastName;
    
    ///The localized name of the document owner. 
    StringResult? localizedName;
    
    ///The marital status of the document owner. 
    StringResult? maritalStatus;
    
    ///The mothers name of the document owner. 
    StringResult? mothersName;
    
    ///The data extracted from the machine readable zone. 
    MrzResult? mrzResult;
    
    ///The nationality of the documet owner. 
    StringResult? nationality;
    
    ///The personal identification number. 
    StringResult? personalIdNumber;
    
    ///The place of birth of the document owner. 
    StringResult? placeOfBirth;
    
    ///Status of the last recognition process. 
    ProcessingStatus? processingStatus;
    
    ///The profession of the document owner. 
    StringResult? profession;
    
    ///The race of the document owner. 
    StringResult? race;
    
    ///Recognition mode used to scan current document. 
    RecognitionMode? recognitionMode;
    
    ///The religion of the document owner. 
    StringResult? religion;
    
    ///The residential stauts of the document owner. 
    StringResult? residentialStatus;
    
    ///The sex of the document owner. 
    StringResult? sex;
    
    ///Signature image from the document 
    String? signatureImage;
    
    ///The data extracted from the visual inspection zone. 
    VizResult? vizResult;
    
    BlinkIdSingleSideRecognizerResult(Map<String, dynamic> nativeResult): super(RecognizerResultState.values[nativeResult['resultState']]) {
        
        this.additionalAddressInformation = nativeResult["additionalAddressInformation"] != null ? StringResult(Map<String, dynamic>.from(nativeResult["additionalAddressInformation"])) : null;
        
        this.additionalNameInformation = nativeResult["additionalNameInformation"] != null ? StringResult(Map<String, dynamic>.from(nativeResult["additionalNameInformation"])) : null;
        
        this.additionalOptionalAddressInformation = nativeResult["additionalOptionalAddressInformation"] != null ? StringResult(Map<String, dynamic>.from(nativeResult["additionalOptionalAddressInformation"])) : null;
        
        this.additionalProcessingInfo = nativeResult["additionalProcessingInfo"] != null ? AdditionalProcessingInfo(Map<String, dynamic>.from(nativeResult["additionalProcessingInfo"])) : null;
        
        this.address = nativeResult["address"] != null ? StringResult(Map<String, dynamic>.from(nativeResult["address"])) : null;
        
        this.age = nativeResult["age"];
        
        this.barcodeCameraFrame = nativeResult["barcodeCameraFrame"];
        
        this.barcodeResult = nativeResult["barcodeResult"] != null ? BarcodeResult(Map<String, dynamic>.from(nativeResult["barcodeResult"])) : null;
        
        this.cameraFrame = nativeResult["cameraFrame"];
        
        this.classInfo = nativeResult["classInfo"] != null ? ClassInfo(Map<String, dynamic>.from(nativeResult["classInfo"])) : null;
        
        this.dateOfBirth = nativeResult["dateOfBirth"] != null ? DateResult(Map<String, dynamic>.from(nativeResult["dateOfBirth"])) : null;
        
        this.dateOfExpiry = nativeResult["dateOfExpiry"] != null ? DateResult(Map<String, dynamic>.from(nativeResult["dateOfExpiry"])) : null;
        
        this.dateOfExpiryPermanent = nativeResult["dateOfExpiryPermanent"];
        
        this.dateOfIssue = nativeResult["dateOfIssue"] != null ? DateResult(Map<String, dynamic>.from(nativeResult["dateOfIssue"])) : null;
        
        this.documentAdditionalNumber = nativeResult["documentAdditionalNumber"] != null ? StringResult(Map<String, dynamic>.from(nativeResult["documentAdditionalNumber"])) : null;
        
        this.documentNumber = nativeResult["documentNumber"] != null ? StringResult(Map<String, dynamic>.from(nativeResult["documentNumber"])) : null;
        
        this.documentOptionalAdditionalNumber = nativeResult["documentOptionalAdditionalNumber"] != null ? StringResult(Map<String, dynamic>.from(nativeResult["documentOptionalAdditionalNumber"])) : null;
        
        this.driverLicenseDetailedInfo = nativeResult["driverLicenseDetailedInfo"] != null ? DriverLicenseDetailedInfo(Map<String, dynamic>.from(nativeResult["driverLicenseDetailedInfo"])) : null;
        
        this.employer = nativeResult["employer"] != null ? StringResult(Map<String, dynamic>.from(nativeResult["employer"])) : null;
        
        this.expired = nativeResult["expired"];
        
        this.faceImage = nativeResult["faceImage"];
        
        this.fathersName = nativeResult["fathersName"] != null ? StringResult(Map<String, dynamic>.from(nativeResult["fathersName"])) : null;
        
        this.firstName = nativeResult["firstName"] != null ? StringResult(Map<String, dynamic>.from(nativeResult["firstName"])) : null;
        
        this.fullDocumentImage = nativeResult["fullDocumentImage"];
        
        this.fullName = nativeResult["fullName"] != null ? StringResult(Map<String, dynamic>.from(nativeResult["fullName"])) : null;
        
        this.imageAnalysisResult = nativeResult["imageAnalysisResult"] != null ? ImageAnalysisResult(Map<String, dynamic>.from(nativeResult["imageAnalysisResult"])) : null;
        
        this.issuingAuthority = nativeResult["issuingAuthority"] != null ? StringResult(Map<String, dynamic>.from(nativeResult["issuingAuthority"])) : null;
        
        this.lastName = nativeResult["lastName"] != null ? StringResult(Map<String, dynamic>.from(nativeResult["lastName"])) : null;
        
        this.localizedName = nativeResult["localizedName"] != null ? StringResult(Map<String, dynamic>.from(nativeResult["localizedName"])) : null;
        
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
        
        this.residentialStatus = nativeResult["residentialStatus"] != null ? StringResult(Map<String, dynamic>.from(nativeResult["residentialStatus"])) : null;
        
        this.sex = nativeResult["sex"] != null ? StringResult(Map<String, dynamic>.from(nativeResult["sex"])) : null;
        
        this.signatureImage = nativeResult["signatureImage"];
        
        this.vizResult = nativeResult["vizResult"] != null ? VizResult(Map<String, dynamic>.from(nativeResult["vizResult"])) : null;
        
    }
}


///Generic BlinkID single side recognizer.
@JsonSerializable()
class BlinkIdSingleSideRecognizer extends Recognizer {
    
    ///Skip processing of the blurred frames.
    bool allowBlurFilter = true;
    
    ///Allow reading of non-standard MRZ (Machine Readable Zone). Only raw MRZ result is returned.
    bool allowUnparsedMrzResults = false;
    
    ///Allow reading of standard MRZ (Machine Readable Zone) which gets successfully parsed,
    bool allowUnverifiedMrzResults = true;
    
    ///Redact specific fields based on requirements or laws regarding a specific document.
    AnonymizationMode anonymizationMode = AnonymizationMode.FullResult;
    
    ///The DPI (Dots Per Inch) for face image that should be returned.
    int faceImageDpi = 250;
    
    ///The DPI (Dots Per Inch) for full document image that should be returned.
    int fullDocumentImageDpi = 250;
    
    ///The extension factors for full document image.
    ImageExtensionFactors fullDocumentImageExtensionFactors = ImageExtensionFactors();
    
    ///Minimum required distance between the edge of the scanning frame and the document.
    double paddingEdge = 0.0;
    
    ///Currently set recognition mode filter.
    RecognitionModeFilter recognitionModeFilter = RecognitionModeFilter();
    
    ///Defines whether face image will be available in result.
    bool returnFaceImage = false;
    
    ///Defines whether full document image will be available in
    bool returnFullDocumentImage = false;
    
    ///Defines whether signature image will be available in result.
    bool returnSignatureImage = false;
    
    ///Save the raw camera frames at the moment of the data extraction or timeout.
    bool saveCameraFrames = false;
    
    ///Process only cropped document images with corrected perspective (frontal images of a document).
    bool scanCroppedDocumentImage = false;
    
    ///The DPI (Dots Per Inch) for signature image that should be returned.
    int signatureImageDpi = 250;
    
    ///Allow only results containing expected characters for a given field.
    bool validateResultCharacters = true;
    
    BlinkIdSingleSideRecognizer(): super('BlinkIdSingleSideRecognizer');

    RecognizerResult createResultFromNative(Map<String, dynamic> nativeResult) {
        return BlinkIdSingleSideRecognizerResult(nativeResult);
    }

    factory BlinkIdSingleSideRecognizer.fromJson(Map<String, dynamic> json) => _$BlinkIdSingleSideRecognizerFromJson(json);
    Map<String, dynamic> toJson() => _$BlinkIdSingleSideRecognizerToJson(this);
}