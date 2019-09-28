part of flutter_native;

typedef T NativeBuilder<T>(BuildContext context);

abstract class _NativeStatelessWidget<IOS extends Widget,
    ANDROID extends Widget> extends StatelessWidget {
  _NativeStatelessWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (Platform.isAndroid) {
      return buildAndroid(context);
    } else if (Platform.isIOS) {
      return buildIOS(context);
    }

    throw UnsupportedError(
        'This package does not supported: ' + Platform.operatingSystem);
  }

  IOS buildIOS(BuildContext context);

  ANDROID buildAndroid(BuildContext context);
}

abstract class _NativeStatefulWidget<IOS extends Widget, ANDROID extends Widget>
    extends StatefulWidget {
  _NativeStatefulWidget({Key key}) : super(key: key);

  @override
  _NativeStatefulWidgetState createState() {
    return _NativeStatefulWidgetState();
  }

  IOS buildIOS(BuildContext context);

  ANDROID buildAndroid(BuildContext context);
}

class _NativeStatefulWidgetState extends State<_NativeStatefulWidget> {
  @override
  Widget build(BuildContext context) {
    if (Platform.isAndroid) {
      return widget.buildAndroid(context);
    } else if (Platform.isIOS) {
      return widget.buildIOS(context);
    }

    throw UnsupportedError(
        'This package does not supported: ' + Platform.operatingSystem);
  }
}
