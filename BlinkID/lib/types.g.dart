// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'types.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecognitionModeFilter _$RecognitionModeFilterFromJson(
    Map<String, dynamic> json) {
  return RecognitionModeFilter()
    ..enableMrzId = json['enableMrzId'] as bool
    ..enableMrzVisa = json['enableMrzVisa'] as bool
    ..enableMrzPassport = json['enableMrzPassport'] as bool
    ..enablePhotoId = json['enablePhotoId'] as bool
    ..enableBarcodeId = json['enableBarcodeId'] as bool
    ..enableFullDocumentRecognition =
        json['enableFullDocumentRecognition'] as bool;
}

Map<String, dynamic> _$RecognitionModeFilterToJson(
        RecognitionModeFilter instance) =>
    <String, dynamic>{
      'enableMrzId': instance.enableMrzId,
      'enableMrzVisa': instance.enableMrzVisa,
      'enableMrzPassport': instance.enableMrzPassport,
      'enablePhotoId': instance.enablePhotoId,
      'enableBarcodeId': instance.enableBarcodeId,
      'enableFullDocumentRecognition': instance.enableFullDocumentRecognition,
    };

ImageExtensionFactors _$ImageExtensionFactorsFromJson(
    Map<String, dynamic> json) {
  return ImageExtensionFactors()
    ..upFactor = (json['upFactor'] as num?)?.toDouble()
    ..rightFactor = (json['rightFactor'] as num?)?.toDouble()
    ..downFactor = (json['downFactor'] as num?)?.toDouble()
    ..leftFactor = (json['leftFactor'] as num?)?.toDouble();
}

Map<String, dynamic> _$ImageExtensionFactorsToJson(
        ImageExtensionFactors instance) =>
    <String, dynamic>{
      'upFactor': instance.upFactor,
      'rightFactor': instance.rightFactor,
      'downFactor': instance.downFactor,
      'leftFactor': instance.leftFactor,
    };

DetectionStatusUpdate _$DetectionStatusUpdateFromJson(
    Map<String, dynamic> json) {
  return DetectionStatusUpdate(
    _$enumDecode(_$DetectionStatusEnumMap, json['detectionStatus']),
  );
}

Map<String, dynamic> _$DetectionStatusUpdateToJson(
        DetectionStatusUpdate instance) =>
    <String, dynamic>{
      'detectionStatus': _$DetectionStatusEnumMap[instance.detectionStatus],
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

const _$DetectionStatusEnumMap = {
  DetectionStatus.Fail: 'FAIL',
  DetectionStatus.Success: 'SUCCESS',
  DetectionStatus.CameraTooHigh: 'CAMERA_TOO_HIGH',
  DetectionStatus.FallbackSuccess: 'FALLBACK_SUCCESS',
  DetectionStatus.PartialObject: 'PARTIAL_OBJECT',
  DetectionStatus.CameraAtAngle: 'CAMERA_AT_ANGLE',
  DetectionStatus.CameraTooNear: 'CAMERA_TOO_NEAR',
  DetectionStatus.DocumentTooCloseToEdge: 'DOCUMENT_TOO_CLOSE_TO_EDGE',
};
