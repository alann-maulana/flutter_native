part of flutter_native;

class NativeStatelessWidget extends _NativeStatelessWidget<Widget, Widget> {
  final NativeBuilder<Widget> android;
  final NativeBuilder<Widget> ios;

  NativeStatelessWidget({Key key, @required this.android, @required this.ios})
      : assert(android != null),
        assert(ios != null),
        super(key: key);

  @override
  Widget buildAndroid(BuildContext context) {
    return android(context);
  }

  @override
  Widget buildIOS(BuildContext context) {
    return ios(context);
  }
}


class NativeStatefulWidget extends _NativeStatefulWidget<Widget, Widget> {
  final NativeBuilder<Widget> android;
  final NativeBuilder<Widget> ios;

  NativeStatefulWidget({Key key, @required this.android, @required this.ios})
      : assert(android != null),
        assert(ios != null),
        super(key: key);

  @override
  Widget buildAndroid(BuildContext context) {
    return android(context);
  }

  @override
  Widget buildIOS(BuildContext context) {
    return ios(context);
  }
}
