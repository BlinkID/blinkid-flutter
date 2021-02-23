import '../recognizer.dart';
import '../types.dart';
import 'package:json_annotation/json_annotation.dart';

part 'blink_id_combined_recognizer.g.dart';

/// Result object for BlinkIdCombinedRecognizer.
class BlinkIdCombinedRecognizerResult extends RecognizerResult {
    
    ///The additional name information of the document owner. 
    String additionalAddressInformation;
    
    ///The additional name information of the document owner. 
    String additionalNameInformation;
    
    ///The address of the document owner. 
    String address;
    
    ///The current age of the document owner in years. It is calculated difference 
    int age;
    
    ///Image analysis result for the scanned document back side image 
    ImageAnalysisResult backImageAnalysisResult;
    
    ///The data extracted from the back side visual inspection zone. 
    VizResult backVizResult;
    
    ///The data extracted from the barcode. 
    BarcodeResult barcodeResult;
    
    ///The document class information. 
    ClassInfo classInfo;
    
    ///The date of birth of the document owner. 
    Date dateOfBirth;
    
    ///The date of expiry of the document. 
    Date dateOfExpiry;
    
    ///Determines if date of expiry is permanent. 
    bool dateOfExpiryPermanent;
    
    ///The date of issue of the document. 
    Date dateOfIssue;
    
    ///Defines digital signature of recognition results. 
    String digitalSignature;
    
    ///Defines digital signature version. 
    int digitalSignatureVersion;
    
    ///The additional number of the document. 
    String documentAdditionalNumber;
    
    ///Defines result of the data matching algorithm for scanned parts/sides of the document. 
    DataMatchResult documentDataMatch;
    
    ///The document number. 
    String documentNumber;
    
    ///The one more additional number of the document. 
    String documentOptionalAdditionalNumber;
    
    ///The driver license detailed info. 
    DriverLicenseDetailedInfo driverLicenseDetailedInfo;
    
    ///The employer of the document owner. 
    String employer;
    
    ///Checks whether the document has expired or not by comparing the current 
    bool expired;
    
    ///Face image from the document 
    String faceImage;
    
    ///The first name of the document owner. 
    String firstName;
    
    ///Image analysis result for the scanned document front side image 
    ImageAnalysisResult frontImageAnalysisResult;
    
    ///The data extracted from the front side visual inspection zone. 
    VizResult frontVizResult;
    
    ///Back side image of the document 
    String fullDocumentBackImage;
    
    ///Front side image of the document 
    String fullDocumentFrontImage;
    
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
    
    ///The data extracted from the machine readable zone. 
    MrzResult mrzResult;
    
    ///The nationality of the documet owner. 
    String nationality;
    
    ///The personal identification number. 
    String personalIdNumber;
    
    ///The place of birth of the document owner. 
    String placeOfBirth;
    
    ///Status of the last recognition process. 
    ProcessingStatus processingStatus;
    
    ///The profession of the document owner. 
    String profession;
    
    ///The race of the document owner. 
    String race;
    
    ///Recognition mode used to scan current document. 
    RecognitionMode recognitionMode;
    
    ///The religion of the document owner. 
    String religion;
    
    ///The residential stauts of the document owner. 
    String residentialStatus;
    
    ///{true} if recognizer has finished scanning first side and is now scanning back side, 
    bool scanningFirstSideDone;
    
    ///The sex of the document owner. 
    String sex;
    
    ///Signature image from the document 
    String signatureImage;
    
