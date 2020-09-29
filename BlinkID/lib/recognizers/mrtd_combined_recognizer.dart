import '../recognizer.dart';
import '../types.dart';
import 'package:json_annotation/json_annotation.dart';

part 'mrtd_combined_recognizer.g.dart';

/// Result object for MrtdCombinedRecognizer.
class MrtdCombinedRecognizerResult extends RecognizerResult {
    
    ///Digital signature of the recognition result. Available only if enabled with signResult property. 
    String digitalSignature;
    
    ///Version of the digital signature. Available only if enabled with signResult property. 
    int digitalSignatureVersion;
    
    ///Returns DataMatchResultSuccess if data from scanned parts/sides of the document match,
    /// DataMatchResultFailed otherwise. For example if date of expiry is scanned from the front and back side
    /// of the document and values do not match, this method will return DataMatchResultFailed. Result will
    /// be DataMatchResultSuccess only if scanned values for all fields that are compared are the same. 
    DataMatchResult documentDataMatch;
    
    ///face image from the document if enabled with returnFaceImage property. 
    String faceImage;
    
    ///back side image of the document if enabled with returnFullDocumentImage property. 
    String fullDocumentBackImage;
    
    ///front side image of the document if enabled with returnFullDocumentImage property. 
    String fullDocumentFrontImage;
    
    ///Returns the Data extracted from the machine readable zone. 
    MrzResult mrzResult;
    
    ///Returns true if recognizer has finished scanning first side and is now scanning back side,
    /// false if it's still scanning first side. 
    bool scanningFirstSideDone;
    
    MrtdCombinedRecognizerResult(Map<String, dynamic> nativeResult): super(RecognizerResultState.values[nativeResult['resultState']]) {
        
        this.digitalSignature = nativeResult["digitalSignature"];
        
        this.digitalSignatureVersion = nativeResult["digitalSignatureVersion"];
        
        this.documentDataMatch = DataMatchResult.values[nativeResult["documentDataMatch"]];
        
        this.faceImage = nativeResult["faceImage"];
        
        this.fullDocumentBackImage = nativeResult["fullDocumentBackImage"];
        
        this.fullDocumentFrontImage = nativeResult["fullDocumentFrontImage"];
        
        this.mrzResult = nativeResult["mrzResult"] != null ? MrzResult(Map<String, dynamic>.from(nativeResult["mrzResult"])) : null;
        
        this.scanningFirstSideDone = nativeResult["scanningFirstSideDone"];
        
    }
}


///MRTD Combined recognizer
/// 
/// MRTD Combined recognizer is used for scanning both front and back side of generic IDs.
@JsonSerializable()
class MrtdCombinedRecognizer extends Recognizer {
    
    ///Whether special characters are allowed
    /// 
    /// 
    bool allowSpecialCharacters = false;
    
    ///Whether returning of unparsed results is allowed
    /// 
    /// 
    bool allowUnparsedResults = false;
    
    ///Whether returning of unverified results is allowed
    /// Unverified result is result that is parsed, but check digits are incorrect.
    /// 
    /// 
    bool allowUnverifiedResults = false;
    
    ///Type of document this recognizer will scan.
    /// 
    /// 
    DocumentFaceDetectorType detectorType = DocumentFaceDetectorType.TD1;
    
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
    
    ///Defines how many times the same document should be detected before the detector
    /// returns this document as a result of the deteciton
    /// 
    /// Higher number means more reliable detection, but slower processing
    /// 
    /// 
    int numStableDetectionsThreshold = 6;
    
    ///Sets whether face image from ID card should be extracted
    /// 
    /// 
    bool returnFaceImage = false;
    
    ///Sets whether full document image of ID card should be extracted.
    /// 
    /// 
    bool returnFullDocumentImage = false;
    
    ///Whether or not recognition result should be signed.
    /// 
    /// 
    bool signResult = false;
    
    MrtdCombinedRecognizer(): super('MrtdCombinedRecognizer');

    RecognizerResult createResultFromNative(Map<String, dynamic> nativeResult) {
        return MrtdCombinedRecognizerResult(nativeResult);
    }

    factory MrtdCombinedRecognizer.fromJson(Map<String, dynamic> json) => _$MrtdCombinedRecognizerFromJson(json);

    Map<String, dynamic> toJson() => _$MrtdCombinedRecognizerToJson(this);
}