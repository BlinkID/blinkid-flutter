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

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