    BlinkIdCombinedRecognizerResult(Map<String, dynamic> nativeResult): super(RecognizerResultState.values[nativeResult['resultState']]) {
        
        this.additionalAddressInformation = nativeResult["additionalAddressInformation"];
        
        this.additionalNameInformation = nativeResult["additionalNameInformation"];
        
        this.address = nativeResult["address"];
        
        this.age = nativeResult["age"];
        
        this.backImageAnalysisResult = nativeResult["backImageAnalysisResult"] != null ? ImageAnalysisResult(Map<String, dynamic>.from(nativeResult["backImageAnalysisResult"])) : null;
        
        this.backVizResult = nativeResult["backVizResult"] != null ? VizResult(Map<String, dynamic>.from(nativeResult["backVizResult"])) : null;
        
        this.barcodeResult = nativeResult["barcodeResult"] != null ? BarcodeResult(Map<String, dynamic>.from(nativeResult["barcodeResult"])) : null;
        
        this.classInfo = nativeResult["classInfo"] != null ? ClassInfo(Map<String, dynamic>.from(nativeResult["classInfo"])) : null;
        
        this.dateOfBirth = nativeResult["dateOfBirth"] != null ? Date(Map<String, dynamic>.from(nativeResult["dateOfBirth"])) : null;
        
        this.dateOfExpiry = nativeResult["dateOfExpiry"] != null ? Date(Map<String, dynamic>.from(nativeResult["dateOfExpiry"])) : null;
        
        this.dateOfExpiryPermanent = nativeResult["dateOfExpiryPermanent"];
        
        this.dateOfIssue = nativeResult["dateOfIssue"] != null ? Date(Map<String, dynamic>.from(nativeResult["dateOfIssue"])) : null;
        
        this.digitalSignature = nativeResult["digitalSignature"];
        
        this.digitalSignatureVersion = nativeResult["digitalSignatureVersion"];
        
        this.documentAdditionalNumber = nativeResult["documentAdditionalNumber"];
        
        this.documentDataMatch = DataMatchResult.values[nativeResult["documentDataMatch"]];
        
        this.documentNumber = nativeResult["documentNumber"];
        
        this.documentOptionalAdditionalNumber = nativeResult["documentOptionalAdditionalNumber"];
        
        this.driverLicenseDetailedInfo = nativeResult["driverLicenseDetailedInfo"] != null ? DriverLicenseDetailedInfo(Map<String, dynamic>.from(nativeResult["driverLicenseDetailedInfo"])) : null;
        
        this.employer = nativeResult["employer"];
        
        this.expired = nativeResult["expired"];
        
        this.faceImage = nativeResult["faceImage"];
        
        this.firstName = nativeResult["firstName"];
        
        this.frontImageAnalysisResult = nativeResult["frontImageAnalysisResult"] != null ? ImageAnalysisResult(Map<String, dynamic>.from(nativeResult["frontImageAnalysisResult"])) : null;
        
        this.frontVizResult = nativeResult["frontVizResult"] != null ? VizResult(Map<String, dynamic>.from(nativeResult["frontVizResult"])) : null;
        
        this.fullDocumentBackImage = nativeResult["fullDocumentBackImage"];
        
        this.fullDocumentFrontImage = nativeResult["fullDocumentFrontImage"];
        
        this.fullName = nativeResult["fullName"];
        
        this.issuingAuthority = nativeResult["issuingAuthority"];
        
        this.lastName = nativeResult["lastName"];
        
        this.localizedName = nativeResult["localizedName"];
        
        this.maritalStatus = nativeResult["maritalStatus"];
        
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
        
        this.scanningFirstSideDone = nativeResult["scanningFirstSideDone"];
        
        this.sex = nativeResult["sex"];
        
        this.signatureImage = nativeResult["signatureImage"];
        
    }
}


///A generic recognizer which can scan front and back side of the document.
@JsonSerializable()
class BlinkIdCombinedRecognizer extends Recognizer {
    
    ///Defines whether blured frames filtering is allowed.
    bool allowBlurFilter = true;
    
    ///Defines whether returning of unparsed MRZ (Machine Readable Zone) results is allowed.
    bool allowUnparsedMrzResults = false;
    
    ///Defines whether returning unverified MRZ (Machine Readable Zone) results is allowed.
    bool allowUnverifiedMrzResults = true;
    
    ///Whether sensitive data should be removed from images, result fields or both.
    AnonymizationMode anonymizationMode = AnonymizationMode.FullResult;
    
    ///The DPI (Dots Per Inch) for face image that should be returned.
    int faceImageDpi = 250;
    
    ///The DPI (Dots Per Inch) for full document image that should be returned.
    int fullDocumentImageDpi = 250;
    
    ///The extension factors for full document image.
    ImageExtensionFactors fullDocumentImageExtensionFactors = ImageExtensionFactors();
    
    ///Padding is a minimum distance from the edge of the frame and it is defined
    double paddingEdge = 0.0;
    
    ///Currently set recognition mode filter.
    RecognitionModeFilter recognitionModeFilter = RecognitionModeFilter();
    
    ///Defines whether face image will be available in result.
    bool returnFaceImage = false;
    
    ///Defines whether full document image will be available in
    bool returnFullDocumentImage = false;
    
    ///Defines whether signature image will be available in result.
    bool returnSignatureImage = false;
    
    ///Configure the recognizer to only work on already cropped and dewarped images.
    bool scanCroppedDocumentImage = true;
    
    ///Defines whether or not recognition result should be signed.
    bool signResult = false;
    
    ///The DPI (Dots Per Inch) for signature image that should be returned.
    int signatureImageDpi = 250;
    
    ///Skip back side capture and processing step when back side of the document is not supported.
    bool skipUnsupportedBack = false;
    
    ///Whether result characters validatation is performed.
    bool validateResultCharacters = true;
    
    BlinkIdCombinedRecognizer(): super('BlinkIdCombinedRecognizer');

    RecognizerResult createResultFromNative(Map<String, dynamic> nativeResult) {
        return BlinkIdCombinedRecognizerResult(nativeResult);
    }

    factory BlinkIdCombinedRecognizer.fromJson(Map<String, dynamic> json) => _$BlinkIdCombinedRecognizerFromJson(json);

    Map<String, dynamic> toJson() => _$BlinkIdCombinedRecognizerToJson(this);
}