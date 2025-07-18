import '../overlay_settings.dart';
import '../types.dart';
import 'package:json_annotation/json_annotation.dart';

part 'blinkid_overlays.g.dart';

/// Class for setting up document overlay.
/// Document overlay is best suited for recognizers that perform ID document scanning.
@JsonSerializable()
class DocumentOverlaySettings extends OverlaySettings {
  DocumentOverlaySettings() : super('DocumentOverlaySettings');

  factory DocumentOverlaySettings.fromJson(Map<String, dynamic> json) =>
      _$DocumentOverlaySettingsFromJson(json);
  Map<String, dynamic> toJson() => _$DocumentOverlaySettingsToJson(this);
}

/// Class for setting up BlinkId overlay.
/// BlinkId overlay is best suited for recognizers that perform ID document scanning.
@JsonSerializable()
class BlinkIdOverlaySettings extends OverlaySettings {
  /// String: message that is shown while scanning first side of the document.
  /// If null, default value will be used.
  String? firstSideInstructionsText;

  /// String: message that is shown while scanning back side of the document.
  /// If null, default value will be used.
  String? backsideInstructionText;

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

  /// Define the configuration of the missing mandatory fields feedback during scanning. If disabled, general message is presented.
  ///
  /// Default: true
  bool showMandatoryFieldsMissing = true;

  ///Define if the onboarding info element will be displayed.
  ///
  /// Default: true
  bool showOnboardingInfo = true;

  /// Define whether introduction dialog is turned on by default.
  ///
  /// Default: false
  bool showIntroductionDialog = false;

  /// Option to configure onboarding button tooltip delay time.
  ///
  /// Default: 12000
  int onboardingButtonTooltipDelay = 12000;

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

  /// (optional) if default overlay contains textual information, text will be localized to this language. Otherwise device langauge will be used
  /// example: "en"
  String? language;

  /// (optional) to be used with language variable, it defines the country locale
  /// example: "US" to use "en_US" on Android and en-US on iOS
  String? country;

  /// Defines whether torch button used for turning the flashlight on and off is shown on the screen during the scanning session.
  ///
  /// Default: true
  bool showTorchButton = true;

  /// Defines whether exit (cancel) button used for cancelling the scan is shown on the screen during the scanning session.
  ///
  /// Default: true
  bool showCancelButton = true;

  /// String: instructions for the user when blur has been detected on the document.
  /// If null, default value will be used.
  String? errorBlurDetected;

  /// String: instructions for the user when glare has been detected on the document.
  /// If null, default value will be used.
  String? errorGlareDetected;

  /// Defines possible Android device camera video resolution preset.
  ///
  /// Default: PresetDefault
  AndroidCameraResolutionPreset androidCameraResolutionPreset =
      AndroidCameraResolutionPreset.PresetDefault;

  /// Defines possible iOS device camera video resolution preset.
  ///
  /// Default: PresetOptimal
  iOSCameraResolutionPreset iosCameraResolutionPreset =
      iOSCameraResolutionPreset.PresetOptimal;

  /// iOS specific\
  /// Localization file in the Main bundle used for overrideing framework’s localizations
  ///
  /// Example: if the custom localization file is named "en.strings", "en" needs to be passed to `iosCustomLocalizationFile`
  String? iosCustomLocalizationFile;

  /// Option to set whether legacy camera API should be used even on Lollipop devices that support newer Camera2 API.
  /// WARNING: This setting should only be used if the new Camera2 API is not working on the device. This setting should not be applied on all devices.
  /// Default: false
  bool enableAndroidLegacyCameraApi = false;

  /// String: Instructions to scan the passport, shown when scanning of the first side is done, before
  /// scanning the second side of the document.
  ///
  /// If null, default value will be used.
  String? topPageInstructions;

  /// String: Instructions to scan the passport, shown when scanning of the first side is done, before scanning the second
  /// side of the document.
  ///
  /// If null, default value will be used.
  String? leftPageInstructions;

  /// String: Instructions to scan the passport, shown when scanning of the first side is done, before scanning the second
  /// side of the document.
  ///
  /// If null, default value will be used.
  String? rightPageInstructions;

