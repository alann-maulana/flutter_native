import '../flutter_native.dart';

class NativeValue<T> {
  final T? _materialValue;
  final T? _cupertinoValue;

  NativeValue({
    T? material,
    T? cupertino,
  })  : _materialValue = material,
        _cupertinoValue = cupertino;

  T? get value {
    if (platformWidget == PlatformWidget.cupertino) {
      return _cupertinoValue;
    }

    return _materialValue;
  }
}
