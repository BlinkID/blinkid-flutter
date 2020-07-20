import 'package:json_annotation/json_annotation.dart';

export 'package:blinkid_flutter/recognizers/success_frame_grabber_recognizer.dart';
export 'package:blinkid_flutter/recognizers/blink_id_combined_recognizer.dart';
export 'package:blinkid_flutter/recognizers/blink_id_recognizer.dart';
export 'package:blinkid_flutter/recognizers/document_face_recognizer.dart';
export 'package:blinkid_flutter/recognizers/id_barcode_recognizer.dart';
export 'package:blinkid_flutter/recognizers/mrtd_combined_recognizer.dart';
export 'package:blinkid_flutter/recognizers/mrtd_recognizer.dart';
export 'package:blinkid_flutter/recognizers/passport_recognizer.dart';
export 'package:blinkid_flutter/recognizers/visa_recognizer.dart';
export 'package:blinkid_flutter/recognizers/usdl_recognizer.dart';
export 'package:blinkid_flutter/recognizers/usdl_combined_recognizer.dart';

part 'recognizer.g.dart';

/// Base class for all recognizers.
/// Recognizer is object that performs recognition of image
/// and updates its result with data extracted from the image.
@JsonSerializable()
class Recognizer {
  /// Type of recognizer
  String recognizerType;

  Recognizer(String recognizerType) {
    this.recognizerType = recognizerType;
  }

  RecognizerResult createResultFromNative(Map<String, dynamic> nativeResult) {}

  factory Recognizer.fromJson(Map<String, dynamic> json) =>
      _$RecognizerFromJson(json);

  Map<String, dynamic> toJson() => _$RecognizerToJson(this);
}

/// Possible states of the Recognizer's result
enum RecognizerResultState {
  /// Recognizer result is empty
  empty,

  /// Recognizer result contains some values, but is incomplete or it contains all values, but some are uncertain
  uncertain,

  /// Recognizer result contains all required values
  valid
}

/// Base class for all recognizer's result objects.
/// Recognizer result contains data extracted from the image.
@JsonSerializable()
class RecognizerResult {
  /// State of the result. It is always one of the values represented by RecognizerResultState enum
  RecognizerResultState resultState;

  RecognizerResult(RecognizerResultState resultState) {
    this.resultState = resultState;
  }

  factory RecognizerResult.fromJson(Map<String, dynamic> json) =>
      _$RecognizerResultFromJson(json);

  Map<String, dynamic> toJson() => _$RecognizerResultToJson(this);
}

@JsonSerializable()
class RecognizerCollection {
  List<Recognizer> recognizerArray;

  bool allowMultipleResults = false;

  int milisecondsBeforeTimeout = 10000;

  RecognizerCollection(List<Recognizer> recognizerArray) {
    this.recognizerArray = recognizerArray;
  }

  factory RecognizerCollection.fromJson(Map<String, dynamic> json) =>
      _$RecognizerCollectionFromJson(json);

  Map<String, dynamic> toJson() => _$RecognizerCollectionToJson(this);
}