  /// String: Instructions to scan the passport, shown when scanning of the first side is done, before scanning the second
  /// side of the document.
  ///
  /// If null, default value will be used.
  String? turnTopPageInstructions;

  /// String: Instructions to scan the passport, shown when scanning of the first side is done, before scanning the second
  /// side of the document.
  ///
  /// If null, default value will be used.
  String? turnLeftPageInstructions;

  /// String: Instructions to scan the passport, shown when scanning of the first side is done, before scanning the second
  /// side of the document.
  ///
  ///  If null, default value will be used.
  String? turnRightPageInstructions;

  /// String: Instructions for the user when wrong side of passport is being scanned.
  ///
  /// If null, default value will be used.
  String? errorScanningWrongPageTop;

  /// String: Instructions for the user when wrong side of passport is being scanned.
  ///
  /// If null, default value will be used.
  String? errorScanningWrongPageLeft;

  /// String: Instructions for the user when wrong side of passport is being scanned.
  ///
  /// If null, default value will be used.
  String? errorScanningWrongPageRight;

  /// String: Title for the data mismatch alert.
  ///
  /// If null, default value will be used.
  String? dataMismatchTitle;

  /// String: Message for the data mismatch alert.
  ///
  /// If null, default value will be used.
  String? dataMismatchMessage;

  /// String: Instructions for the user when the document is not fully visible.
  ///
  /// If null, default value will be used.
  String? errorDocumentNotFullyVisible;

  /// String: Instructions for the user when the wrong side of the document is being scanned.
  ///
  /// If null, default value will be used.
  String? errorScanningWrongSide;

  /// String: Instructions for the user when the face photo is not fully visible.
  ///
  /// If null, default value will be used.
  String? errorFacePhotoNotFullyVisible;

  /// String: Flashlight warning message.
  ///
  /// If null, default value will be used.
  String? flashlightWarningMessage;

  /// String: Help toolip message.
  ///
  /// If null, default value will be used.
  String? helpTooltipMessage;

  /// String: Text for the skip button on the onboarding UI element.
  ///
  /// If null, default value will be used.
  String? onboardingSkipButtonText;

  /// String: Text for the back button on the onboarding UI element.
  ///
  /// If null, default value will be used.
  String? onboardingBackButtonText;

  /// String: Text for the next button on the onboarding UI element.
  ///
  /// If null, default value will be used.
  String? onboardingNextButtonText;

  /// String: Text for the done button on the onboarding UI element.
  ///
  /// If null, default value will be used.
  String? onboardingDoneButtonText;

  /// List<String>: Title text for all onboarding elements.
  ///
  /// If null, default values will be used.
  List<String>? onboardingTitles;

  /// List<String>: Message text for all onboarding elements.
  ///
  /// If null, default values will be used.
  List<String>? onboardingMessages;

  /// String: Introduction dialog title text.
  ///
  /// If null, default value will be used.
  String? introductionDialogTitle;

  /// String: Introduction dialog message text.
  ///
  /// If null, default value will be used.
  String? introductionDialogMessage;

  /// String: Introduction dialog done button text.
  ///
  /// If null, default value will be used.
  String? introductionDoneButtonText;

  BlinkIdOverlaySettings() : super('BlinkIdOverlaySettings');

  factory BlinkIdOverlaySettings.fromJson(Map<String, dynamic> json) =>
      _$BlinkIdOverlaySettingsFromJson(json);
  Map<String, dynamic> toJson() => _$BlinkIdOverlaySettingsToJson(this);
}

/// Class for setting up document verification overlay.
/// Document verification overlay is best suited for multi side recognizers - recognizer that perform scanning of both sides of ID documents.
@JsonSerializable()
class DocumentVerificationOverlaySettings extends OverlaySettings {
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

  DocumentVerificationOverlaySettings()
      : super('DocumentVerificationOverlaySettings');

  factory DocumentVerificationOverlaySettings.fromJson(
          Map<String, dynamic> json) =>
      _$DocumentVerificationOverlaySettingsFromJson(json);
  Map<String, dynamic> toJson() =>
      _$DocumentVerificationOverlaySettingsToJson(this);
}
