// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'success_frame_grabber_recognizer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SuccessFrameGrabberRecognizer _$SuccessFrameGrabberRecognizerFromJson(
    Map<String, dynamic> json) {
  return SuccessFrameGrabberRecognizer(
    json['slaveRecognizer'] == null
        ? null
        : Recognizer.fromJson(json['slaveRecognizer'] as Map<String, dynamic>),
  )..recognizerType = json['recognizerType'] as String;
}

Map<String, dynamic> _$SuccessFrameGrabberRecognizerToJson(
        SuccessFrameGrabberRecognizer instance) =>
    <String, dynamic>{
      'recognizerType': instance.recognizerType,
      'slaveRecognizer': instance.slaveRecognizer,
    };
