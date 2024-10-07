// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blinkid_overlays.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DocumentOverlaySettings _$DocumentOverlaySettingsFromJson(
        Map<String, dynamic> json) =>
    DocumentOverlaySettings()
      ..overlaySettingsType = json['overlaySettingsType'] as String?
      ..useFrontCamera = json['useFrontCamera'] as bool
      ..enableBeep = json['enableBeep'] as bool
      ..flipFrontCamera = json['flipFrontCamera'] as bool
      ..language = json['language'] as String?
      ..country = json['country'] as String?;

Map<String, dynamic> _$DocumentOverlaySettingsToJson(
        DocumentOverlaySettings instance) =>
    <String, dynamic>{
      'overlaySettingsType': instance.overlaySettingsType,
      'useFrontCamera': instance.useFrontCamera,
      'enableBeep': instance.enableBeep,
      'flipFrontCamera': instance.flipFrontCamera,
      'language': instance.language,
      'country': instance.country,
    };

BlinkIdOverlaySettings _$BlinkIdOverlaySettingsFromJson(
        Map<String, dynamic> json) =>
    BlinkIdOverlaySettings()
      ..overlaySettingsType = json['overlaySettingsType'] as String?
      ..useFrontCamera = json['useFrontCamera'] as bool
      ..enableBeep = json['enableBeep'] as bool
      ..flipFrontCamera = json['flipFrontCamera'] as bool
      ..firstSideInstructionsText = json['firstSideInstructionsText'] as String?
      ..flipInstructions = json['flipInstructions'] as String?
      ..errorMoveCloser = json['errorMoveCloser'] as String?
      ..errorMoveFarther = json['errorMoveFarther'] as String?
      ..sidesNotMatchingTitle = json['sidesNotMatchingTitle'] as String?
      ..sidesNotMatchingMessage = json['sidesNotMatchingMessage'] as String?
      ..unsupportedDocumentTitle = json['unsupportedDocumentTitle'] as String?
      ..unsupportedDocumentMessage =
          json['unsupportedDocumentMessage'] as String?
      ..recognitionTimeoutTitle = json['recognitionTimeoutTitle'] as String?
      ..recognitionTimeoutMessage = json['recognitionTimeoutMessage'] as String?
      ..retryButtonText = json['retryButtonText'] as String?
      ..requireDocumentSidesDataMatch =
          json['requireDocumentSidesDataMatch'] as bool
      ..showNotSupportedDialog = json['showNotSupportedDialog'] as bool
      ..showFlashlightWarning = json['showFlashlightWarning'] as bool
      ..showMandatoryFieldsMissing = json['showMandatoryFieldsMissing'] as bool
      ..showOnboardingInfo = json['showOnboardingInfo'] as bool
      ..showIntroductionDialog = json['showIntroductionDialog'] as bool
      ..onboardingButtonTooltipDelay =
          (json['onboardingButtonTooltipDelay'] as num).toInt()
      ..backSideScanningTimeoutMilliseconds =
          (json['backSideScanningTimeoutMilliseconds'] as num).toInt()
      ..scanBarcodeText = json['scanBarcodeText'] as String?
      ..errorDocumentTooCloseToEdge =
          json['errorDocumentTooCloseToEdge'] as String?
      ..language = json['language'] as String?
      ..country = json['country'] as String?
      ..showTorchButton = json['showTorchButton'] as bool
      ..showCancelButton = json['showCancelButton'] as bool
      ..errorBlurDetected = json['errorBlurDetected'] as String?
      ..errorGlareDetected = json['errorGlareDetected'] as String?
      ..androidCameraResolutionPreset = $enumDecode(
          _$AndroidCameraResolutionPresetEnumMap,
          json['androidCameraResolutionPreset'])
      ..iosCameraResolutionPreset = $enumDecode(
          _$iOSCameraResolutionPresetEnumMap, json['iosCameraResolutionPreset'])
      ..enableAndroidLegacyCameraApi =
          json['enableAndroidLegacyCameraApi'] as bool;

