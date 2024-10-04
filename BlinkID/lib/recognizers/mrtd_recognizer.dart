import 'package:json_annotation/json_annotation.dart';

import '../recognizer.dart';
import '../types.dart';

part 'mrtd_recognizer.g.dart';

/// Result object for MrtdRecognizer.
class MrtdRecognizerResult extends RecognizerResult {
  ///full document image if enabled with returnFullDocumentImage property.
  String? fullDocumentImage;

  ///Returns the Data extracted from the machine readable zone.
  MrzResult? mrzResult;

  MrtdRecognizerResult(Map<String, dynamic> nativeResult)
      : super(RecognizerResultState.values[nativeResult['resultState']], nativeResult: nativeResult) {
    this.fullDocumentImage = nativeResult["fullDocumentImage"];

    this.mrzResult =
        nativeResult["mrzResult"] != null ? MrzResult(Map<String, dynamic>.from(nativeResult["mrzResult"])) : null;
  }
}

///Recognizer that can recognizer Machine Readable Zone (MRZ) of the Machine Readable Travel Document (MRTD)
@JsonSerializable()
class MrtdRecognizer extends Recognizer {
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

  ///Defines if glare detection should be turned on/off.
  ///
  ///

  bool detectGlare = true;

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

  ///Sets whether full document image of ID card should be extracted.
  ///
  ///

  bool returnFullDocumentImage = false;

  MrtdRecognizer() : super('MrtdRecognizer');

  RecognizerResult createResultFromNative(Map<String, dynamic> nativeResult) {
    return MrtdRecognizerResult(nativeResult);
  }

  factory MrtdRecognizer.fromJson(Map<String, dynamic> json) => _$MrtdRecognizerFromJson(json);
  Map<String, dynamic> toJson() => _$MrtdRecognizerToJson(this);
}
