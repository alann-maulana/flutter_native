import 'package:flutter/foundation.dart';

import '../flutter_native.dart';

class NativeValue<T> {
  final T _materialValue;
  final T _cupertinoValue;

  NativeValue({
    @required T material,
    @required T cupertino,
  })  : _materialValue = material,
        _cupertinoValue = cupertino;

  T get value {
    if (defaultTargetPlatformWidget == PlatformWidget.cupertino) {
      return _cupertinoValue;
    }

    return _materialValue;
  }
}
