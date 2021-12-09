import 'dart:async';

import 'package:flutter/cupertino.dart' as cupertino;
import 'package:flutter/material.dart' as material;
import 'package:flutter/widgets.dart';

import 'native_appbar.dart';
import 'native_base.dart';

typedef RefreshCallback = Future<void> Function();

class NativeScaffold extends BaseNativeStatelessWidget<
    cupertino.CupertinoPageScaffold, material.Scaffold> {
  final NativeAppBar? appBar;
  final Widget body;
  final material.FloatingActionButton? androidFab;
  final RefreshCallback? onRefresh;

  const NativeScaffold({
    this.appBar,
    required this.body,
    this.androidFab,
    this.onRefresh,
  });

  @override
  cupertino.CupertinoPageScaffold buildCupertino(
      cupertino.BuildContext context) {
    final slivers = <Widget>[];

    cupertino.ObstructingPreferredSizeWidget? navigationBar;
    if (appBar != null) {
      if (appBar!.iosLargeTitle) {
        slivers.add(appBar!);
      } else {
        navigationBar = appBar!.cupertinoNavigationBar;
      }
    }

    if (onRefresh != null) {
      slivers.add(cupertino.CupertinoSliverRefreshControl(
        onRefresh: onRefresh,
      ));
    }

    slivers.add(SliverSafeArea(
      top: !(appBar?.iosLargeTitle ?? true),
      sliver: body,
    ));

    final decoratedBox = DecoratedBox(
      decoration: const BoxDecoration(color: cupertino.CupertinoColors.white),
      child: CustomScrollView(
        slivers: slivers,
      ),
    );

    return cupertino.CupertinoPageScaffold(
      navigationBar: navigationBar,
      child: decoratedBox,
    );
  }

  @override
  material.Scaffold buildMaterial(cupertino.BuildContext context) {
    if (onRefresh == null) {
      return material.Scaffold(
        appBar: appBar,
        body: body,
        floatingActionButton: androidFab,
      );
    }

    return material.Scaffold(
      appBar: appBar,
      body: material.RefreshIndicator(
        onRefresh: onRefresh!,
        child: body,
      ),
      floatingActionButton: androidFab,
    );
  }
}

enum ResponsiveLayout { desktop, tablet, mobile }

typedef ResponsiveBodyBuilder = Widget Function(ResponsiveLayout layout);

class ResponsiveScaffold extends StatelessWidget {
  const ResponsiveScaffold({
    Key? key,
    this.scaffoldKey,
    this.drawer,
    this.endDrawer,
    this.title,
    this.centerTitle,
    this.body,
    this.trailing,
    this.floatingActionButton,
    this.menuIcon,
    this.endIcon,
    this.kTabletBreakpoint = 720.0,
    this.kDesktopBreakpoint = 1280.0,
    this.appBarElevation,
  }) : super(key: key);

  final Widget? drawer, endDrawer;

  final Widget? title;

  final bool? centerTitle;

  final ResponsiveBodyBuilder? body;

  final Widget? trailing;

  final Widget? floatingActionButton;

  final double kTabletBreakpoint;

  final double kDesktopBreakpoint;

  double get _drawerWidth => 304.0;

  final IconData? menuIcon, endIcon;

  final double? appBarElevation;

