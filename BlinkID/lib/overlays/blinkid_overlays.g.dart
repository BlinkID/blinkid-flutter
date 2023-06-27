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
      ..language = json['language'] as String?
      ..country = json['country'] as String?
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
      ..backSideScanningTimeoutMilliseconds =
          json['backSideScanningTimeoutMilliseconds'] as int
      ..scanBarcodeText = json['scanBarcodeText'] as String?
      ..errorDocumentTooCloseToEdge =
          json['errorDocumentTooCloseToEdge'] as String?;

Map<String, dynamic> _$BlinkIdOverlaySettingsToJson(
        BlinkIdOverlaySettings instance) =>
    <String, dynamic>{
      'overlaySettingsType': instance.overlaySettingsType,
      'useFrontCamera': instance.useFrontCamera,
      'enableBeep': instance.enableBeep,
      'flipFrontCamera': instance.flipFrontCamera,
      'language': instance.language,
      'country': instance.country,
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
      'backSideScanningTimeoutMilliseconds':
          instance.backSideScanningTimeoutMilliseconds,
      'scanBarcodeText': instance.scanBarcodeText,
      'errorDocumentTooCloseToEdge': instance.errorDocumentTooCloseToEdge,
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
