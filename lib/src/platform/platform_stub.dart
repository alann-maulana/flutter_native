import 'package:platform/platform.dart' as platform;

class Platform extends platform.FakePlatform {
  @override
  String get operatingSystem => "android";
}
