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

  NativeTabScaffold({
    @required this.items,
    this.currentIndex = 0,
    this.onTap,
    @required this.builders,
  });

  @override
  cupertino.CupertinoTabScaffold buildCupertino(
      cupertino.BuildContext context) {
    return cupertino.CupertinoTabScaffold(
      tabBar: cupertino.CupertinoTabBar(items: items),
      tabBuilder: (context, index) => builders[index](context),
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
      ),
      body: builders[currentIndex](context),
    );
  }
}
