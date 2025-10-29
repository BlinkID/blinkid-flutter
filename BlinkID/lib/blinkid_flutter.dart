import 'blinkid_flutter_platform_interface.dart';
import 'package:blinkid_flutter/blinkid_result.dart';
import 'package:blinkid_flutter/blinkid_settings.dart';

export './blinkid_settings.dart';
export './blinkid_result.dart';

/// BlinkidFlutter plugin exposes the appropriate native BlinkID module as a Flutter/Dart module,
/// based on the detected platform: Android or iOS.
///
/// The BlinkID plugin contains the methods `performScan` and `performDirectApiScan`
/// which enable the BlinkID scanning process, with the default UX properties, and with static images.
class BlinkidFlutter {
  /// The `performScan` method launches the BlinkID scanning process with the default UX properties.
  /// It takes the following parameters: [BlinkIdSdkSettings], [BlinkIdSessionSettings] and the optional [ClassFilter] class.
  ///
  /// 1. BlinkID SDK Settings - [BlinkIdSdkSettings]: the class that contains all of the available SDK settings. It contains settings for the license key, and how the models, that the SDK
  /// needs for the scanning process, should be obtained.
  /// To obtain a valid license key, please visit https://developer.microblink.com/ or contact us directly at https://help.microblink.com
  ///
  /// 2. BlinkID Session Settings - [BlinkIdSessionSettings]: the class that contains various settings for the scanning session. It contains the settings for the [ScanningMode] and [BlinkIdScanningSettings], which define various parameters that control the scanning process.
  ///
  /// 3. The optional BlinkID UI class - [BlinkIdUiSettings] - the class that allows customization of various aspects of the UI used during the scanning process.
  ///
  /// 4. The optional ClassFilter class - [ClassFilter]: the class which controls which documents will be accepted or reject for information extraction during the scanning session. See [ClassFilter] for more implementation information.
  ///
  /// Returns the `performScan` method from the [BlinkidFlutterPlatform].
  Future<BlinkIdScanningResult?> performScan(
    BlinkIdSdkSettings blinkidSdkSettings,
    BlinkIdSessionSettings blinkidSessionSettings, [
    BlinkIdUiSettings? blinkidUiSettings,
    ClassFilter? classFilter,
  ]) {
    return BlinkidFlutterPlatform.instance.performScan(
      blinkidSdkSettings,
      blinkidSessionSettings,
      blinkidUiSettings,
      classFilter,
    );
  }

  /// The `performDirectApiScan` method launches the BlinkID scanning process inteded for information extraction from static images.
  /// It takes the following parameters: [BlinkIdSdkSettings], [BlinkIdSessionSettings], `firstImage` [String] in the Base64 format and the optional `secondImage` [String] in the Base64 format.
  ///
  /// 1. BlinkID SDK Settings - [BlinkIdSdkSettings]: the class that contains all of the available SDK settings. It contains settings for the license key, and how the models, that the SDK
  /// needs for the scanning process, should be obtained.
  /// To obtain a valid license key, please visit https://developer.microblink.com/ or contact us directly at https://help.microblink.com
  ///
  /// 2. BlinkID Session Settings - [BlinkIdSessionSettings]: the class that contains various settings for the scanning session. It contains the settings for the [ScanningMode] and [BlinkIdScanningSettings], which define various parameters that control the scanning process.
  ///
  /// 3. The `firstImage` Base64 string - [String]: image that represents one side of the document. If the document contains two sides and the [ScanningMode] is set to `automatic`,
  /// this should contain the image of the front side of the document. In case the [ScanningMode] is set to `single`, it can be either the front or the back side of the document.
  ///
  /// 4. The optional `secondImage` Base64 string - [String]: needed if the information from back side of the document is required and the [ScanningMode] is set to `automatic`.
  ///
  /// Returns the `performDirectApiScan` method from the [BlinkidFlutterPlatform].
  Future<BlinkIdScanningResult?> performDirectApiScan(
    BlinkIdSdkSettings blinkidSdkSettings,
    BlinkIdSessionSettings blinkidSessionSettings,
    String firstImage, [
    String? secondImage,
  ]) {
    return BlinkidFlutterPlatform.instance.performDirectApiScan(
      blinkidSdkSettings,
      blinkidSessionSettings,
      firstImage,
      secondImage,
    );
  }

  Future<void> loadBlinkIdSdk(BlinkIdSdkSettings blinkidSdkSettings) async {
    return BlinkidFlutterPlatform.instance.loadBlinkIdSdk(blinkidSdkSettings);
  }

  Future<void> unloadBlinkIdSdk({bool deleteCachedResources = false}) async {
    return BlinkidFlutterPlatform.instance.unloadBlinkIdSdk(
      deleteCachedResources: deleteCachedResources,
    );
  }
}
