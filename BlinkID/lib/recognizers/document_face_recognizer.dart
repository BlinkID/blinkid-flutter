import '../recognizer.dart';
import '../types.dart';
import 'package:json_annotation/json_annotation.dart';

part 'document_face_recognizer.g.dart';

/// Result object for DocumentFaceRecognizer.
class DocumentFaceRecognizerResult extends RecognizerResult {
    
    ///The location of document detection in coordinate system of full input frame. 
    Quadrilateral documentLocation;
    
    ///Face image from the document 
    String faceImage;
    
    ///The location of face detection in coordinate system of cropped full document image. 
    Quadrilateral faceLocation;
    
    ///Image of the full document 
    String fullDocumentImage;
    
    DocumentFaceRecognizerResult(Map<String, dynamic> nativeResult): super(RecognizerResultState.values[nativeResult['resultState']]) {
        
        this.documentLocation = nativeResult["documentLocation"] != null ? Quadrilateral(Map<String, dynamic>.from(nativeResult["documentLocation"])) : null;
        
        this.faceImage = nativeResult["faceImage"];
        
        this.faceLocation = nativeResult["faceLocation"] != null ? Quadrilateral(Map<String, dynamic>.from(nativeResult["faceLocation"])) : null;
        
        this.fullDocumentImage = nativeResult["fullDocumentImage"];
        
    }
}


///Recognizer for detecting holder's photo on documents containing image.
@JsonSerializable()
class DocumentFaceRecognizer extends Recognizer {
    
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
    
    DocumentFaceRecognizer(): super('DocumentFaceRecognizer');

    RecognizerResult createResultFromNative(Map<String, dynamic> nativeResult) {
        return DocumentFaceRecognizerResult(nativeResult);
    }

    factory DocumentFaceRecognizer.fromJson(Map<String, dynamic> json) => _$DocumentFaceRecognizerFromJson(json);

    Map<String, dynamic> toJson() => _$DocumentFaceRecognizerToJson(this);
}