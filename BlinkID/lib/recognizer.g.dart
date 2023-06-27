// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recognizer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Recognizer _$RecognizerFromJson(Map<String, dynamic> json) => Recognizer(
      json['recognizerType'] as String,
    );

Map<String, dynamic> _$RecognizerToJson(Recognizer instance) =>
    <String, dynamic>{
      'recognizerType': instance.recognizerType,
    };

RecognizerResult _$RecognizerResultFromJson(Map<String, dynamic> json) =>
    RecognizerResult(
      $enumDecode(_$RecognizerResultStateEnumMap, json['resultState']),
    );

Map<String, dynamic> _$RecognizerResultToJson(RecognizerResult instance) =>
    <String, dynamic>{
      'resultState': _$RecognizerResultStateEnumMap[instance.resultState]!,
    };

const _$RecognizerResultStateEnumMap = {
  RecognizerResultState.empty: 0,
  RecognizerResultState.uncertain: 1,
  RecognizerResultState.valid: 2,
  RecognizerResultState.stageValid: 3,
};

RecognizerCollection _$RecognizerCollectionFromJson(
        Map<String, dynamic> json) =>
    RecognizerCollection(
      (json['recognizerArray'] as List<dynamic>)
          .map((e) => Recognizer.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..allowMultipleResults = json['allowMultipleResults'] as bool
      ..milisecondsBeforeTimeout = json['milisecondsBeforeTimeout'] as int;

Map<String, dynamic> _$RecognizerCollectionToJson(
        RecognizerCollection instance) =>
    <String, dynamic>{
      'recognizerArray':
          instance.recognizerArray.map((e) => e.toJson()).toList(),
      'allowMultipleResults': instance.allowMultipleResults,
      'milisecondsBeforeTimeout': instance.milisecondsBeforeTimeout,
    };
