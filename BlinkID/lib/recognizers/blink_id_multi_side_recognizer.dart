import '../recognizer.dart';
import '../types.dart';
import 'package:json_annotation/json_annotation.dart';

part 'blink_id_multi_side_recognizer.g.dart';

/// Result object for BlinkIdMultiSideRecognizer.
class BlinkIdMultiSideRecognizerResult extends RecognizerResult {
    
    ///The additional name information of the document owner.
    StringResult? additionalAddressInformation;
    
    ///The additional name information of the document owner.
    StringResult? additionalNameInformation;
    
    ///The one more additional address information of the document owner.
    StringResult? additionalOptionalAddressInformation;
    
    ///The address of the document owner.
    StringResult? address;
    
    ///The current age of the document owner in years. It is calculated difference
    int? age;
    
    ///Additional info on processing of the back side.
    AdditionalProcessingInfo? backAdditionalProcessingInfo;
    
    ///Back camera frame.
    String? backCameraFrame;
    
    ///Image analysis result for the scanned document back side image
    ImageAnalysisResult? backImageAnalysisResult;
    
    ///Status of the last back side recognition process.
    ProcessingStatus? backProcessingStatus;
    
    ///The data extracted from the back side visual inspection zone.
    VizResult? backVizResult;
    
    ///Barcode camera frame.
    String? barcodeCameraFrame;
    
    ///The data extracted from the barcode.
    BarcodeResult? barcodeResult;
    
    ///The document class information.
    ClassInfo? classInfo;
    
    ///Info on whether the data extracted from front image matches the data extracted from the back image.
    DataMatchResult? dataMatch;
    
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
    
    ///The face image location.
    Rectangle? faceImageLocation;
    
    ///Side of the card of the face image.
    DocumentSide? faceImageSide;
    
    ///The fathers name of the document owner.
    StringResult? fathersName;
    
    ///The first name of the document owner.
    StringResult? firstName;
    
    ///Additional info on processing of the front side.
    AdditionalProcessingInfo? frontAdditionalProcessingInfo;
    
    ///Front camera frame.
    String? frontCameraFrame;
    
    ///Image analysis result for the scanned document front side image
    ImageAnalysisResult? frontImageAnalysisResult;
    
    ///Status of the last front side recognition process.
    ProcessingStatus? frontProcessingStatus;
    
    ///The data extracted from the front side visual inspection zone.
    VizResult? frontVizResult;
    
    ///Back side image of the document
    String? fullDocumentBackImage;
    
    ///Front side image of the document
    String? fullDocumentFrontImage;
    
    ///The full name of the document owner.
    StringResult? fullName;
    
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
    
    ///{true} if recognizer has finished scanning first side and is now scanning back side,
    bool? scanningFirstSideDone;
    
    ///The sex of the document owner.
    StringResult? sex;
    
    ///Signature image from the document
    String? signatureImage;
    
