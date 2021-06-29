// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'document_face_recognizer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DocumentFaceRecognizer _$DocumentFaceRecognizerFromJson(
    Map<String, dynamic> json) {
  return DocumentFaceRecognizer()
    ..recognizerType = json['recognizerType'] as String
    ..detectorType =
        _$enumDecode(_$DocumentFaceDetectorTypeEnumMap, json['detectorType'])
    ..faceImageDpi = json['faceImageDpi'] as int
    ..fullDocumentImageDpi = json['fullDocumentImageDpi'] as int
    ..fullDocumentImageExtensionFactors = ImageExtensionFactors.fromJson(
        json['fullDocumentImageExtensionFactors'] as Map<String, dynamic>)
    ..numStableDetectionsThreshold = json['numStableDetectionsThreshold'] as int
    ..returnFaceImage = json['returnFaceImage'] as bool
    ..returnFullDocumentImage = json['returnFullDocumentImage'] as bool;
}

Map<String, dynamic> _$DocumentFaceRecognizerToJson(
        DocumentFaceRecognizer instance) =>
    <String, dynamic>{
      'recognizerType': instance.recognizerType,
      'detectorType': _$DocumentFaceDetectorTypeEnumMap[instance.detectorType],
      'faceImageDpi': instance.faceImageDpi,
      'fullDocumentImageDpi': instance.fullDocumentImageDpi,
      'fullDocumentImageExtensionFactors':
          instance.fullDocumentImageExtensionFactors,
      'numStableDetectionsThreshold': instance.numStableDetectionsThreshold,
      'returnFaceImage': instance.returnFaceImage,
      'returnFullDocumentImage': instance.returnFullDocumentImage,
    };

K _$enumDecode<K, V>(
  Map<K, V> enumValues,
  Object? source, {
  K? unknownValue,
}) {
  if (source == null) {
    throw ArgumentError(
      'A value must be provided. Supported values: '
      '${enumValues.values.join(', ')}',
    );
  }

  return enumValues.entries.singleWhere(
    (e) => e.value == source,
    orElse: () {
      if (unknownValue == null) {
        throw ArgumentError(
          '`$source` is not one of the supported values: '
          '${enumValues.values.join(', ')}',
        );
      }
      return MapEntry(unknownValue, enumValues.values.first);
    },
  ).key;
}

const _$DocumentFaceDetectorTypeEnumMap = {
  DocumentFaceDetectorType.TD1: 1,
  DocumentFaceDetectorType.TD2: 2,
  DocumentFaceDetectorType.PassportsAndVisas: 3,
};
