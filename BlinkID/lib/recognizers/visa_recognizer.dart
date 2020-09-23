import '../recognizer.dart';
import '../types.dart';
import 'package:json_annotation/json_annotation.dart';

part 'visa_recognizer.g.dart';

/// Result object for VisaRecognizer.
class VisaRecognizerResult extends RecognizerResult {
    
    ///Face image from the document 
    String faceImage;
    
    ///Image of the full document 
    String fullDocumentImage;
    
    ///The data extracted from the machine readable zone. 
    MrzResult mrzResult;
    
    VisaRecognizerResult(Map<String, dynamic> nativeResult): super(RecognizerResultState.values[nativeResult['resultState']]) {
        
        this.faceImage = nativeResult["faceImage"];
        
        this.fullDocumentImage = nativeResult["fullDocumentImage"];
        
        this.mrzResult = nativeResult["mrzResult"] != null ? MrzResult(Map<String, dynamic>.from(nativeResult["mrzResult"])) : null;
        
    }
}


///Recognizer which can scan all visas with MRZ.
@JsonSerializable()
class VisaRecognizer extends Recognizer {
    
    ///Defines whether glare detector is enabled.
    bool detectGlare = true;
    
    ///The DPI (Dots Per Inch) for face image that should be returned.
    int faceImageDpi = 250;
    
    ///The DPI (Dots Per Inch) for full document image that should be returned.
    int fullDocumentImageDpi = 250;
    
    ///The extension factors for full document image.
    ImageExtensionFactors fullDocumentImageExtensionFactors = ImageExtensionFactors();
    
    ///Defines whether face image will be available in result.
    bool returnFaceImage = false;
    
    ///Defines whether full document image will be available in
    bool returnFullDocumentImage = false;
    
    VisaRecognizer(): super('VisaRecognizer');

    RecognizerResult createResultFromNative(Map<String, dynamic> nativeResult) {
        return VisaRecognizerResult(nativeResult);
    }

    factory VisaRecognizer.fromJson(Map<String, dynamic> json) => _$VisaRecognizerFromJson(json);

    Map<String, dynamic> toJson() => _$VisaRecognizerToJson(this);
}