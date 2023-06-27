// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blink_id_recognizer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BlinkIdRecognizer _$BlinkIdRecognizerFromJson(Map<String, dynamic> json) =>
    BlinkIdRecognizer()
      ..recognizerType = json['recognizerType'] as String
      ..allowBlurFilter = json['allowBlurFilter'] as bool
      ..allowUnparsedMrzResults = json['allowUnparsedMrzResults'] as bool
      ..allowUnverifiedMrzResults = json['allowUnverifiedMrzResults'] as bool
      ..anonymizationMode =
          $enumDecode(_$AnonymizationModeEnumMap, json['anonymizationMode'])
      ..faceImageDpi = json['faceImageDpi'] as int
      ..fullDocumentImageDpi = json['fullDocumentImageDpi'] as int
      ..fullDocumentImageExtensionFactors = ImageExtensionFactors.fromJson(
          json['fullDocumentImageExtensionFactors'] as Map<String, dynamic>)
      ..paddingEdge = (json['paddingEdge'] as num).toDouble()
      ..recognitionModeFilter = RecognitionModeFilter.fromJson(
          json['recognitionModeFilter'] as Map<String, dynamic>)
      ..returnFaceImage = json['returnFaceImage'] as bool
      ..returnFullDocumentImage = json['returnFullDocumentImage'] as bool
      ..returnSignatureImage = json['returnSignatureImage'] as bool
      ..saveCameraFrames = json['saveCameraFrames'] as bool
      ..scanCroppedDocumentImage = json['scanCroppedDocumentImage'] as bool
      ..signatureImageDpi = json['signatureImageDpi'] as int
      ..validateResultCharacters = json['validateResultCharacters'] as bool;

Map<String, dynamic> _$BlinkIdRecognizerToJson(BlinkIdRecognizer instance) =>
    <String, dynamic>{
      'recognizerType': instance.recognizerType,
      'allowBlurFilter': instance.allowBlurFilter,
      'allowUnparsedMrzResults': instance.allowUnparsedMrzResults,
      'allowUnverifiedMrzResults': instance.allowUnverifiedMrzResults,
      'anonymizationMode':
          _$AnonymizationModeEnumMap[instance.anonymizationMode]!,
      'faceImageDpi': instance.faceImageDpi,
      'fullDocumentImageDpi': instance.fullDocumentImageDpi,
      'fullDocumentImageExtensionFactors':
          instance.fullDocumentImageExtensionFactors.toJson(),
      'paddingEdge': instance.paddingEdge,
      'recognitionModeFilter': instance.recognitionModeFilter.toJson(),
      'returnFaceImage': instance.returnFaceImage,
      'returnFullDocumentImage': instance.returnFullDocumentImage,
      'returnSignatureImage': instance.returnSignatureImage,
      'saveCameraFrames': instance.saveCameraFrames,
      'scanCroppedDocumentImage': instance.scanCroppedDocumentImage,
      'signatureImageDpi': instance.signatureImageDpi,
      'validateResultCharacters': instance.validateResultCharacters,
    };

const _$AnonymizationModeEnumMap = {
  AnonymizationMode.None: 1,
  AnonymizationMode.ImageOnly: 2,
  AnonymizationMode.ResultFieldsOnly: 3,
  AnonymizationMode.FullResult: 4,
};
