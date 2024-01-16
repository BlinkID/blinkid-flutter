# Changelog

## 6.4.0

- We have updated the plugin to [Android SDK v6.4.0](https://github.com/BlinkID/blinkid-android/releases/tag/v6.4.0) and [iOS SDK v6.4.0](https://github.com/BlinkID/blinkid-ios/releases/tag/v6.4.0)
- Added new values to `Region` and `Type`
- Added new `ClassAnonymizationSettings` setting that enables custom anonymization for any field per country, region, and type of document
- Added `isFilledByDomainKnowledge` property to `DateResult` and `Date` that indicates that the date is not extracted from the image but filled based on our internal document knowledge
- Added missing mandatory field feedback during scanning with `BlinkIdOverlay`
- Added new result member `cardRotation` to `ImageAnalysisResult`

### Breaking API changes

- Change to `StringResult`
  - The string for every document field for each alphabet can be accessed by with `latin`, `arabic` and `cyrillic` members directly.
- Change to `BlinkIdMultiSideRecognizerResult`
  - `dataMatchResult` is now `dataMatch`

## 6.1.2

- Fixed date and `documentDataMatch` errors

## 6.1.1

- Updated to [Android SDK v6.1.1](https://github.com/BlinkID/blinkid-android/releases/tag/v6.1.1) and [iOS SDK v6.1.2](https://github.com/BlinkID/blinkid-ios/releases/tag/v6.1.2)

## 6.1.0

- Updated to [Android SDK v6.1.0](https://github.com/BlinkID/blinkid-android/releases/tag/v6.1.0) and [iOS SDK v6.1.1](https://github.com/BlinkID/blinkid-ios/releases/tag/v6.1.1)

## 5.18.1

- Fix for building APKs in release mode

## 5.18.0

We have updated the plugin to [Android SDK v5.18.0](https://github.com/BlinkID/blinkid-android/releases/tag/v5.18.0) and [iOS SDK v5.18.0](https://github.com/BlinkID/blinkid-ios/releases/tag/v5.18.0)

## 5.17.0

We have updated the plugin to [Android SDK v5.17.0](https://github.com/BlinkID/blinkid-android/releases/tag/v5.17.0) and [iOS SDK v5.17.0](https://github.com/BlinkID/blinkid-ios/releases/tag/v5.17.0)

## 5.15.1

We have updated the plugin to [Android SDK v5.15.0](https://github.com/BlinkID/blinkid-android/releases/tag/v5.15.0) and [iOS SDK v5.15.0](https://github.com/BlinkID/blinkid-ios/releases/tag/v5.15.0)

## 5.14.0

We have updated the plugin to [Android SDK v5.14.0](https://github.com/BlinkID/blinkid-android/releases/tag/v5.14.0) and [iOS SDK v5.14.0](https://github.com/BlinkID/blinkid-ios/releases/tag/v5.14.0)

## 5.13.0

We have updated the plugin to [Android SDK v5.13.0](https://github.com/BlinkID/blinkid-android/releases/tag/v5.13.0) and [iOS SDK v5.13.0](https://github.com/BlinkID/blinkid-ios/releases/tag/v5.13.0)

## 5.12.0

We have updated the plugin to [Android SDK v5.12.0](https://github.com/BlinkID/blinkid-android/releases/tag/v5.12.0) and [iOS SDK v5.12.0](https://github.com/BlinkID/blinkid-ios/releases/tag/v5.12.0)

We also migrated the plugin to sound null safety, which requires you to use Dart 2.12 or newer in your project.

## 5.11.0

We have updated plugin to [Android SDK v5.11.0](https://github.com/BlinkID/blinkid-android/releases/tag/v5.11.0) and [iOS SDK v5.11.0](https://github.com/BlinkID/blinkid-ios/releases/tag/v5.11.0)

## 5.10.0

We have updated plugin to [Android SDK v5.10.0](https://github.com/BlinkID/blinkid-android/releases/tag/v5.10.0) and [iOS SDK v5.10.0](https://github.com/BlinkID/blinkid-ios/releases/tag/v5.10.0)

## 5.9.0

We have updated plugin to [Android SDK v5.9.0](https://github.com/BlinkID/blinkid-android/releases/tag/v5.9.0) and [iOS SDK v5.9.0](https://github.com/BlinkID/blinkid-ios/releases/tag/v5.9.0)

### Fixes

- We have fixed `OverlaySettings.enableBeep` option.
- We have fixed `BlinkIdCombinedRecognizer` and `BlinkIdRecognizer` **anonymizationMode** option.
