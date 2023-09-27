import 'package:blinkid_flutter/overlay_settings.dart';
import 'package:json_annotation/json_annotation.dart';

part 'blinkid_overlays.g.dart';

/// Class for setting up document overlay.
/// Document overlay is best suited for recognizers that perform ID document scanning.
@JsonSerializable()
class DocumentOverlaySettings extends OverlaySettings {
  DocumentOverlaySettings() : super('DocumentOverlaySettings');

  factory DocumentOverlaySettings.fromJson(Map<String, dynamic> json) => _$DocumentOverlaySettingsFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$DocumentOverlaySettingsToJson(this);
}

/// Class for setting up BlinkId overlay.
/// BlinkId overlay is best suited for recognizers that perform ID document scanning.
@JsonSerializable()
class BlinkIdOverlaySettings extends OverlaySettings {
  BlinkIdOverlaySettings() : super('BlinkIdOverlaySettings');

  factory BlinkIdOverlaySettings.fromJson(Map<String, dynamic> json) => _$BlinkIdOverlaySettingsFromJson(json);

  /// String: message that is shown while scanning first side of the document.
  /// If null, default value will be used.
  String? firstSideInstructionsText;

  /// String: instructions to flip document, shown when scanning of the first side is done, before scanning the second
  /// side of the document.
  /// If null, default value will be used.
  String? flipInstructions;

  /// String: instructions for the user to move the document closer.
  /// If null, default value will be used.
  String? errorMoveCloser;

  /// String: instructions for the user to move the document farther.
  /// If null, default value will be used.
  String? errorMoveFarther;

  /// String: title of the dialog, which is shown when scanned document sides are not from the same document.
  /// If null, default value will be used.
  String? sidesNotMatchingTitle;

  /// String: message inside dialog, which is shown when scanned document sides are not from the same document.
  /// If null, default value will be used.
  String? sidesNotMatchingMessage;

  /// String: title of the dialog, which is shown when unsupported document is scanned.
  /// If null, default value will be used.
  String? unsupportedDocumentTitle;

  /// String: message inside dialog, which is shown when unsupported document is scanned.
  /// If null, default value will be used.
  String? unsupportedDocumentMessage;

  /// String: title of the dialog, which is shown on timeout when scanning is stuck on the back document side.
  /// If null, default value will be used.
  String? recognitionTimeoutTitle;

  /// String: message inside dialog, which is shown on timeout when scanning is stuck on the back document side.
  /// If null, default value will be used.
  String? recognitionTimeoutMessage;

  /// String: text of the "retry" button inside dialog, which is shown on timeout when scanning is stuck on the back
  /// document side.
  String? retryButtonText;

  /// If true, BlinkIdMultiSideRecognizer will check if sides do match when scanning is finished
  /// Default: true
  bool requireDocumentSidesDataMatch = true;

  /// Defines whether Document Not Supported dialog will be displayed in UI.
  ///
  /// Default: true
  bool showNotSupportedDialog = true;

  /// Defines whether glare warning will be displayed when user turn on a flashlight
  ///
  /// Default: true
  bool showFlashlightWarning = true;

  /// Option to configure back side scanning timeout.
  ///
  /// Default: 17000
  int backSideScanningTimeoutMilliseconds = 17000;

  /// Message that is shown while scanning the barcode.
  /// If null, default value will be used.
  String? scanBarcodeText;

  /// Instructions for the user to move the document from the edge.
  /// If null, default value will be used.
  String? errorDocumentTooCloseToEdge;
  @override
  Map<String, dynamic> toJson() => _$BlinkIdOverlaySettingsToJson(this);
}

/// Class for setting up document verification overlay.
/// Document verification overlay is best suited for multi side recognizers - recognizer that perform scanning of both sides of ID documents.
@JsonSerializable()
class DocumentVerificationOverlaySettings extends OverlaySettings {
  DocumentVerificationOverlaySettings() : super('DocumentVerificationOverlaySettings');

  factory DocumentVerificationOverlaySettings.fromJson(Map<String, dynamic> json) =>
      _$DocumentVerificationOverlaySettingsFromJson(json);

  /// String: splash message that is shown before scanning the first side of the document, while starting camera.
  /// If null, default value will be used.
  String? firstSideSplashMessage;

  /// String: splash message that is shown before scanning the second side of the document, while starting camera.
  /// If null, default value will be used.
  String? secondSideSplashMessage;

  /// String: splash message that is shown after scanning the document.
  /// If null, default value will be used.
  String? scanningDoneSplashMessage;

  /// String: user instructions that are shown above camera preview while the first side of the
  /// document is being scanned.
  /// If null, default value will be used.
  String? firstSideInstructions;

  /// String: user instructions that are shown above camera preview while the second side of the
  /// document is being scanned.
  /// If null, default value will be used.
  String? secondSideInstructions;

  /// String: glare message that is shown if glare was detected while scanning document.
  /// If null, default value will be used.
  String? glareMessage;

  @override
  Map<String, dynamic> toJson() => _$DocumentVerificationOverlaySettingsToJson(this);
}
