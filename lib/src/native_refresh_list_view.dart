import 'dart:async';

import 'package:flutter/cupertino.dart' as cupertino;
import 'package:flutter/material.dart' as material;
import 'package:flutter/widgets.dart';

import 'native_base.dart';

class NativeRefreshListView extends BaseNativeStatelessWidget<CustomScrollView,
    material.RefreshIndicator> {
  final List<Widget> children;
  final Future<void> Function() onRefresh;
  final SliverSafeArea? safeArea;
  final EdgeInsetsGeometry? padding;
  final bool reverse;

  const NativeRefreshListView({
    cupertino.Key? key,
    required this.children,
    required this.onRefresh,
    this.safeArea,
    this.padding,
    this.reverse = false,
  }) : super(key: key);

  @override
  material.RefreshIndicator buildMaterial(BuildContext context) {
    return material.RefreshIndicator(
      onRefresh: onRefresh,
      child: ListView(
        padding: padding,
        reverse: reverse,
        children: children,
      ),
    );
  }

  @override
  CustomScrollView buildCupertino(BuildContext context) {
    Widget sliver = SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) => children[index],
        childCount: children.length,
      ),
    );

    if (padding != null) {
      sliver = SliverPadding(
        padding: padding!,
        sliver: sliver,
      );
    }

    return CustomScrollView(
      reverse: reverse,
      slivers: <Widget>[
        cupertino.CupertinoSliverRefreshControl(
          onRefresh: onRefresh,
        ),
        SliverSafeArea(
          top: safeArea?.top ?? true,
          bottom: safeArea?.bottom ?? true,
          left: safeArea?.left ?? true,
          right: safeArea?.right ?? true,
          minimum: safeArea?.minimum ?? EdgeInsets.zero,
          sliver: sliver,
        ),
      ],
    );
  }
}
