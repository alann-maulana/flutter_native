import 'dart:async';

import 'package:flutter/cupertino.dart' as cupertino;
import 'package:flutter/material.dart' as material;
import 'package:flutter/widgets.dart';

import 'native_appbar.dart';
import 'native_base.dart';

typedef RefreshCallback = Future<void> Function();

class NativeScaffold extends BaseNativeStatelessWidget<
    cupertino.CupertinoPageScaffold, material.Scaffold> {
  final NativeAppBar appBar;
  final Widget body;
  final material.FloatingActionButton androidFab;
  final RefreshCallback onRefresh;

  const NativeScaffold({
    this.appBar,
    this.body,
    this.androidFab,
    this.onRefresh,
  });

  @override
  cupertino.CupertinoPageScaffold buildCupertino(
      cupertino.BuildContext context) {
    final slivers = <Widget>[];

    cupertino.ObstructingPreferredSizeWidget navigationBar;
    if (appBar.iosLargeTitle) {
      slivers.add(appBar);
    } else {
      navigationBar = appBar.cupertinoNavigationBar;
    }

    if (onRefresh != null) {
      slivers.add(cupertino.CupertinoSliverRefreshControl(
        onRefresh: onRefresh,
      ));
    }

    slivers.add(SliverSafeArea(
      top: !appBar.iosLargeTitle,
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
        onRefresh: onRefresh,
        child: body,
      ),
      floatingActionButton: androidFab,
    );
  }
}
