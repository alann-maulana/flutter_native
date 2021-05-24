// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;

import 'package:platform/platform.dart' as platform;

class Platform extends platform.FakePlatform {
  final String _navigatorPlatform = () {
    return html.window.navigator.platform?.toLowerCase() ?? '';
  }();

  @override
  String get operatingSystem {
    if (html.window.matchMedia('only screen and (pointer: fine)').matches) {
      return "linux";
    }

    if (_navigatorPlatform.startsWith('mac')) {
      return "macos";
    }

    if (_navigatorPlatform.contains('iphone') ||
        _navigatorPlatform.contains('ipad') ||
        _navigatorPlatform.contains('ipod')) {
      return "ios";
    }

    if (_navigatorPlatform.startsWith('win')) {
      return "windows";
    }

    return "android";
  }
}
