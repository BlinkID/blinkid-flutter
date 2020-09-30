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
    ..allowUnparsedMrzResults = json['allowUnparsedMrzResults'] as bool
    ..allowUnverifiedMrzResults = json['allowUnverifiedMrzResults'] as bool
    ..anonymizationMode = _$enumDecodeNullable(
        _$AnonymizationModeEnumMap, json['anonymizationMode'])
    ..faceImageDpi = json['faceImageDpi'] as int
    ..fullDocumentImageDpi = json['fullDocumentImageDpi'] as int
    ..fullDocumentImageExtensionFactors =
        json['fullDocumentImageExtensionFactors'] == null
            ? null
            : ImageExtensionFactors.fromJson(
                json['fullDocumentImageExtensionFactors']
                    as Map<String, dynamic>)
    ..paddingEdge = (json['paddingEdge'] as num)?.toDouble()
    ..recognitionModeFilter = json['recognitionModeFilter'] == null
        ? null
        : RecognitionModeFilter.fromJson(
            json['recognitionModeFilter'] as Map<String, dynamic>)
    ..returnFaceImage = json['returnFaceImage'] as bool
    ..returnFullDocumentImage = json['returnFullDocumentImage'] as bool
    ..returnSignatureImage = json['returnSignatureImage'] as bool
    ..signResult = json['signResult'] as bool
    ..signatureImageDpi = json['signatureImageDpi'] as int
    ..skipUnsupportedBack = json['skipUnsupportedBack'] as bool
    ..validateResultCharacters = json['validateResultCharacters'] as bool;
}

Map<String, dynamic> _$BlinkIdCombinedRecognizerToJson(
        BlinkIdCombinedRecognizer instance) =>
    <String, dynamic>{
      'recognizerType': instance.recognizerType,
      'allowBlurFilter': instance.allowBlurFilter,
      'allowUnparsedMrzResults': instance.allowUnparsedMrzResults,
      'allowUnverifiedMrzResults': instance.allowUnverifiedMrzResults,
      'anonymizationMode':
          _$AnonymizationModeEnumMap[instance.anonymizationMode],
      'faceImageDpi': instance.faceImageDpi,
      'fullDocumentImageDpi': instance.fullDocumentImageDpi,
      'fullDocumentImageExtensionFactors':
          instance.fullDocumentImageExtensionFactors,
      'paddingEdge': instance.paddingEdge,
      'recognitionModeFilter': instance.recognitionModeFilter,
      'returnFaceImage': instance.returnFaceImage,
      'returnFullDocumentImage': instance.returnFullDocumentImage,
      'returnSignatureImage': instance.returnSignatureImage,
      'signResult': instance.signResult,
      'signatureImageDpi': instance.signatureImageDpi,
      'skipUnsupportedBack': instance.skipUnsupportedBack,
      'validateResultCharacters': instance.validateResultCharacters,
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

const _$AnonymizationModeEnumMap = {
  AnonymizationMode.None: 'None',
  AnonymizationMode.ImageOnly: 'ImageOnly',
  AnonymizationMode.ResultFieldsOnly: 'ResultFieldsOnly',
  AnonymizationMode.FullResult: 'FullResult',
};
