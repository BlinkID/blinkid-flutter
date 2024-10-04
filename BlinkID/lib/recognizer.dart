import 'package:json_annotation/json_annotation.dart';

export 'package:blinkid_flutter/recognizers/blink_id_multi_side_recognizer.dart';
export 'package:blinkid_flutter/recognizers/blink_id_single_side_recognizer.dart';
export 'package:blinkid_flutter/recognizers/document_face_recognizer.dart';
export 'package:blinkid_flutter/recognizers/extensions/nationality_alpha_code_extension.dart';
export 'package:blinkid_flutter/recognizers/id_barcode_recognizer.dart';
export 'package:blinkid_flutter/recognizers/mrtd_combined_recognizer.dart';
export 'package:blinkid_flutter/recognizers/mrtd_recognizer.dart';
export 'package:blinkid_flutter/recognizers/passport_recognizer.dart';
export 'package:blinkid_flutter/recognizers/success_frame_grabber_recognizer.dart';
export 'package:blinkid_flutter/recognizers/usdl_combined_recognizer.dart';
export 'package:blinkid_flutter/recognizers/usdl_recognizer.dart';
export 'package:blinkid_flutter/recognizers/visa_recognizer.dart';

part 'recognizer.g.dart';

/// Base class for all recognizers.
/// Recognizer is object that performs recognition of image
/// and updates its result with data extracted from the image.
@JsonSerializable()
class Recognizer {
  Recognizer(this.recognizerType);

  factory Recognizer.fromJson(Map<String, dynamic> json) => _$RecognizerFromJson(json);

  /// Type of recognizer
  String recognizerType;

  RecognizerResult createResultFromNative(Map<String, dynamic> nativeResult) =>
      RecognizerResult(nativeResult['resultState']);
  Map<String, dynamic> toJson() => _$RecognizerToJson(this);
}

/// Possible states of the Recognizer's result
enum RecognizerResultState {
  /// Recognizer result is empty
  @JsonValue(0)
  empty,

  /// Recognizer result contains some values, but is incomplete or it contains all values, but some are uncertain
  @JsonValue(1)
  uncertain,

  /// Recognizer result contains all required values
  @JsonValue(2)
  valid,
  @JsonValue(3)
  stageValid
}

/// Base class for all recognizer's result objects.
/// Recognizer result contains data extracted from the image.
@JsonSerializable()
class RecognizerResult {
  RecognizerResult(this.resultState, {this.nativeResult});

  factory RecognizerResult.fromJson(Map<String, dynamic> json) => _$RecognizerResultFromJson(json);

  /// State of the result. It is always one of the values represented by RecognizerResultState enum
  RecognizerResultState resultState;

  Map<String, dynamic>? nativeResult;

  Map<String, dynamic> toJson() => _$RecognizerResultToJson(this);
}

@JsonSerializable()
class RecognizerCollection {
  RecognizerCollection(this.recognizerArray);

  factory RecognizerCollection.fromJson(Map<String, dynamic> json) => _$RecognizerCollectionFromJson(json);

  List<Recognizer> recognizerArray;

  bool allowMultipleResults = false;

  int milisecondsBeforeTimeout = 10000;
  Map<String, dynamic> toJson() => _$RecognizerCollectionToJson(this);
}
