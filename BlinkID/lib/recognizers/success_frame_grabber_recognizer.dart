import '../recognizer.dart';
import 'package:json_annotation/json_annotation.dart';

part 'success_frame_grabber_recognizer.g.dart';

/// Result object for SuccessFrameGrabberRecognizer.
class SuccessFrameGrabberRecognizerResult extends RecognizerResult {
  /// Camera frame at the time slave recognizer finished recognition
  String? successFrame;

  /// RecognizerResult of the slave recognizer
  RecognizerResult slaveRecognizerResult;

  SuccessFrameGrabberRecognizerResult(
      Map<String, dynamic> nativeResult, this.slaveRecognizerResult)
      : super(RecognizerResultState.values[nativeResult['resultState']]) {
    /// Camera frame at the time slave recognizer finished recognition
    this.successFrame = nativeResult['successFrame'];
  }
}

/// SuccessFrameGrabberRecognizer can wrap any other recognizer and obtain camera
/// frame on which the other recognizer finished recognition.
@JsonSerializable()
class SuccessFrameGrabberRecognizer extends Recognizer {
  Recognizer slaveRecognizer;

  SuccessFrameGrabberRecognizer(this.slaveRecognizer)
      : super('SuccessFrameGrabberRecognizer') {
    if (!(this.slaveRecognizer is Recognizer)) {
      throw Exception("Slave recognizer must be Recognizer!");
    }
  }

  RecognizerResult createResultFromNative(Map<String, dynamic> nativeResult) {
    return SuccessFrameGrabberRecognizerResult(
        nativeResult,
        this.slaveRecognizer.createResultFromNative(
            Map<String, dynamic>.from(nativeResult['slaveRecognizerResult'])));
  }

  factory SuccessFrameGrabberRecognizer.fromJson(Map<String, dynamic> json) =>
      _$SuccessFrameGrabberRecognizerFromJson(json);
  Map<String, dynamic> toJson() => _$SuccessFrameGrabberRecognizerToJson(this);
}
