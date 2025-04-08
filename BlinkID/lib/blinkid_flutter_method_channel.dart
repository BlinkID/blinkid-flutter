import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'blinkid_flutter_platform_interface.dart';

/// An implementation of [BlinkidFlutterPlatform] that uses method channels.
class MethodChannelBlinkidFlutter extends BlinkidFlutterPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('blinkid_flutter');

  @override
  Future<void> performScan() async {
    return await methodChannel.invokeMethod<void>('performScan');
  }
}
