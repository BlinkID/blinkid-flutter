// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blink_id_combined_recognizer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BlinkIdCombinedRecognizer _$BlinkIdCombinedRecognizerFromJson(
    Map<String, dynamic> json) {
  return BlinkIdCombinedRecognizer()
    ..recognizerType = json['recognizerType'] as String
    ..allowBlurFilter = json['allowBlurFilter'] as bool
    ..allowUncertainFrontSideScan = json['allowUncertainFrontSideScan'] as bool
    ..allowUnparsedMrzResults = json['allowUnparsedMrzResults'] as bool
    ..allowUnverifiedMrzResults = json['allowUnverifiedMrzResults'] as bool
    ..anonymizationMode =
        _$enumDecode(_$AnonymizationModeEnumMap, json['anonymizationMode'])
    ..faceImageDpi = json['faceImageDpi'] as int
    ..fullDocumentImageDpi = json['fullDocumentImageDpi'] as int
    ..fullDocumentImageExtensionFactors = ImageExtensionFactors.fromJson(
        json['fullDocumentImageExtensionFactors'] as Map<String, dynamic>)
    ..maxAllowedMismatchesPerField = json['maxAllowedMismatchesPerField'] as int
    ..paddingEdge = (json['paddingEdge'] as num).toDouble()
    ..recognitionModeFilter = RecognitionModeFilter.fromJson(
        json['recognitionModeFilter'] as Map<String, dynamic>)
    ..returnFaceImage = json['returnFaceImage'] as bool
    ..returnFullDocumentImage = json['returnFullDocumentImage'] as bool
    ..returnSignatureImage = json['returnSignatureImage'] as bool
    ..saveCameraFrames = json['saveCameraFrames'] as bool
    ..scanCroppedDocumentImage = json['scanCroppedDocumentImage'] as bool
    ..signatureImageDpi = json['signatureImageDpi'] as int
    ..skipUnsupportedBack = json['skipUnsupportedBack'] as bool
    ..validateResultCharacters = json['validateResultCharacters'] as bool;
}

Map<String, dynamic> _$BlinkIdCombinedRecognizerToJson(
        BlinkIdCombinedRecognizer instance) =>
    <String, dynamic>{
      'recognizerType': instance.recognizerType,
      'allowBlurFilter': instance.allowBlurFilter,
      'allowUncertainFrontSideScan': instance.allowUncertainFrontSideScan,
      'allowUnparsedMrzResults': instance.allowUnparsedMrzResults,
      'allowUnverifiedMrzResults': instance.allowUnverifiedMrzResults,
      'anonymizationMode':
          _$AnonymizationModeEnumMap[instance.anonymizationMode],
      'faceImageDpi': instance.faceImageDpi,
      'fullDocumentImageDpi': instance.fullDocumentImageDpi,
      'fullDocumentImageExtensionFactors':
          instance.fullDocumentImageExtensionFactors.toJson(),
      'maxAllowedMismatchesPerField': instance.maxAllowedMismatchesPerField,
      'paddingEdge': instance.paddingEdge,
      'recognitionModeFilter': instance.recognitionModeFilter.toJson(),
      'returnFaceImage': instance.returnFaceImage,
      'returnFullDocumentImage': instance.returnFullDocumentImage,
      'returnSignatureImage': instance.returnSignatureImage,
      'saveCameraFrames': instance.saveCameraFrames,
      'scanCroppedDocumentImage': instance.scanCroppedDocumentImage,
      'signatureImageDpi': instance.signatureImageDpi,
      'skipUnsupportedBack': instance.skipUnsupportedBack,
      'validateResultCharacters': instance.validateResultCharacters,
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

const _$AnonymizationModeEnumMap = {
  AnonymizationMode.None: 1,
  AnonymizationMode.ImageOnly: 2,
  AnonymizationMode.ResultFieldsOnly: 3,
  AnonymizationMode.FullResult: 4,
};
