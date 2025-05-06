import 'package:blinkid_flutter/blinkid_result.dart';
import 'package:blinkid_flutter/blinkid_settings.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'blinkid_flutter_method_channel.dart';

abstract class BlinkidFlutterPlatform extends PlatformInterface {
  /// Constructs a BlinkidFlutterPlatform.
  BlinkidFlutterPlatform() : super(token: _token);

  static final Object _token = Object();

  static BlinkidFlutterPlatform _instance = MethodChannelBlinkidFlutter();

  /// The default instance of [BlinkidFlutterPlatform] to use.
  ///
  /// Defaults to [MethodChannelBlinkidFlutter].
  static BlinkidFlutterPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [BlinkidFlutterPlatform] when
  /// they register themselves.
  static set instance(BlinkidFlutterPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  /// Returns the `performScan` method from the [MethodChannelBlinkidFlutter].
  /// It takes the following parameters: [BlinkIdSdkSettings], [BlinkIdSessionSettings] and the optional [ClassFilter] class.
  /// See [MethodChannelBlinkidFlutter] for more detailed information.
  Future<BlinkIdScanningResult?> performScan(
    BlinkIdSdkSettings blinkidSdkSettings,
    BlinkIdSessionSettings blinkidSessionSettings, [
    ClassFilter? classFilter,
  ]) async {
    return MethodChannelBlinkidFlutter().performScan(
      blinkidSdkSettings,
      blinkidSessionSettings,
      classFilter,
    );
  }

  /// Returns the `performDirectApiScan` method from the [MethodChannelBlinkidFlutter].
  /// It takes the following parameters: [BlinkIdSdkSettings], [BlinkIdSessionSettings], `firstImage` [String] in the Base64 format
  /// and the optional `secondImage` [String] in the Base64 format.
  /// See [MethodChannelBlinkidFlutter] for more detailed information.
  Future<BlinkIdScanningResult?> performDirectApiScan(
    BlinkIdSdkSettings blinkidSdkSettings,
    BlinkIdSessionSettings blinkidSessionSettings,
    String firstImage, [
    String? secondImage,
  ]) async {
    return MethodChannelBlinkidFlutter().performDirectApiScan(
      blinkidSdkSettings,
      blinkidSessionSettings,
      firstImage,
      secondImage,
    );
  }
}
