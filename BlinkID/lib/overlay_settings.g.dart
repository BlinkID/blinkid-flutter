// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'overlay_settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OverlaySettings _$OverlaySettingsFromJson(Map<String, dynamic> json) {
  return OverlaySettings(
    json['overlaySettingsType'] as String?,
  )
    ..useFrontCamera = json['useFrontCamera'] as bool
    ..enableBeep = json['enableBeep'] as bool
    ..flipFrontCamera = json['flipFrontCamera'] as bool
    ..language = json['language'] as String?
    ..country = json['country'] as String?;
}

Map<String, dynamic> _$OverlaySettingsToJson(OverlaySettings instance) =>
    <String, dynamic>{
      'overlaySettingsType': instance.overlaySettingsType,
      'useFrontCamera': instance.useFrontCamera,
      'enableBeep': instance.enableBeep,
      'flipFrontCamera': instance.flipFrontCamera,
      'language': instance.language,
      'country': instance.country,
    };
