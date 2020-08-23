import 'package:platform/platform.dart' as platform;
import 'package:platform_detect/platform_detect.dart' as pd;

class Platform extends platform.FakePlatform {
  @override
  String get operatingSystem {
    if (pd.operatingSystem.isLinux) {
      return "linux";
    }

    if (pd.operatingSystem.isMac) {
      return "macos";
    }

    if (pd.operatingSystem.isWindows) {
      return "windows";
    }

    return "android";
  }
}
