import '../recognizer.dart';
import '../types.dart';
import 'package:json_annotation/json_annotation.dart';

part 'passport_recognizer.g.dart';

/// Result object for PassportRecognizer.
class PassportRecognizerResult extends RecognizerResult {
    
    ///Face image from the document
    String? faceImage;
    
    ///Image of the full document
    String? fullDocumentImage;
    
    ///The data extracted from the machine readable zone.
    MrzResult? mrzResult;
    
    PassportRecognizerResult(Map<String, dynamic> nativeResult): super(RecognizerResultState.values[nativeResult['resultState']]) {
        
        this.faceImage = nativeResult["faceImage"];
        
        this.fullDocumentImage = nativeResult["fullDocumentImage"];
        
        this.mrzResult = nativeResult["mrzResult"] != null ? MrzResult(Map<String, dynamic>.from(nativeResult["mrzResult"])) : null;
        
    }
}


///Recognizer which can scan all passports with MRZ.
@JsonSerializable()
class PassportRecognizer extends Recognizer {
    
    ///Defines whether the Netherlands MRZ should be anonymized.

    bool anonymizeNetherlandsMrz = true;
    
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
    
    PassportRecognizer(): super('PassportRecognizer');

    RecognizerResult createResultFromNative(Map<String, dynamic> nativeResult) {
        return PassportRecognizerResult(nativeResult);
    }

    factory PassportRecognizer.fromJson(Map<String, dynamic> json) => _$PassportRecognizerFromJson(json);
    Map<String, dynamic> toJson() => _$PassportRecognizerToJson(this);
}