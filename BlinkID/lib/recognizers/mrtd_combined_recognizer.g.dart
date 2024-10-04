// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mrtd_combined_recognizer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MrtdCombinedRecognizer _$MrtdCombinedRecognizerFromJson(
        Map<String, dynamic> json) =>
    MrtdCombinedRecognizer()
      ..recognizerType = json['recognizerType'] as String
      ..allowSpecialCharacters = json['allowSpecialCharacters'] as bool
      ..allowUnparsedResults = json['allowUnparsedResults'] as bool
      ..allowUnverifiedResults = json['allowUnverifiedResults'] as bool
      ..detectorType =
          $enumDecode(_$DocumentFaceDetectorTypeEnumMap, json['detectorType'])
      ..faceImageDpi = (json['faceImageDpi'] as num).toInt()
      ..fullDocumentImageDpi = (json['fullDocumentImageDpi'] as num).toInt()
      ..fullDocumentImageExtensionFactors = ImageExtensionFactors.fromJson(
          json['fullDocumentImageExtensionFactors'] as Map<String, dynamic>)
      ..numStableDetectionsThreshold =
          (json['numStableDetectionsThreshold'] as num).toInt()
      ..returnFaceImage = json['returnFaceImage'] as bool
      ..returnFullDocumentImage = json['returnFullDocumentImage'] as bool;

Map<String, dynamic> _$MrtdCombinedRecognizerToJson(
        MrtdCombinedRecognizer instance) =>
    <String, dynamic>{
      'recognizerType': instance.recognizerType,
      'allowSpecialCharacters': instance.allowSpecialCharacters,
      'allowUnparsedResults': instance.allowUnparsedResults,
      'allowUnverifiedResults': instance.allowUnverifiedResults,
      'detectorType': _$DocumentFaceDetectorTypeEnumMap[instance.detectorType]!,
      'faceImageDpi': instance.faceImageDpi,
      'fullDocumentImageDpi': instance.fullDocumentImageDpi,
      'fullDocumentImageExtensionFactors':
          instance.fullDocumentImageExtensionFactors.toJson(),
      'numStableDetectionsThreshold': instance.numStableDetectionsThreshold,
      'returnFaceImage': instance.returnFaceImage,
      'returnFullDocumentImage': instance.returnFullDocumentImage,
    };

const _$DocumentFaceDetectorTypeEnumMap = {
  DocumentFaceDetectorType.TD1: 0,
  DocumentFaceDetectorType.TD2: 1,
  DocumentFaceDetectorType.PassportsAndVisas: 2,
};
