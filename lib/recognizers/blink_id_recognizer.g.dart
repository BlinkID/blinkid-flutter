// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blink_id_recognizer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BlinkIdRecognizer _$BlinkIdRecognizerFromJson(Map<String, dynamic> json) {
  return BlinkIdRecognizer()
    ..recognizerType = json['recognizerType'] as String
    ..allowBlurFilter = json['allowBlurFilter'] as bool
    ..allowUnparsedMrzResults = json['allowUnparsedMrzResults'] as bool
    ..allowUnverifiedMrzResults = json['allowUnverifiedMrzResults'] as bool
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
    ..returnFullDocumentImage = json['returnFullDocumentImage'] as bool;
}

Map<String, dynamic> _$BlinkIdRecognizerToJson(BlinkIdRecognizer instance) =>
    <String, dynamic>{
      'recognizerType': instance.recognizerType,
      'allowBlurFilter': instance.allowBlurFilter,
      'allowUnparsedMrzResults': instance.allowUnparsedMrzResults,
      'allowUnverifiedMrzResults': instance.allowUnverifiedMrzResults,
      'faceImageDpi': instance.faceImageDpi,
      'fullDocumentImageDpi': instance.fullDocumentImageDpi,
      'fullDocumentImageExtensionFactors':
          instance.fullDocumentImageExtensionFactors,
      'paddingEdge': instance.paddingEdge,
      'returnFaceImage': instance.returnFaceImage,
      'returnFullDocumentImage': instance.returnFullDocumentImage,
    };
