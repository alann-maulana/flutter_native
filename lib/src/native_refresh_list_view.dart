import 'dart:async';

import 'package:flutter/cupertino.dart' as cupertino;
import 'package:flutter/material.dart' as material;
import 'package:flutter/widgets.dart';

import 'native_base.dart';

class NativeRefreshListView extends BaseNativeStatelessWidget<CustomScrollView,
    material.RefreshIndicator> {
  final List<Widget> children;
  final Future<void> Function() onRefresh;

  NativeRefreshListView({
    @required this.children,
    @required this.onRefresh,
  });

  @override
  material.RefreshIndicator buildMaterial(BuildContext context) {
    return material.RefreshIndicator(
      onRefresh: onRefresh,
      child: ListView(
        children: children,
      ),
    );
  }

  @override
  CustomScrollView buildCupertino(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        cupertino.CupertinoSliverRefreshControl(
          onRefresh: onRefresh,
        ),
        SliverSafeArea(
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) => children[index],
              childCount: children.length,
            ),
          ),
        ),
      ],
    );
  }
}
