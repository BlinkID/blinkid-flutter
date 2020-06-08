// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'passport_recognizer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PassportRecognizer _$PassportRecognizerFromJson(Map<String, dynamic> json) {
  return PassportRecognizer()
    ..recognizerType = json['recognizerType'] as String
    ..anonymizeNetherlandsMrz = json['anonymizeNetherlandsMrz'] as bool
    ..detectGlare = json['detectGlare'] as bool
    ..faceImageDpi = json['faceImageDpi'] as int
    ..fullDocumentImageDpi = json['fullDocumentImageDpi'] as int
    ..fullDocumentImageExtensionFactors =
        json['fullDocumentImageExtensionFactors'] == null
            ? null
            : ImageExtensionFactors.fromJson(
                json['fullDocumentImageExtensionFactors']
                    as Map<String, dynamic>)
    ..returnFaceImage = json['returnFaceImage'] as bool
    ..returnFullDocumentImage = json['returnFullDocumentImage'] as bool
    ..signResult = json['signResult'] as bool;
}

Map<String, dynamic> _$PassportRecognizerToJson(PassportRecognizer instance) =>
    <String, dynamic>{
      'recognizerType': instance.recognizerType,
      'anonymizeNetherlandsMrz': instance.anonymizeNetherlandsMrz,
      'detectGlare': instance.detectGlare,
      'faceImageDpi': instance.faceImageDpi,
      'fullDocumentImageDpi': instance.fullDocumentImageDpi,
      'fullDocumentImageExtensionFactors':
          instance.fullDocumentImageExtensionFactors,
      'returnFaceImage': instance.returnFaceImage,
      'returnFullDocumentImage': instance.returnFullDocumentImage,
      'signResult': instance.signResult,
    };
