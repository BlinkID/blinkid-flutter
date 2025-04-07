import 'package:flutter_test/flutter_test.dart';
import 'package:blinkid_flutter/blinkid_flutter.dart';
import 'package:blinkid_flutter/blinkid_flutter_platform_interface.dart';
import 'package:blinkid_flutter/blinkid_flutter_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockBlinkidFlutterPlatform
    with MockPlatformInterfaceMixin
    implements BlinkidFlutterPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final BlinkidFlutterPlatform initialPlatform = BlinkidFlutterPlatform.instance;

  test('$MethodChannelBlinkidFlutter is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelBlinkidFlutter>());
  });

  test('getPlatformVersion', () async {
    BlinkidFlutter blinkidFlutterPlugin = BlinkidFlutter();
    MockBlinkidFlutterPlatform fakePlatform = MockBlinkidFlutterPlatform();
    BlinkidFlutterPlatform.instance = fakePlatform;

    expect(await blinkidFlutterPlugin.getPlatformVersion(), '42');
  });
}
