import '../recognizer.dart';
import '../types.dart';
import 'package:json_annotation/json_annotation.dart';

part 'visa_recognizer.g.dart';

/// Result object for VisaRecognizer.
class VisaRecognizerResult extends RecognizerResult {
    
    ///face image from the document if enabled with returnFaceImage property. 
    String? faceImage;
    
    ///full document image if enabled with returnFullDocumentImage property. 
    String? fullDocumentImage;
    
    ///The data extracted from the machine readable zone. 
    MrzResult? mrzResult;
    
    VisaRecognizerResult(Map<String, dynamic> nativeResult): super(RecognizerResultState.values[nativeResult['resultState']]) {
        
        this.faceImage = nativeResult["faceImage"];
        
        this.fullDocumentImage = nativeResult["fullDocumentImage"];
        
        this.mrzResult = nativeResult["mrzResult"] != null ? MrzResult(Map<String, dynamic>.from(nativeResult["mrzResult"])) : null;
        
    }
}


///Recognizer which can scan all visas with MRZ.
@JsonSerializable()
class VisaRecognizer extends Recognizer {
    
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
    
    VisaRecognizer(): super('VisaRecognizer');

    RecognizerResult createResultFromNative(Map<String, dynamic> nativeResult) {
        return VisaRecognizerResult(nativeResult);
    }

    factory VisaRecognizer.fromJson(Map<String, dynamic> json) => _$VisaRecognizerFromJson(json);
    Map<String, dynamic> toJson() => _$VisaRecognizerToJson(this);
}