part of flutter_native;

class NativeAppBar2 extends _NativeStatefulWidget<Widget, material.AppBar>
    implements PreferredSizeWidget {
  final Widget title;
  final Widget leading;
  final Widget iosTrailing;
  final bool iosLargeTitle;
  final List<Widget> androidActions;
  final String iosPreviousPageTitle;

  material.AppBar _androidBar;

  NativeAppBar2({
    this.title,
    this.leading,
    this.iosTrailing,
    this.iosLargeTitle = false,
    this.androidActions,
    this.iosPreviousPageTitle = 'Back',
  }) : assert(title != null);

  @override
  material.AppBar buildAndroid(BuildContext context) {
    if (_androidBar == null) {
      _androidBar = material.AppBar(
        title: title,
        leading: leading,
        actions: androidActions,
      );
    }

    return _androidBar;
  }

  @override
  Widget buildIOS(BuildContext context) {
    return iosLargeTitle
        ? cupertino.CupertinoSliverNavigationBar(
            largeTitle: title,
            leading: leading,
            trailing: iosTrailing,
            previousPageTitle: iosPreviousPageTitle,
          )
        : cupertino.CupertinoNavigationBar(
            middle: title,
            leading: leading,
            trailing: iosTrailing,
            previousPageTitle: iosPreviousPageTitle,
          );
  }

  @override
  Size get preferredSize =>
      Platform.isAndroid ? _androidBar.preferredSize : null;
}

class NativeAppBar extends StatefulWidget implements PreferredSizeWidget {
  final material.AppBar _androidBar;
  final dynamic _iosBar;

  final Widget title;
  final Widget leading;
  final Widget iosTrailing;
  final bool iosLargeTitle;
  final List<Widget> androidActions;
  final String iosPreviousPageTitle;

  NativeAppBar({
    this.title,
    this.leading,
    this.iosTrailing,
    this.iosLargeTitle = false,
    this.androidActions,
    this.iosPreviousPageTitle = 'Back',
  })  : assert(title != null),
        this._androidBar = material.AppBar(
          title: title,
          leading: leading,
          actions: androidActions,
        ),
        this._iosBar = iosLargeTitle
            ? cupertino.CupertinoSliverNavigationBar(
                largeTitle: title,
                leading: leading,
                trailing: iosTrailing,
                previousPageTitle: iosPreviousPageTitle,
              )
            : cupertino.CupertinoNavigationBar(
                middle: title,
                leading: leading,
                trailing: iosTrailing,
                previousPageTitle: iosPreviousPageTitle,
              );

  @override
  _NativeAppBarState createState() {
    return _NativeAppBarState();
  }

  @override
  Size get preferredSize =>
      Platform.isAndroid ? _androidBar.preferredSize : null;
}

class _NativeAppBarState extends State<NativeAppBar> {
  @override
  Widget build(BuildContext context) {
    if (Platform.isAndroid) {
      return widget._androidBar;
    }

    return widget._iosBar;
  }
}
