// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'document_face_recognizer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DocumentFaceRecognizer _$DocumentFaceRecognizerFromJson(
        Map<String, dynamic> json) =>
    DocumentFaceRecognizer()
      ..recognizerType = json['recognizerType'] as String
      ..detectorType =
          $enumDecode(_$DocumentFaceDetectorTypeEnumMap, json['detectorType'])
      ..faceImageDpi = json['faceImageDpi'] as int
      ..fullDocumentImageDpi = json['fullDocumentImageDpi'] as int
      ..fullDocumentImageExtensionFactors = ImageExtensionFactors.fromJson(
          json['fullDocumentImageExtensionFactors'] as Map<String, dynamic>)
      ..numStableDetectionsThreshold =
          json['numStableDetectionsThreshold'] as int
      ..returnFaceImage = json['returnFaceImage'] as bool
      ..returnFullDocumentImage = json['returnFullDocumentImage'] as bool;

Map<String, dynamic> _$DocumentFaceRecognizerToJson(
        DocumentFaceRecognizer instance) =>
    <String, dynamic>{
      'recognizerType': instance.recognizerType,
      'detectorType': _$DocumentFaceDetectorTypeEnumMap[instance.detectorType]!,
      'faceImageDpi': instance.faceImageDpi,
      'fullDocumentImageDpi': instance.fullDocumentImageDpi,
      'fullDocumentImageExtensionFactors':
          instance.fullDocumentImageExtensionFactors.toJson(),
      'numStableDetectionsThreshold': instance.numStableDetectionsThreshold,
      'returnFaceImage': instance.returnFaceImage,
      'returnFullDocumentImage': instance.returnFullDocumentImage,
    };

const _$DocumentFaceDetectorTypeEnumMap = {
  DocumentFaceDetectorType.TD1: 0,
  DocumentFaceDetectorType.TD2: 1,
  DocumentFaceDetectorType.PassportsAndVisas: 2,
};
