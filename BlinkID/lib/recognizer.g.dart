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
  RecognizerResultState.empty: 'empty',
  RecognizerResultState.uncertain: 'uncertain',
  RecognizerResultState.valid: 'valid',
  RecognizerResultState.stageValid: 'stageValid',
};

RecognizerCollection _$RecognizerCollectionFromJson(
        Map<String, dynamic> json) =>
    RecognizerCollection(
      (json['recognizerArray'] as List<dynamic>)
          .map((e) => Recognizer.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..allowMultipleResults = json['allowMultipleResults'] as bool
      ..milisecondsBeforeTimeout =
          (json['milisecondsBeforeTimeout'] as num).toInt();

Map<String, dynamic> _$RecognizerCollectionToJson(
        RecognizerCollection instance) =>
    <String, dynamic>{
      'recognizerArray': instance.recognizerArray,
      'allowMultipleResults': instance.allowMultipleResults,
      'milisecondsBeforeTimeout': instance.milisecondsBeforeTimeout,
    };
