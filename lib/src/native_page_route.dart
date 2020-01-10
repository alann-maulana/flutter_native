import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../flutter_native.dart';

class NativePageRoute {
  static PageRoute<T> create<T>({
    @required WidgetBuilder builder,
    String title,
    RouteSettings settings,
    bool fullscreenDialog = false,
    bool maintainState = true,
  }) {
    assert(builder != null);
    assert(maintainState != null);
    assert(fullscreenDialog != null);

    return platformWidget == PlatformWidget.cupertino
        ? CupertinoPageRoute<T>(
            title: title,
            builder: builder,
            settings: settings,
            maintainState: maintainState,
            fullscreenDialog: fullscreenDialog,
          )
        : MaterialPageRoute<T>(
            builder: builder,
            settings: settings,
            maintainState: maintainState,
            fullscreenDialog: fullscreenDialog,
          );
  }
}
