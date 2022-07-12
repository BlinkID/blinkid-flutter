import '../recognizer.dart';
import '../types.dart';
import 'package:json_annotation/json_annotation.dart';

part 'document_face_recognizer.g.dart';

/// Result object for DocumentFaceRecognizer.
class DocumentFaceRecognizerResult extends RecognizerResult {
    
    ///Quadrangle represeting corner points of the document within the input image. 
    Quadrilateral? documentLocation;
    
    ///face image from the document if enabled with returnFaceImage property. 
    String? faceImage;
    
    ///Quadrangle represeting corner points of the face image within the input image. 
    Quadrilateral? faceLocation;
    
    ///full document image if enabled with returnFullDocumentImage property. 
    String? fullDocumentImage;
    
    DocumentFaceRecognizerResult(Map<String, dynamic> nativeResult): super(RecognizerResultState.values[nativeResult['resultState']]) {
        
        this.documentLocation = nativeResult["documentLocation"] != null ? Quadrilateral(Map<String, dynamic>.from(nativeResult["documentLocation"])) : null;
        
        this.faceImage = nativeResult["faceImage"];
        
        this.faceLocation = nativeResult["faceLocation"] != null ? Quadrilateral(Map<String, dynamic>.from(nativeResult["faceLocation"])) : null;
        
        this.fullDocumentImage = nativeResult["fullDocumentImage"];
        
    }
}


///Class for configuring Document Face Recognizer Recognizer.
/// 
/// Document Face Recognizer recognizer is used for scanning documents containing face images.
@JsonSerializable()
class DocumentFaceRecognizer extends Recognizer {
    
    ///Type of docment this recognizer will scan.
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
    
    DocumentFaceRecognizer(): super('DocumentFaceRecognizer');

    RecognizerResult createResultFromNative(Map<String, dynamic> nativeResult) {
        return DocumentFaceRecognizerResult(nativeResult);
    }

    factory DocumentFaceRecognizer.fromJson(Map<String, dynamic> json) => _$DocumentFaceRecognizerFromJson(json);
    Map<String, dynamic> toJson() => _$DocumentFaceRecognizerToJson(this);
}