// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'usdl_recognizer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UsdlRecognizer _$UsdlRecognizerFromJson(Map<String, dynamic> json) =>
    UsdlRecognizer()
      ..recognizerType = json['recognizerType'] as String
      ..nullQuietZoneAllowed = json['nullQuietZoneAllowed'] as bool
      ..uncertainDecoding = json['uncertainDecoding'] as bool
      ..enableCompactParser = json['enableCompactParser'] as bool;

Map<String, dynamic> _$UsdlRecognizerToJson(UsdlRecognizer instance) =>
    <String, dynamic>{
      'recognizerType': instance.recognizerType,
      'nullQuietZoneAllowed': instance.nullQuietZoneAllowed,
      'uncertainDecoding': instance.uncertainDecoding,
      'enableCompactParser': instance.enableCompactParser,
    };
