// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'types.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImageExtensionFactors _$ImageExtensionFactorsFromJson(
    Map<String, dynamic> json) {
  return ImageExtensionFactors()
    ..upFactor = (json['upFactor'] as num)?.toDouble()
    ..rightFactor = (json['rightFactor'] as num)?.toDouble()
    ..downFactor = (json['downFactor'] as num)?.toDouble()
    ..leftFactor = (json['leftFactor'] as num)?.toDouble();
}

Map<String, dynamic> _$ImageExtensionFactorsToJson(
        ImageExtensionFactors instance) =>
    <String, dynamic>{
      'upFactor': instance.upFactor,
      'rightFactor': instance.rightFactor,
      'downFactor': instance.downFactor,
      'leftFactor': instance.leftFactor,
    };

RecognitionModeFilter _$RecognitionModeFilterFromJson(
    Map<String, dynamic> json) {
  return RecognitionModeFilter()
    ..enableMrzId = json['enableMrzId'] as bool
    ..enableMrzVisa = json['enableMrzVisa'] as bool
    ..enableMrzPassport = json['enableMrzPassport'] as bool
    ..enablePhotoId = json['enablePhotoId'] as bool
    ..enableFullDocumentRecognition =
        json['enableFullDocumentRecognition'] as bool;
}

Map<String, dynamic> _$RecognitionModeFilterToJson(
        RecognitionModeFilter instance) =>
    <String, dynamic>{
      'enableMrzId': instance.enableMrzId,
      'enableMrzVisa': instance.enableMrzVisa,
      'enableMrzPassport': instance.enableMrzPassport,
      'enablePhotoId': instance.enablePhotoId,
      'enableFullDocumentRecognition': instance.enableFullDocumentRecognition,
    };
