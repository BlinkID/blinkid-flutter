
import 'blinkid_flutter_platform_interface.dart';

class BlinkidFlutter {
  Future<String?> getPlatformVersion() {
    return BlinkidFlutterPlatform.instance.getPlatformVersion();
  }
}
