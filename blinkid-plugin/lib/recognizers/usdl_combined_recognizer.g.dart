// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'usdl_combined_recognizer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UsdlCombinedRecognizer _$UsdlCombinedRecognizerFromJson(
    Map<String, dynamic> json) {
  return UsdlCombinedRecognizer()
    ..recognizerType = json['recognizerType'] as String
    ..faceImageDpi = json['faceImageDpi'] as int
    ..fullDocumentImageDpi = json['fullDocumentImageDpi'] as int
    ..returnFaceImage = json['returnFaceImage'] as bool
    ..returnFullDocumentImage = json['returnFullDocumentImage'] as bool
    ..fullDocumentImageExtensionFactors =
        json['fullDocumentImageExtensionFactors'] == null
            ? null
            : ImageExtensionFactors.fromJson(
                json['fullDocumentImageExtensionFactors']
                    as Map<String, dynamic>)
    ..numStableDetectionsThreshold = json['numStableDetectionsThreshold'] as int
    ..signResult = json['signResult'] as bool;
}

Map<String, dynamic> _$UsdlCombinedRecognizerToJson(
        UsdlCombinedRecognizer instance) =>
    <String, dynamic>{
      'recognizerType': instance.recognizerType,
      'faceImageDpi': instance.faceImageDpi,
      'fullDocumentImageDpi': instance.fullDocumentImageDpi,
      'returnFaceImage': instance.returnFaceImage,
      'returnFullDocumentImage': instance.returnFullDocumentImage,
      'fullDocumentImageExtensionFactors':
          instance.fullDocumentImageExtensionFactors,
      'numStableDetectionsThreshold': instance.numStableDetectionsThreshold,
      'signResult': instance.signResult,
    };
