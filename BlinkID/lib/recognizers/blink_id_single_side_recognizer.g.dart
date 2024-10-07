// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blink_id_single_side_recognizer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BlinkIdSingleSideRecognizer _$BlinkIdSingleSideRecognizerFromJson(
        Map<String, dynamic> json) =>
    BlinkIdSingleSideRecognizer()
      ..recognizerType = json['recognizerType'] as String
      ..additionalAnonymization = (json['additionalAnonymization']
              as List<dynamic>)
          .map((e) =>
              ClassAnonymizationSettings.fromJson(e as Map<String, dynamic>))
          .toList()
      ..allowBarcodeScanOnly = json['allowBarcodeScanOnly'] as bool
      ..allowUnparsedMrzResults = json['allowUnparsedMrzResults'] as bool
      ..allowUnverifiedMrzResults = json['allowUnverifiedMrzResults'] as bool
      ..anonymizationMode =
          $enumDecode(_$AnonymizationModeEnumMap, json['anonymizationMode'])
      ..blurStrictnessLevel =
          $enumDecode(_$StrictnessLevelEnumMap, json['blurStrictnessLevel'])
      ..combineFrameResults = json['combineFrameResults'] as bool
      ..customClassRules = (json['customClassRules'] as List<dynamic>)
          .map((e) => CustomClassRules.fromJson(e as Map<String, dynamic>))
          .toList()
      ..enableBlurFilter = json['enableBlurFilter'] as bool
      ..enableGlareFilter = json['enableGlareFilter'] as bool
      ..faceImageDpi = (json['faceImageDpi'] as num).toInt()
      ..fullDocumentImageDpi = (json['fullDocumentImageDpi'] as num).toInt()
      ..fullDocumentImageExtensionFactors = ImageExtensionFactors.fromJson(
          json['fullDocumentImageExtensionFactors'] as Map<String, dynamic>)
      ..glareStrictnessLevel =
          $enumDecode(_$StrictnessLevelEnumMap, json['glareStrictnessLevel'])
      ..paddingEdge = (json['paddingEdge'] as num).toDouble()
      ..recognitionModeFilter = RecognitionModeFilter.fromJson(
          json['recognitionModeFilter'] as Map<String, dynamic>)
      ..returnFaceImage = json['returnFaceImage'] as bool
      ..returnFullDocumentImage = json['returnFullDocumentImage'] as bool
      ..returnSignatureImage = json['returnSignatureImage'] as bool
      ..saveCameraFrames = json['saveCameraFrames'] as bool
      ..scanCroppedDocumentImage = json['scanCroppedDocumentImage'] as bool
      ..signatureImageDpi = (json['signatureImageDpi'] as num).toInt()
      ..validateResultCharacters = json['validateResultCharacters'] as bool;

Map<String, dynamic> _$BlinkIdSingleSideRecognizerToJson(
        BlinkIdSingleSideRecognizer instance) =>
    <String, dynamic>{
      'recognizerType': instance.recognizerType,
      'additionalAnonymization':
          instance.additionalAnonymization.map((e) => e.toJson()).toList(),
      'allowBarcodeScanOnly': instance.allowBarcodeScanOnly,
      'allowUnparsedMrzResults': instance.allowUnparsedMrzResults,
      'allowUnverifiedMrzResults': instance.allowUnverifiedMrzResults,
      'anonymizationMode':
          _$AnonymizationModeEnumMap[instance.anonymizationMode]!,
      'blurStrictnessLevel':
          _$StrictnessLevelEnumMap[instance.blurStrictnessLevel]!,
      'combineFrameResults': instance.combineFrameResults,
      'customClassRules':
          instance.customClassRules.map((e) => e.toJson()).toList(),
      'enableBlurFilter': instance.enableBlurFilter,
      'enableGlareFilter': instance.enableGlareFilter,
      'faceImageDpi': instance.faceImageDpi,
      'fullDocumentImageDpi': instance.fullDocumentImageDpi,
      'fullDocumentImageExtensionFactors':
          instance.fullDocumentImageExtensionFactors.toJson(),
      'glareStrictnessLevel':
          _$StrictnessLevelEnumMap[instance.glareStrictnessLevel]!,
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
  AnonymizationMode.None: 0,
  AnonymizationMode.ImageOnly: 1,
  AnonymizationMode.ResultFieldsOnly: 2,
  AnonymizationMode.FullResult: 3,
};

const _$StrictnessLevelEnumMap = {
  StrictnessLevel.Strict: 0,
  StrictnessLevel.Normal: 1,
  StrictnessLevel.Relaxed: 2,
};
