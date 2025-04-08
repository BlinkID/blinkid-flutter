import 'blinkid_flutter_platform_interface.dart';

class BlinkidFlutter {
  Future<void> performScan() {
    return BlinkidFlutterPlatform.instance.performScan();
  }
}
