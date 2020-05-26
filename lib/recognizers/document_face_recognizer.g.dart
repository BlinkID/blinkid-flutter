// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'document_face_recognizer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DocumentFaceRecognizer _$DocumentFaceRecognizerFromJson(
    Map<String, dynamic> json) {
  return DocumentFaceRecognizer()
    ..recognizerType = json['recognizerType'] as String
    ..detectorType = _$enumDecodeNullable(
        _$DocumentFaceDetectorTypeEnumMap, json['detectorType'])
    ..faceImageDpi = json['faceImageDpi'] as int
    ..fullDocumentImageDpi = json['fullDocumentImageDpi'] as int
    ..fullDocumentImageExtensionFactors =
        json['fullDocumentImageExtensionFactors'] == null
            ? null
            : ImageExtensionFactors.fromJson(
                json['fullDocumentImageExtensionFactors']
                    as Map<String, dynamic>)
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

T _$enumDecode<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }

  final value = enumValues.entries
      .singleWhere((e) => e.value == source, orElse: () => null)
      ?.key;

  if (value == null && unknownValue == null) {
    throw ArgumentError('`$source` is not one of the supported values: '
        '${enumValues.values.join(', ')}');
  }
  return value ?? unknownValue;
}

T _$enumDecodeNullable<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<T>(enumValues, source, unknownValue: unknownValue);
}

const _$DocumentFaceDetectorTypeEnumMap = {
  DocumentFaceDetectorType.TD1: 'TD1',
  DocumentFaceDetectorType.TD2: 'TD2',
  DocumentFaceDetectorType.PassportsAndVisas: 'PassportsAndVisas',
};
