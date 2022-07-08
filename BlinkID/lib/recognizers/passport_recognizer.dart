import '../recognizer.dart';
import '../types.dart';
import 'package:json_annotation/json_annotation.dart';

part 'passport_recognizer.g.dart';

/// Result object for PassportRecognizer.
class PassportRecognizerResult extends RecognizerResult {
    
    ///face image from the document if enabled with returnFaceImage property. 
    String? faceImage;
    
    ///full document image if enabled with returnFullDocumentImage property. 
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
    
    ///Defines whether to anonymize Netherlands MRZ
    /// 
    /// 
    bool anonymizeNetherlandsMrz = true;
    
    ///Defines if glare detection should be turned on/off.
    /// 
    /// 
    bool detectGlare = true;
    
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
    
    ///Sets whether face image from ID card should be extracted
    /// 
    /// 
    bool returnFaceImage = false;
    
    ///Sets whether full document image of ID card should be extracted.
    /// 
    /// 
    bool returnFullDocumentImage = false;
    
    PassportRecognizer(): super('PassportRecognizer');

    RecognizerResult createResultFromNative(Map<String, dynamic> nativeResult) {
        return PassportRecognizerResult(nativeResult);
    }

    factory PassportRecognizer.fromJson(Map<String, dynamic> json) => _$PassportRecognizerFromJson(json);
    Map<String, dynamic> toJson() => _$PassportRecognizerToJson(this);
}