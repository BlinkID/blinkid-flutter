import 'package:blinkid_flutter/blinkid_result.dart';
import 'package:blinkid_flutter/blinkid_settings.dart';

import 'blinkid_flutter_platform_interface.dart';

class BlinkidFlutter {
  Future<BlinkIdScanningResult?> performScan(
    BlinkIdSdkSettings blinkidSdkSettings,
    BlinkIdSessionSettings blinkidSessionSettings, [
    ClassFilter? classFilter,
  ]) {
    return BlinkidFlutterPlatform.instance.performScan(
      blinkidSdkSettings,
      blinkidSessionSettings,
      classFilter,
    );
  }

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
}