  final Key? scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints) {
        if (constraints.maxWidth >= kDesktopBreakpoint) {
          return desktopLayout();
        }
        if (constraints.maxWidth >= kTabletBreakpoint) {
          return tabletLayout();
        }
        return mobileLayout();
      },
    );
  }

  Widget desktopLayout() {
    return material.Material(
      child: Stack(
        children: <Widget>[
          Row(
            children: <Widget>[
              if (drawer != null) ...[
                SizedBox(
                  width: _drawerWidth,
                  child: material.Drawer(
                    child: SafeArea(
                      child: drawer!,
                    ),
                  ),
                ),
              ],
              Expanded(
                child: material.Scaffold(
                  key: scaffoldKey,
                  appBar: material.AppBar(
                    elevation: appBarElevation,
                    automaticallyImplyLeading: false,
                    title: title,
                    centerTitle: centerTitle,
                    actions: <Widget>[
                      if (trailing != null) ...[
                        trailing!,
                      ],
                    ],
                  ),
                  body: Row(
                    children: <Widget>[
                      Expanded(
                        child: body != null
                            ? body!(ResponsiveLayout.desktop)
                            : Container(),
                      ),
                      if (endDrawer != null) ...[
                        SizedBox(
                          width: _drawerWidth,
                          child: material.Drawer(
                            elevation: 3.0,
                            child: SafeArea(
                              child: endDrawer!,
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            ],
          ),
          if (floatingActionButton != null) ...[
            Positioned(
              top: 100.0,
              left: _drawerWidth - 30,
              child: floatingActionButton!,
            )
          ],
        ],
      ),
    );
  }

  Widget tabletLayout() {
    return material.Scaffold(
      key: scaffoldKey,
      drawer: drawer == null
          ? null
          : material.Drawer(
              child: SafeArea(
                child: drawer!,
              ),
            ),
      appBar: material.AppBar(
        elevation: appBarElevation,
        automaticallyImplyLeading: false,
        title: title,
        leading: _MenuButton(iconData: menuIcon),
        actions: <Widget>[
          if (trailing != null) ...[
            trailing!,
          ],
        ],
      ),
      body: SafeArea(
        right: false,
        bottom: false,
        child: Stack(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: body != null
                      ? body!(ResponsiveLayout.tablet)
                      : Container(),
                ),
                if (endDrawer != null) ...[
                  SizedBox(
                    width: _drawerWidth,
                    child: material.Drawer(
                      elevation: 3.0,
                      child: SafeArea(
                        child: endDrawer!,
                      ),
                    ),
                  ),
                ],
              ],
            ),
            if (floatingActionButton != null) ...[
              Positioned(
                top: 10.0,
                left: 10.0,
                child: floatingActionButton!,
              )
            ],
          ],
        ),
      ),
    );
  }

  Widget mobileLayout() {
    return material.Scaffold(
      key: scaffoldKey,
      drawer: drawer == null
          ? null
          : material.Drawer(
              child: SafeArea(
                child: drawer!,
              ),
            ),
      endDrawer: endDrawer == null
          ? null
          : material.Drawer(
              child: SafeArea(
                child: endDrawer!,
              ),
            ),
      appBar: material.AppBar(
        elevation: appBarElevation,
        automaticallyImplyLeading: false,
        leading: _MenuButton(iconData: menuIcon),
        title: title,
        actions: <Widget>[
          if (trailing != null) ...[
            trailing!,
          ],
          if (endDrawer != null) ...[
            _OptionsButton(iconData: endIcon),
          ]
        ],
      ),
      body: body != null ? body!(ResponsiveLayout.mobile) : null,
      floatingActionButton: floatingActionButton,
      floatingActionButtonLocation:
          material.FloatingActionButtonLocation.endFloat,
    );
  }
}

class _OptionsButton extends StatelessWidget {
  const _OptionsButton({
    Key? key,
    required this.iconData,
  }) : super(key: key);

  final IconData? iconData;

  @override
  Widget build(BuildContext context) {
    return material.IconButton(
      icon: Icon(iconData ?? material.Icons.more_vert),
      onPressed: () {
        material.Scaffold.of(context).openEndDrawer();
      },
    );
  }
}

class _MenuButton extends StatelessWidget {
  const _MenuButton({
    Key? key,
    required this.iconData,
  }) : super(key: key);

  final IconData? iconData;

  @override
  Widget build(BuildContext context) {
    return material.IconButton(
      icon: Icon(iconData ?? material.Icons.menu),
      onPressed: () {
        material.Scaffold.of(context).openDrawer();
      },
    );
  }
}
