// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blink_id_combined_recognizer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BlinkIdCombinedRecognizer _$BlinkIdCombinedRecognizerFromJson(
    Map<String, dynamic> json) {
  return BlinkIdCombinedRecognizer()
    ..recognizerType = json['recognizerType'] as String
    ..allowBlurFilter = json['allowBlurFilter'] as bool
    ..allowUnparsedMrzResults = json['allowUnparsedMrzResults'] as bool
    ..allowUnverifiedMrzResults = json['allowUnverifiedMrzResults'] as bool
    ..anonymizeImage = json['anonymizeImage'] as bool
    ..faceImageDpi = json['faceImageDpi'] as int
    ..fullDocumentImageDpi = json['fullDocumentImageDpi'] as int
    ..fullDocumentImageExtensionFactors =
        json['fullDocumentImageExtensionFactors'] == null
            ? null
            : ImageExtensionFactors.fromJson(
                json['fullDocumentImageExtensionFactors']
                    as Map<String, dynamic>)
    ..paddingEdge = (json['paddingEdge'] as num)?.toDouble()
    ..returnFaceImage = json['returnFaceImage'] as bool
    ..returnFullDocumentImage = json['returnFullDocumentImage'] as bool
    ..signResult = json['signResult'] as bool
    ..skipUnsupportedBack = json['skipUnsupportedBack'] as bool
    ..validateResultCharacters = json['validateResultCharacters'] as bool;
}

Map<String, dynamic> _$BlinkIdCombinedRecognizerToJson(
        BlinkIdCombinedRecognizer instance) =>
    <String, dynamic>{
      'recognizerType': instance.recognizerType,
      'allowBlurFilter': instance.allowBlurFilter,
      'allowUnparsedMrzResults': instance.allowUnparsedMrzResults,
      'allowUnverifiedMrzResults': instance.allowUnverifiedMrzResults,
      'anonymizeImage': instance.anonymizeImage,
      'faceImageDpi': instance.faceImageDpi,
      'fullDocumentImageDpi': instance.fullDocumentImageDpi,
      'fullDocumentImageExtensionFactors':
          instance.fullDocumentImageExtensionFactors,
      'paddingEdge': instance.paddingEdge,
      'returnFaceImage': instance.returnFaceImage,
      'returnFullDocumentImage': instance.returnFullDocumentImage,
      'signResult': instance.signResult,
      'skipUnsupportedBack': instance.skipUnsupportedBack,
      'validateResultCharacters': instance.validateResultCharacters,
    };
