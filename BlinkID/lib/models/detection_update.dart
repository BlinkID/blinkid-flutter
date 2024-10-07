import 'package:json_annotation/json_annotation.dart';

part 'detection_update.g.dart';

enum DetectionStatus {
  @JsonValue('FAILED')
  Failed,

  @JsonValue('SUCCESS')
  Success,

  @JsonValue('CAMERA_TOO_FAR')
  CameraTooFar,

  @JsonValue('FALLBACK_SUCCESS')
  FallbackSuccess,

  @JsonValue('DOCUMENT_PARTIALLY_VISIBLE')
  DocumentPartiallyVisible,

  @JsonValue('CAMERA_ANGLE_TOO_STEEP')
  CameraAngleTooSteep,

  @JsonValue('CAMERA_TOO_CLOSE')
  CameraTooClose,

  @JsonValue('DOCUMENT_TOO_CLOSE_TO_CAMERA_EDGE')
  DocumentTooCloseToCameraEdge,
}

@JsonSerializable()
class DetectionUpdate {
  final DetectionStatus status;

  DetectionUpdate(this.status);

  factory DetectionUpdate.fromJson(Map<String, dynamic> json) => _$DetectionUpdateFromJson(json);

  Map<String, dynamic> toJson() => _$DetectionUpdateToJson(this);
}
