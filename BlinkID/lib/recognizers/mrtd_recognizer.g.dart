// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mrtd_recognizer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MrtdRecognizer _$MrtdRecognizerFromJson(Map<String, dynamic> json) =>
    MrtdRecognizer()
      ..recognizerType = json['recognizerType'] as String
      ..allowSpecialCharacters = json['allowSpecialCharacters'] as bool
      ..allowUnparsedResults = json['allowUnparsedResults'] as bool
      ..allowUnverifiedResults = json['allowUnverifiedResults'] as bool
      ..detectGlare = json['detectGlare'] as bool
      ..fullDocumentImageDpi = json['fullDocumentImageDpi'] as int
      ..fullDocumentImageExtensionFactors = ImageExtensionFactors.fromJson(
          json['fullDocumentImageExtensionFactors'] as Map<String, dynamic>)
      ..returnFullDocumentImage = json['returnFullDocumentImage'] as bool;

Map<String, dynamic> _$MrtdRecognizerToJson(MrtdRecognizer instance) =>
    <String, dynamic>{
      'recognizerType': instance.recognizerType,
      'allowSpecialCharacters': instance.allowSpecialCharacters,
      'allowUnparsedResults': instance.allowUnparsedResults,
      'allowUnverifiedResults': instance.allowUnverifiedResults,
      'detectGlare': instance.detectGlare,
      'fullDocumentImageDpi': instance.fullDocumentImageDpi,
      'fullDocumentImageExtensionFactors':
          instance.fullDocumentImageExtensionFactors.toJson(),
      'returnFullDocumentImage': instance.returnFullDocumentImage,
    };
