// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recognizer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Recognizer _$RecognizerFromJson(Map<String, dynamic> json) {
  return Recognizer(
    json['recognizerType'] as String,
  );
}

Map<String, dynamic> _$RecognizerToJson(Recognizer instance) =>
    <String, dynamic>{
      'recognizerType': instance.recognizerType,
    };

RecognizerResult _$RecognizerResultFromJson(Map<String, dynamic> json) {
  return RecognizerResult(
    _$enumDecodeNullable(_$RecognizerResultStateEnumMap, json['resultState']),
  );
}

Map<String, dynamic> _$RecognizerResultToJson(RecognizerResult instance) =>
    <String, dynamic>{
      'resultState': _$RecognizerResultStateEnumMap[instance.resultState],
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

const _$RecognizerResultStateEnumMap = {
  RecognizerResultState.empty: 'empty',
  RecognizerResultState.uncertain: 'uncertain',
  RecognizerResultState.valid: 'valid',
};

RecognizerCollection _$RecognizerCollectionFromJson(Map<String, dynamic> json) {
  return RecognizerCollection(
    (json['recognizerArray'] as List)
        ?.map((e) =>
            e == null ? null : Recognizer.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  )
    ..allowMultipleResults = json['allowMultipleResults'] as bool
    ..milisecondsBeforeTimeout = json['milisecondsBeforeTimeout'] as int;
}

Map<String, dynamic> _$RecognizerCollectionToJson(
        RecognizerCollection instance) =>
    <String, dynamic>{
      'recognizerArray': instance.recognizerArray,
      'allowMultipleResults': instance.allowMultipleResults,
      'milisecondsBeforeTimeout': instance.milisecondsBeforeTimeout,
    };
