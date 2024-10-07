// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detection_update.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DetectionUpdate _$DetectionUpdateFromJson(Map<String, dynamic> json) =>
    DetectionUpdate(
      $enumDecode(_$DetectionStatusEnumMap, json['status']),
    );

Map<String, dynamic> _$DetectionUpdateToJson(DetectionUpdate instance) =>
    <String, dynamic>{
      'status': _$DetectionStatusEnumMap[instance.status]!,
    };

const _$DetectionStatusEnumMap = {
  DetectionStatus.Failed: 'FAILED',
  DetectionStatus.Success: 'SUCCESS',
  DetectionStatus.CameraTooFar: 'CAMERA_TOO_FAR',
  DetectionStatus.FallbackSuccess: 'FALLBACK_SUCCESS',
  DetectionStatus.DocumentPartiallyVisible: 'DOCUMENT_PARTIALLY_VISIBLE',
  DetectionStatus.CameraAngleTooSteep: 'CAMERA_ANGLE_TOO_STEEP',
  DetectionStatus.CameraTooClose: 'CAMERA_TOO_CLOSE',
  DetectionStatus.DocumentTooCloseToCameraEdge:
      'DOCUMENT_TOO_CLOSE_TO_CAMERA_EDGE',
};
