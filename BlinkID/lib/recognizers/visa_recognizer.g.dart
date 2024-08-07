// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'visa_recognizer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VisaRecognizer _$VisaRecognizerFromJson(Map<String, dynamic> json) =>
    VisaRecognizer()
      ..recognizerType = json['recognizerType'] as String
      ..detectGlare = json['detectGlare'] as bool
      ..faceImageDpi = (json['faceImageDpi'] as num).toInt()
      ..fullDocumentImageDpi = (json['fullDocumentImageDpi'] as num).toInt()
      ..fullDocumentImageExtensionFactors = ImageExtensionFactors.fromJson(
          json['fullDocumentImageExtensionFactors'] as Map<String, dynamic>)
      ..returnFaceImage = json['returnFaceImage'] as bool
      ..returnFullDocumentImage = json['returnFullDocumentImage'] as bool;

Map<String, dynamic> _$VisaRecognizerToJson(VisaRecognizer instance) =>
    <String, dynamic>{
      'recognizerType': instance.recognizerType,
      'detectGlare': instance.detectGlare,
      'faceImageDpi': instance.faceImageDpi,
      'fullDocumentImageDpi': instance.fullDocumentImageDpi,
      'fullDocumentImageExtensionFactors':
          instance.fullDocumentImageExtensionFactors,
      'returnFaceImage': instance.returnFaceImage,
      'returnFullDocumentImage': instance.returnFullDocumentImage,
    };
