import 'package:blinkid_flutter/recognizer.dart';
import 'package:json_annotation/json_annotation.dart';

part 'success_frame_grabber_recognizer.g.dart';

/// Result object for SuccessFrameGrabberRecognizer.
class SuccessFrameGrabberRecognizerResult extends RecognizerResult {
  SuccessFrameGrabberRecognizerResult(Map<String, dynamic> nativeResult, this.slaveRecognizerResult)
      : super(RecognizerResultState.values[nativeResult['resultState']]) {
    /// Camera frame at the time slave recognizer finished recognition
    successFrame = nativeResult['successFrame'];
  }

  /// Camera frame at the time slave recognizer finished recognition
  String? successFrame;

  /// RecognizerResult of the slave recognizer
  RecognizerResult slaveRecognizerResult;
}

/// SuccessFrameGrabberRecognizer can wrap any other recognizer and obtain camera
/// frame on which the other recognizer finished recognition.
@JsonSerializable()
class SuccessFrameGrabberRecognizer extends Recognizer {
  SuccessFrameGrabberRecognizer(this.slaveRecognizer) : super('SuccessFrameGrabberRecognizer') {
    if (slaveRecognizer is! Recognizer) {
      throw Exception('Slave recognizer must be Recognizer!');
    }
  }

  factory SuccessFrameGrabberRecognizer.fromJson(Map<String, dynamic> json) =>
      _$SuccessFrameGrabberRecognizerFromJson(json);
  Recognizer slaveRecognizer;

  @override
  RecognizerResult createResultFromNative(Map<String, dynamic> nativeResult) => SuccessFrameGrabberRecognizerResult(
        nativeResult,
        slaveRecognizer.createResultFromNative(Map<String, dynamic>.from(nativeResult['slaveRecognizerResult'])),
      );
  @override
  Map<String, dynamic> toJson() => _$SuccessFrameGrabberRecognizerToJson(this);
}
