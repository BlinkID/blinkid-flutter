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
      ..language = json['language'] as String?
      ..country = json['country'] as String?;

Map<String, dynamic> _$DocumentOverlaySettingsToJson(
        DocumentOverlaySettings instance) =>
    <String, dynamic>{
      'overlaySettingsType': instance.overlaySettingsType,
      'useFrontCamera': instance.useFrontCamera,
      'enableBeep': instance.enableBeep,
      'language': instance.language,
      'country': instance.country,
    };

BlinkIdOverlaySettings _$BlinkIdOverlaySettingsFromJson(
        Map<String, dynamic> json) =>
    BlinkIdOverlaySettings()
      ..overlaySettingsType = json['overlaySettingsType'] as String?
      ..useFrontCamera = json['useFrontCamera'] as bool
      ..enableBeep = json['enableBeep'] as bool
      ..firstSideInstructionsText = json['firstSideInstructionsText'] as String?
      ..backsideInstructionText = json['backsideInstructionText'] as String?
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
      ..iosCustomLocalizationFile = json['iosCustomLocalizationFile'] as String?
      ..enableAndroidLegacyCameraApi =
          json['enableAndroidLegacyCameraApi'] as bool
      ..topPageInstructions = json['topPageInstructions'] as String?
      ..leftPageInstructions = json['leftPageInstructions'] as String?
      ..rightPageInstructions = json['rightPageInstructions'] as String?
      ..turnTopPageInstructions = json['turnTopPageInstructions'] as String?
      ..turnLeftPageInstructions = json['turnLeftPageInstructions'] as String?
      ..turnRightPageInstructions = json['turnRightPageInstructions'] as String?
      ..errorScanningWrongPageTop = json['errorScanningWrongPageTop'] as String?
      ..errorScanningWrongPageLeft =
          json['errorScanningWrongPageLeft'] as String?
      ..errorScanningWrongPageRight =
          json['errorScanningWrongPageRight'] as String?
      ..dataMismatchTitle = json['dataMismatchTitle'] as String?
      ..dataMismatchMessage = json['dataMismatchMessage'] as String?
      ..errorDocumentNotFullyVisible =
          json['errorDocumentNotFullyVisible'] as String?
      ..errorScanningWrongSide = json['errorScanningWrongSide'] as String?
      ..errorFacePhotoNotFullyVisible =
          json['errorFacePhotoNotFullyVisible'] as String?
      ..flashlightWarningMessage = json['flashlightWarningMessage'] as String?
      ..helpTooltipMessage = json['helpTooltipMessage'] as String?
      ..onboardingSkipButtonText = json['onboardingSkipButtonText'] as String?
      ..onboardingBackButtonText = json['onboardingBackButtonText'] as String?
      ..onboardingNextButtonText = json['onboardingNextButtonText'] as String?
      ..onboardingDoneButtonText = json['onboardingDoneButtonText'] as String?
      ..onboardingTitles = (json['onboardingTitles'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList()
      ..onboardingMessages = (json['onboardingMessages'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList()
      ..introductionDialogTitle = json['introductionDialogTitle'] as String?
      ..introductionDialogMessage = json['introductionDialogMessage'] as String?
      ..introductionDoneButtonText =
          json['introductionDoneButtonText'] as String?;

Map<String, dynamic> _$BlinkIdOverlaySettingsToJson(
        BlinkIdOverlaySettings instance) =>
    <String, dynamic>{
      'overlaySettingsType': instance.overlaySettingsType,
      'useFrontCamera': instance.useFrontCamera,
      'enableBeep': instance.enableBeep,
      'firstSideInstructionsText': instance.firstSideInstructionsText,
      'backsideInstructionText': instance.backsideInstructionText,
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
      'iosCustomLocalizationFile': instance.iosCustomLocalizationFile,
      'enableAndroidLegacyCameraApi': instance.enableAndroidLegacyCameraApi,
      'topPageInstructions': instance.topPageInstructions,
      'leftPageInstructions': instance.leftPageInstructions,
      'rightPageInstructions': instance.rightPageInstructions,
      'turnTopPageInstructions': instance.turnTopPageInstructions,
      'turnLeftPageInstructions': instance.turnLeftPageInstructions,
      'turnRightPageInstructions': instance.turnRightPageInstructions,
      'errorScanningWrongPageTop': instance.errorScanningWrongPageTop,
      'errorScanningWrongPageLeft': instance.errorScanningWrongPageLeft,
      'errorScanningWrongPageRight': instance.errorScanningWrongPageRight,
      'dataMismatchTitle': instance.dataMismatchTitle,
      'dataMismatchMessage': instance.dataMismatchMessage,
      'errorDocumentNotFullyVisible': instance.errorDocumentNotFullyVisible,
      'errorScanningWrongSide': instance.errorScanningWrongSide,
      'errorFacePhotoNotFullyVisible': instance.errorFacePhotoNotFullyVisible,
      'flashlightWarningMessage': instance.flashlightWarningMessage,
      'helpTooltipMessage': instance.helpTooltipMessage,
      'onboardingSkipButtonText': instance.onboardingSkipButtonText,
      'onboardingBackButtonText': instance.onboardingBackButtonText,
      'onboardingNextButtonText': instance.onboardingNextButtonText,
      'onboardingDoneButtonText': instance.onboardingDoneButtonText,
      'onboardingTitles': instance.onboardingTitles,
      'onboardingMessages': instance.onboardingMessages,
      'introductionDialogTitle': instance.introductionDialogTitle,
      'introductionDialogMessage': instance.introductionDialogMessage,
      'introductionDoneButtonText': instance.introductionDoneButtonText,
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
      'language': instance.language,
      'country': instance.country,
      'firstSideSplashMessage': instance.firstSideSplashMessage,
      'secondSideSplashMessage': instance.secondSideSplashMessage,
      'scanningDoneSplashMessage': instance.scanningDoneSplashMessage,
      'firstSideInstructions': instance.firstSideInstructions,
      'secondSideInstructions': instance.secondSideInstructions,
      'glareMessage': instance.glareMessage,
    };
