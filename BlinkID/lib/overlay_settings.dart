import 'package:json_annotation/json_annotation.dart';

export 'package:blinkid_flutter/overlays/blinkid_overlays.dart';

part 'overlay_settings.g.dart';

/// Base class for all overlay settings objects
@JsonSerializable()
class OverlaySettings {
  /// type of the overlay settings object
  String? overlaySettingsType;

  /// whether front camera should be used instead of the default camera
  /// false by default
  bool useFrontCamera = false;

  /// whether beep sound will be played on successful scan
  /// false by default
  bool enableBeep = false;

  /// Flip the camera view horizontally, only when [useFrontCamera] is true.
  ///
  /// This only applies when the current platform is Android.
  bool flipFrontCamera = false;

  /// (optional) if default overlay contains textual information, text will be localized to this language. Otherwise device langauge will be used
  /// example: "en"
  String? language;

  /// (optional) to be used with language variable, it defines the country locale
  /// example: "US" to use "en_US" on Android and en-US on iOS
  String? country;

  OverlaySettings(this.overlaySettingsType);

  factory OverlaySettings.fromJson(Map<String, dynamic> json) => _$OverlaySettingsFromJson(json);
  Map<String, dynamic> toJson() => _$OverlaySettingsToJson(this);
}
