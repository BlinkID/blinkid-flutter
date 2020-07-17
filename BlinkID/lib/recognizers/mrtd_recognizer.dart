import '../recognizer.dart';
import '../types.dart';
import 'package:json_annotation/json_annotation.dart';

part 'mrtd_recognizer.g.dart';

/// Result object for MrtdRecognizer.
class MrtdRecognizerResult extends RecognizerResult {
    
    ///Image of the full document 
    String fullDocumentImage;
    
    ///The Data extracted from the machine readable zone. 
    MrzResult mrzResult;
    
    MrtdRecognizerResult(Map<String, dynamic> nativeResult): super(RecognizerResultState.values[nativeResult['resultState']]) {
        
        this.fullDocumentImage = nativeResult["fullDocumentImage"];
        
        this.mrzResult = nativeResult["mrzResult"] != null ? MrzResult(Map<String, dynamic>.from(nativeResult["mrzResult"])) : null;
        
    }
}


///Recognizer that can recognize Machine Readable Zone (MRZ) of the Machine Readable Travel Document (MRTD)
@JsonSerializable()
class MrtdRecognizer extends Recognizer {
    
    ///Whether special characters are allowed.
    bool allowSpecialCharacters = false;
    
    ///Whether returning of unparsed results is allowed.
    bool allowUnparsedResults = false;
    
    ///Whether returning of unverified results is allowed.
    bool allowUnverifiedResults = false;
    
    ///Defines whether glare detector is enabled.
    bool detectGlare = true;
    
    ///The DPI (Dots Per Inch) for full document image that should be returned.
    int fullDocumentImageDpi = 250;
    
    ///The extension factors for full document image.
    ImageExtensionFactors fullDocumentImageExtensionFactors = ImageExtensionFactors();
    
    ///Defines whether full document image will be available in
    bool returnFullDocumentImage = false;
    
    MrtdRecognizer(): super('MrtdRecognizer');

    RecognizerResult createResultFromNative(Map<String, dynamic> nativeResult) {
        return MrtdRecognizerResult(nativeResult);
    }

    factory MrtdRecognizer.fromJson(Map<String, dynamic> json) => _$MrtdRecognizerFromJson(json);

    Map<String, dynamic> toJson() => _$MrtdRecognizerToJson(this);
}