Map<String, dynamic> _$BlinkIdOverlaySettingsToJson(
        BlinkIdOverlaySettings instance) =>
    <String, dynamic>{
      'overlaySettingsType': instance.overlaySettingsType,
      'useFrontCamera': instance.useFrontCamera,
      'enableBeep': instance.enableBeep,
      'flipFrontCamera': instance.flipFrontCamera,
      'firstSideInstructionsText': instance.firstSideInstructionsText,
      'flipInstructions': instance.flipInstructions,
      'errorMoveCloser': instance.errorMoveCloser,
      'errorMoveFarther': instance.errorMoveFarther,
      'sidesNotMatchingTitle': instance.sidesNotMatchingTitle,
      'sidesNotMatchingMessage': instance.sidesNotMatchingMessage,
      'unsupportedDocumentTitle': instance.unsupportedDocumentTitle,
      'unsupportedDocumentMessage': instance.unsupportedDocumentMessage,
      'recognitionTimeoutTitle': instance.recognitionTimeoutTitle,
      'recognitionTimeoutMessage': instance.recognitionTimeoutMessage,
      'retryButtonText': instance.retryButtonText,
      'requireDocumentSidesDataMatch': instance.requireDocumentSidesDataMatch,
      'showNotSupportedDialog': instance.showNotSupportedDialog,
      'showFlashlightWarning': instance.showFlashlightWarning,
      'showMandatoryFieldsMissing': instance.showMandatoryFieldsMissing,
      'showOnboardingInfo': instance.showOnboardingInfo,
      'showIntroductionDialog': instance.showIntroductionDialog,
      'onboardingButtonTooltipDelay': instance.onboardingButtonTooltipDelay,
      'backSideScanningTimeoutMilliseconds':
          instance.backSideScanningTimeoutMilliseconds,
      'scanBarcodeText': instance.scanBarcodeText,
      'errorDocumentTooCloseToEdge': instance.errorDocumentTooCloseToEdge,
      'language': instance.language,
      'country': instance.country,
      'showTorchButton': instance.showTorchButton,
      'showCancelButton': instance.showCancelButton,
      'errorBlurDetected': instance.errorBlurDetected,
      'errorGlareDetected': instance.errorGlareDetected,
      'androidCameraResolutionPreset': _$AndroidCameraResolutionPresetEnumMap[
          instance.androidCameraResolutionPreset]!,
      'iosCameraResolutionPreset': _$iOSCameraResolutionPresetEnumMap[
          instance.iosCameraResolutionPreset]!,
      'enableAndroidLegacyCameraApi': instance.enableAndroidLegacyCameraApi,
    };

const _$AndroidCameraResolutionPresetEnumMap = {
  AndroidCameraResolutionPreset.PresetDefault: 0,
  AndroidCameraResolutionPreset.Preset480p: 1,
  AndroidCameraResolutionPreset.Preset720p: 2,
  AndroidCameraResolutionPreset.Preset1080p: 3,
  AndroidCameraResolutionPreset.Preset2160p: 4,
  AndroidCameraResolutionPreset.PresetMaxAvailable: 5,
};

const _$iOSCameraResolutionPresetEnumMap = {
  iOSCameraResolutionPreset.Preset480p: 0,
  iOSCameraResolutionPreset.Preset720p: 1,
  iOSCameraResolutionPreset.Preset1080p: 2,
  iOSCameraResolutionPreset.Preset4K: 3,
  iOSCameraResolutionPreset.PresetOptimal: 4,
  iOSCameraResolutionPreset.PresetMax: 5,
  iOSCameraResolutionPreset.PresetPhoto: 6,
};

DocumentVerificationOverlaySettings
    _$DocumentVerificationOverlaySettingsFromJson(Map<String, dynamic> json) =>
        DocumentVerificationOverlaySettings()
          ..overlaySettingsType = json['overlaySettingsType'] as String?
          ..useFrontCamera = json['useFrontCamera'] as bool
          ..enableBeep = json['enableBeep'] as bool
          ..flipFrontCamera = json['flipFrontCamera'] as bool
          ..language = json['language'] as String?
          ..country = json['country'] as String?
          ..firstSideSplashMessage = json['firstSideSplashMessage'] as String?
          ..secondSideSplashMessage = json['secondSideSplashMessage'] as String?
          ..scanningDoneSplashMessage =
              json['scanningDoneSplashMessage'] as String?
          ..firstSideInstructions = json['firstSideInstructions'] as String?
          ..secondSideInstructions = json['secondSideInstructions'] as String?
          ..glareMessage = json['glareMessage'] as String?;

Map<String, dynamic> _$DocumentVerificationOverlaySettingsToJson(
        DocumentVerificationOverlaySettings instance) =>
    <String, dynamic>{
      'overlaySettingsType': instance.overlaySettingsType,
      'useFrontCamera': instance.useFrontCamera,
      'enableBeep': instance.enableBeep,
      'flipFrontCamera': instance.flipFrontCamera,
      'language': instance.language,
      'country': instance.country,
      'firstSideSplashMessage': instance.firstSideSplashMessage,
      'secondSideSplashMessage': instance.secondSideSplashMessage,
      'scanningDoneSplashMessage': instance.scanningDoneSplashMessage,
      'firstSideInstructions': instance.firstSideInstructions,
      'secondSideInstructions': instance.secondSideInstructions,
      'glareMessage': instance.glareMessage,
    };
