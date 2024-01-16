// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blink_id_multi_side_recognizer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BlinkIdMultiSideRecognizer _$BlinkIdMultiSideRecognizerFromJson(
        Map<String, dynamic> json) =>
    BlinkIdMultiSideRecognizer()
      ..recognizerType = json['recognizerType'] as String
      ..additionalAnonymization = (json['additionalAnonymization']
              as List<dynamic>)
          .map((e) =>
              ClassAnonymizationSettings.fromJson(e as Map<String, dynamic>))
          .toList()
      ..allowBlurFilter = json['allowBlurFilter'] as bool
      ..allowUncertainFrontSideScan =
          json['allowUncertainFrontSideScan'] as bool
      ..allowUnparsedMrzResults = json['allowUnparsedMrzResults'] as bool
      ..allowUnverifiedMrzResults = json['allowUnverifiedMrzResults'] as bool
      ..anonymizationMode =
          $enumDecode(_$AnonymizationModeEnumMap, json['anonymizationMode'])
      ..faceImageDpi = json['faceImageDpi'] as int
      ..fullDocumentImageDpi = json['fullDocumentImageDpi'] as int
      ..fullDocumentImageExtensionFactors = ImageExtensionFactors.fromJson(
          json['fullDocumentImageExtensionFactors'] as Map<String, dynamic>)
      ..maxAllowedMismatchesPerField =
          json['maxAllowedMismatchesPerField'] as int
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

Map<String, dynamic> _$BlinkIdMultiSideRecognizerToJson(
        BlinkIdMultiSideRecognizer instance) =>
    <String, dynamic>{
      'recognizerType': instance.recognizerType,
      'additionalAnonymization':
          instance.additionalAnonymization.map((e) => e.toJson()).toList(),
      'allowBlurFilter': instance.allowBlurFilter,
      'allowUncertainFrontSideScan': instance.allowUncertainFrontSideScan,
      'allowUnparsedMrzResults': instance.allowUnparsedMrzResults,
      'allowUnverifiedMrzResults': instance.allowUnverifiedMrzResults,
      'anonymizationMode':
          _$AnonymizationModeEnumMap[instance.anonymizationMode]!,
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

const _$AnonymizationModeEnumMap = {
  AnonymizationMode.None: 0,
  AnonymizationMode.ImageOnly: 1,
  AnonymizationMode.ResultFieldsOnly: 2,
  AnonymizationMode.FullResult: 3,
};
