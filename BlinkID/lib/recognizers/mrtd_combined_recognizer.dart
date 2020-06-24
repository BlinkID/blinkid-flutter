import '../recognizer.dart';
import '../types.dart';
import 'package:json_annotation/json_annotation.dart';

part 'mrtd_combined_recognizer.g.dart';

/// Result object for MrtdCombinedRecognizer.
class MrtdCombinedRecognizerResult extends RecognizerResult {
    
    ///Defines digital signature of recognition results. 
    String digitalSignature;
    
    ///Defines digital signature version. 
    int digitalSignatureVersion;
    
    ///Defines result of the data matching algorithm for scanned parts/sides of the document. 
    DataMatchResult documentDataMatch;
    
    ///Face image from the document 
    String faceImage;
    
    ///Back side image of the document 
    String fullDocumentBackImage;
    
    ///Front side image of the document 
    String fullDocumentFrontImage;
    
    ///The data extracted from the machine readable zone. 
    MrzResult mrzResult;
    
    ///{true} if recognizer has finished scanning first side and is now scanning back side, 
    bool scanningFirstSideDone;
    
    MrtdCombinedRecognizerResult(Map<String, dynamic> nativeResult): super(RecognizerResultState.values[nativeResult['resultState']]) {
        
        this.digitalSignature = nativeResult["digitalSignature"];
        
        this.digitalSignatureVersion = nativeResult["digitalSignatureVersion"];
        
        this.documentDataMatch = DataMatchResult.values[nativeResult["documentDataMatch"] ];
        
        this.faceImage = nativeResult["faceImage"];
        
        this.fullDocumentBackImage = nativeResult["fullDocumentBackImage"];
        
        this.fullDocumentFrontImage = nativeResult["fullDocumentFrontImage"];
        
        this.mrzResult = nativeResult["mrzResult"] != null ? MrzResult(Map<String, dynamic>.from(nativeResult["mrzResult"])) : null;
        
        this.scanningFirstSideDone = nativeResult["scanningFirstSideDone"];
        
    }
}


///Recognizer for combined reading of face from front side of documents  and MRZ from back side of
///  * Machine Readable Travel Document.
@JsonSerializable()
class MrtdCombinedRecognizer extends Recognizer {
    
    ///Whether special characters are allowed.
    bool allowSpecialCharacters = false;
    
    ///Whether returning of unparsed results is allowed.
    bool allowUnparsedResults = false;
    
    ///Whether returning of unverified results is allowed.
    bool allowUnverifiedResults = false;
    
    ///Currently used detector type.
    DocumentFaceDetectorType detectorType = DocumentFaceDetectorType.TD1;
    
    ///The DPI (Dots Per Inch) for face image that should be returned.
    int faceImageDpi = 250;
    
    ///The DPI (Dots Per Inch) for full document image that should be returned.
    int fullDocumentImageDpi = 250;
    
    ///The extension factors for full document image.
    ImageExtensionFactors fullDocumentImageExtensionFactors = ImageExtensionFactors();
    
    ///Minimum number of stable detections required for detection to be successful.
    int numStableDetectionsThreshold = 6;
    
    ///Defines whether face image will be available in result.
    bool returnFaceImage = false;
    
    ///Defines whether full document image will be available in
    bool returnFullDocumentImage = false;
    
    ///Defines whether or not recognition result should be signed.
    bool signResult = false;
    
    MrtdCombinedRecognizer(): super('MrtdCombinedRecognizer');

    RecognizerResult createResultFromNative(Map<String, dynamic> nativeResult) {
        return MrtdCombinedRecognizerResult(nativeResult);
    }

    factory MrtdCombinedRecognizer.fromJson(Map<String, dynamic> json) => _$MrtdCombinedRecognizerFromJson(json);

    Map<String, dynamic> toJson() => _$MrtdCombinedRecognizerToJson(this);
}