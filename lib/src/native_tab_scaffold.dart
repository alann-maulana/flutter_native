part of flutter_native;

class NativeTabScaffold extends StatelessWidget {
  final List<BottomNavigationBarItem> items;
  final int androidCurrentIndex;
  final ValueChanged<int> androidOnTap;
  final List<WidgetBuilder> builders;

  NativeTabScaffold({
    @required this.items,
    this.androidCurrentIndex = 0,
    this.androidOnTap,
    @required this.builders,
  }) {
    if (Platform.isAndroid) {
      assert(androidCurrentIndex != null);
      assert(androidOnTap != null);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (Platform.isAndroid) {
      return material.Scaffold(
        bottomNavigationBar: material.BottomNavigationBar(
          items: items,
          type: material.BottomNavigationBarType.fixed,
          currentIndex: androidCurrentIndex,
          onTap: androidOnTap,
        ),
        body: builders[androidCurrentIndex](context),
      );
    }

    return cupertino.CupertinoTabScaffold(
      tabBar: cupertino.CupertinoTabBar(items: items),
      tabBuilder: (context, index) => builders[index](context),
    );
  }
}