    BlinkIdMultiSideRecognizerResult(Map<String, dynamic> nativeResult): super(RecognizerResultState.values[nativeResult['resultState']]) {
        
        this.additionalAddressInformation = nativeResult["additionalAddressInformation"] != null ? StringResult(Map<String, dynamic>.from(nativeResult["additionalAddressInformation"])) : null;
        
        this.additionalNameInformation = nativeResult["additionalNameInformation"] != null ? StringResult(Map<String, dynamic>.from(nativeResult["additionalNameInformation"])) : null;
        
        this.additionalOptionalAddressInformation = nativeResult["additionalOptionalAddressInformation"] != null ? StringResult(Map<String, dynamic>.from(nativeResult["additionalOptionalAddressInformation"])) : null;
        
        this.address = nativeResult["address"] != null ? StringResult(Map<String, dynamic>.from(nativeResult["address"])) : null;
        
        this.age = nativeResult["age"];
        
        this.backAdditionalProcessingInfo = nativeResult["backAdditionalProcessingInfo"] != null ? AdditionalProcessingInfo(Map<String, dynamic>.from(nativeResult["backAdditionalProcessingInfo"])) : null;
        
        this.backCameraFrame = nativeResult["backCameraFrame"];
        
        this.backImageAnalysisResult = nativeResult["backImageAnalysisResult"] != null ? ImageAnalysisResult(Map<String, dynamic>.from(nativeResult["backImageAnalysisResult"])) : null;
        
        this.backProcessingStatus = ProcessingStatus.values[nativeResult["backProcessingStatus"]];
        
        this.backVizResult = nativeResult["backVizResult"] != null ? VizResult(Map<String, dynamic>.from(nativeResult["backVizResult"])) : null;
        
        this.barcodeCameraFrame = nativeResult["barcodeCameraFrame"];
        
        this.barcodeResult = nativeResult["barcodeResult"] != null ? BarcodeResult(Map<String, dynamic>.from(nativeResult["barcodeResult"])) : null;
        
        this.classInfo = nativeResult["classInfo"] != null ? ClassInfo(Map<String, dynamic>.from(nativeResult["classInfo"])) : null;
        
        this.dataMatch = nativeResult["dataMatch"] != null ? DataMatchResult(Map<String, dynamic>.from(nativeResult["dataMatch"])) : null;
        
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
        
        this.faceImageLocation = nativeResult["faceImageLocation"] != null ? Rectangle(Map<String, dynamic>.from(nativeResult["faceImageLocation"])) : null;
        
        this.faceImageSide = DocumentSide.values[nativeResult["faceImageSide"]];
        
        this.fathersName = nativeResult["fathersName"] != null ? StringResult(Map<String, dynamic>.from(nativeResult["fathersName"])) : null;
        
        this.firstName = nativeResult["firstName"] != null ? StringResult(Map<String, dynamic>.from(nativeResult["firstName"])) : null;
        
        this.frontAdditionalProcessingInfo = nativeResult["frontAdditionalProcessingInfo"] != null ? AdditionalProcessingInfo(Map<String, dynamic>.from(nativeResult["frontAdditionalProcessingInfo"])) : null;
        
        this.frontCameraFrame = nativeResult["frontCameraFrame"];
        
        this.frontImageAnalysisResult = nativeResult["frontImageAnalysisResult"] != null ? ImageAnalysisResult(Map<String, dynamic>.from(nativeResult["frontImageAnalysisResult"])) : null;
        
        this.frontProcessingStatus = ProcessingStatus.values[nativeResult["frontProcessingStatus"]];
        
        this.frontVizResult = nativeResult["frontVizResult"] != null ? VizResult(Map<String, dynamic>.from(nativeResult["frontVizResult"])) : null;
        
        this.fullDocumentBackImage = nativeResult["fullDocumentBackImage"];
        
        this.fullDocumentFrontImage = nativeResult["fullDocumentFrontImage"];
        
        this.fullName = nativeResult["fullName"] != null ? StringResult(Map<String, dynamic>.from(nativeResult["fullName"])) : null;
        
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
        
        this.scanningFirstSideDone = nativeResult["scanningFirstSideDone"];
        
        this.sex = nativeResult["sex"] != null ? StringResult(Map<String, dynamic>.from(nativeResult["sex"])) : null;
        
        this.signatureImage = nativeResult["signatureImage"];
        
    }
}


///A generic recognizer which can scan front and back side of the document.
@JsonSerializable()
class BlinkIdMultiSideRecognizer extends Recognizer {
    
    ///Additional anonymization settings.

    List<ClassAnonymizationSettings> additionalAnonymization = [];
    
    ///Skip processing of the blurred frames.

    bool allowBlurFilter = true;
    
    ///Proceed to scan the back side of a document even if some of the validity checks have failed while scanning the front side of a document.

    bool allowUncertainFrontSideScan = false;
    
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
    
    ///Configure the number of characters per field that are allowed to be inconsistent in data match.

    int maxAllowedMismatchesPerField = 0;
    
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
    
    ///Back side of the document will not be scanned if only the front side is supported for a specific document.

    bool skipUnsupportedBack = false;
    
    ///Allow only results containing expected characters for a given field.

    bool validateResultCharacters = true;
    
    BlinkIdMultiSideRecognizer(): super('BlinkIdMultiSideRecognizer');

    RecognizerResult createResultFromNative(Map<String, dynamic> nativeResult) {
        return BlinkIdMultiSideRecognizerResult(nativeResult);
    }

    factory BlinkIdMultiSideRecognizer.fromJson(Map<String, dynamic> json) => _$BlinkIdMultiSideRecognizerFromJson(json);
    Map<String, dynamic> toJson() => _$BlinkIdMultiSideRecognizerToJson(this);
}