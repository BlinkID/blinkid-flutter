// ignore_for_file: constant_identifier_names

import 'dart:convert';
import 'package:blinkid_flutter/blinkid_result.dart';
import 'package:blinkid_flutter/blinkid_settings.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'blinkid_flutter_platform_interface.dart';

/// An implementation of [BlinkidFlutterPlatform] that uses method channels.
///
/// MethodChannelCaptureFlutter exposes the appropriate native BlinkID module as a Flutter/Dart module,
/// based on the detected platform: Android or iOS.
///
/// The method channel contains the functions `performScan` and `performDirectApiScan` which enable the BlinkID scanning process, with the default UX properties, and with static images.
class MethodChannelBlinkidFlutter extends BlinkidFlutterPlatform {
  /// The method channel is used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('blinkid_flutter');
  static const String ARG_SCAN_METHOD = 'performScan';
  static const String ARG_SCAN_DIRECT_API_METHOD = 'performDirectApiScan';
  static const String ARG_BLINKID_SDK_SETTINGS = 'blinkidSdkSettings';
  static const String ARG_SESSION_SETTINGS = 'blinkidSessionSettings';
  static const String ARG_CLASS_FILTER = 'blinkidClassFilter';
  static const String ARG_FIRST_IMAGE = 'firstImage';
  static const String ARG_SECOND_IMAGE = 'secondImage';

  /// The `performScan` platform channel method launches the BlinkID scanning process with the default UX properties.
  /// It takes the following parameters: [BlinkIdSdkSettings], [BlinkIdSessionSettings] and the optional [ClassFilter] class.
  ///
  /// 1. BlinkID SDK Settings - [BlinkIdSdkSettings]: the class that contains all of the available SDK settings. It contains settings for the license key, and how the models, that the SDK
  /// needs for the scanning process, should be obtained.
  /// To obtain a valid license key, please visit https://developer.microblink.com/ or contact us directly at https://help.microblink.com
  ///
  /// 2. BlinkID Session Settings - [BlinkIdSessionSettings]: the class that contains various settings for the scanning session. It contains the settings for the [ScanningMode] and [BlinkIdScanningSettings], which define various parameters that control the scanning process.
  ///
  /// 3. The optional ClassFilter class - [ClassFilter]: the class which controls which documents will be accepted or reject for information extraction during the scanning session. See [ClassFilter] for more implementation information.
  ///
  @override
  Future<BlinkIdScanningResult?> performScan(
    BlinkIdSdkSettings blinkidSdkSettings,
    BlinkIdSessionSettings blinkidSessionSettings, [
    ClassFilter? classFilter,
  ]) async {
    final jsonBlinkIdResult = await methodChannel
        .invokeMethod(ARG_SCAN_METHOD, {
          ARG_BLINKID_SDK_SETTINGS: jsonDecode(jsonEncode(blinkidSdkSettings)),
          ARG_SESSION_SETTINGS: jsonDecode(jsonEncode(blinkidSessionSettings)),
          ARG_CLASS_FILTER: jsonDecode(jsonEncode(classFilter)),
        });

    final decodedMap = Map<String, dynamic>.from(jsonDecode(jsonBlinkIdResult));
    return BlinkIdScanningResult(decodedMap);
  }

  /// The `performDirectApiScan` platform channel method launches the BlinkID scanning process inteded for information extraction from static images.
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
  @override
  Future<BlinkIdScanningResult?> performDirectApiScan(
    BlinkIdSdkSettings blinkidSdkSettings,
    BlinkIdSessionSettings blinkidSessionSettings,
    String firstImage, [
    String? secondImage,
  ]) async {
    final jsonBlinkIdDirectApiResult = await methodChannel
        .invokeMethod(ARG_SCAN_DIRECT_API_METHOD, {
          ARG_BLINKID_SDK_SETTINGS: jsonDecode(jsonEncode(blinkidSdkSettings)),
          ARG_SESSION_SETTINGS: jsonDecode(jsonEncode(blinkidSessionSettings)),
          ARG_FIRST_IMAGE: jsonDecode(jsonEncode(firstImage)),
          ARG_SECOND_IMAGE: jsonDecode(jsonEncode(secondImage)),
        });

    final decodedMap = Map<String, dynamic>.from(
      jsonDecode(jsonBlinkIdDirectApiResult),
    );
    return BlinkIdScanningResult(decodedMap);
  }
}
