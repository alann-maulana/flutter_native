import 'package:flutter/cupertino.dart' as cupertino;
import 'package:flutter/material.dart' as material;
import 'package:flutter/widgets.dart';

import 'native_base.dart';

class NativeAppBar
    extends BaseNativeStatelessWidget<StatefulWidget, material.AppBar>
    implements PreferredSizeWidget {
  final Widget title;
  final Widget? leading;
  final Widget? iosTrailing;
  final bool iosLargeTitle;
  final List<Widget>? androidActions;
  final String iosPreviousPageTitle;
  final EdgeInsetsDirectional? padding;

  NativeAppBar({
    required this.title,
    this.leading,
    this.iosTrailing,
    this.iosLargeTitle = false,
    this.androidActions,
    this.iosPreviousPageTitle = 'Back',
    this.padding,
  })  : preferredSize = Size.fromHeight(56.0),
        cupertinoNavigationBar = iosLargeTitle == true
            ? null
            : cupertino.CupertinoNavigationBar(
                middle: title,
                leading: leading,
                trailing: iosTrailing,
                previousPageTitle: iosPreviousPageTitle,
              );

  final cupertino.CupertinoNavigationBar? cupertinoNavigationBar;

  @override
  material.AppBar buildMaterial(BuildContext context) {
    return material.AppBar(
      title: title,
      leading: leading,
      actions: androidActions,
    );
  }

  @override
  StatefulWidget buildCupertino(BuildContext context) {
    if (iosLargeTitle) {
      return cupertino.CupertinoSliverNavigationBar(
        largeTitle: title,
        leading: leading,
        trailing: iosTrailing,
        padding: padding,
        previousPageTitle: iosPreviousPageTitle,
      );
    }

    return cupertinoNavigationBar!;
  }

  @override
  final Size preferredSize;
}
