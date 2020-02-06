import 'package:flutter/cupertino.dart' as cupertino;
import 'package:flutter/material.dart' as material;
import 'package:flutter/widgets.dart';

import 'native_base.dart';

class NativeTabScaffold extends BaseNativeStatelessWidget<
    cupertino.CupertinoTabScaffold, material.Scaffold> {
  final List<BottomNavigationBarItem> items;
  final int currentIndex;
  final ValueChanged<int> onTap;
  final List<WidgetBuilder> builders;
  final cupertino.CupertinoTabController cupertinoController;
  final material.PageController materialController;
  final Color backgroundColor;

  NativeTabScaffold({
    @required this.items,
    @required this.builders,
    this.currentIndex = 0,
    this.onTap,
    this.cupertinoController,
    this.materialController,
    this.backgroundColor,
  });

  @override
  cupertino.CupertinoTabScaffold buildCupertino(
      cupertino.BuildContext context) {
    return cupertino.CupertinoTabScaffold(
      tabBar: cupertino.CupertinoTabBar(items: items),
      tabBuilder: (context, index) => builders[index](context),
      controller: cupertinoController,
      backgroundColor: backgroundColor,
    );
  }

  @override
  material.Scaffold buildMaterial(cupertino.BuildContext context) {
    assert(currentIndex != null);
    assert(onTap != null);

    return material.Scaffold(
      bottomNavigationBar: material.BottomNavigationBar(
        items: items,
        type: material.BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        onTap: onTap,
        backgroundColor: backgroundColor,
      ),
      body: PageView(
        children: builders.map((e) => e(context)).toList(),
        controller: materialController,
        physics: NeverScrollableScrollPhysics(),
      ),
    );
  }
}
