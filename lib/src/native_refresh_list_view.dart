part of flutter_native;

class NativeRefreshListView
    extends _NativeStatelessWidget<CustomScrollView, material.RefreshIndicator> {
  final List<Widget> children;
  final Future<void> Function() onRefresh;

  NativeRefreshListView({
    @required this.children,
    @required this.onRefresh,
  });

  @override
  material.RefreshIndicator buildAndroid(BuildContext context) {
    return material.RefreshIndicator(
      onRefresh: onRefresh,
      child: ListView(
        children: children,
      ),
    );
  }

  @override
  CustomScrollView buildIOS(BuildContext context) {
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
