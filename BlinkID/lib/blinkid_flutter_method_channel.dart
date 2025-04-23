// ignore_for_file: constant_identifier_names

import 'dart:convert';
import 'package:blinkid_flutter/blinkid_result.dart';
import 'package:blinkid_flutter/blinkid_settings.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'blinkid_flutter_platform_interface.dart';

/// An implementation of [BlinkidFlutterPlatform] that uses method channels.
class MethodChannelBlinkidFlutter extends BlinkidFlutterPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('blinkid_flutter');
  static const String ARG_SCAN_METHOD = 'performScan';
  static const String ARG_SCAN_DIRECT_API_METHOD = 'performDirectApiScan';
  static const String ARG_BLINKID_SDK_SETTINGS = 'blinkidSdkSettings';
  static const String ARG_SESSION_SETTINGS = 'blinkidSessionSettings';
  static const String ARG_CLASS_FILTER = 'blinkidClassFilter';
  static const String ARG_FIRST_IMAGE = 'firstImage';
  static const String ARG_SECOND_IMAGE = 'secondImage';

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
