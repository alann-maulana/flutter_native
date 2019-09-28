part of flutter_native;

class NativeListView extends _NativeStatelessWidget<SliverList, ListView> {
  final List<Widget> children;

  NativeListView({@required this.children});

  @override
  ListView buildAndroid(BuildContext context) {
    return ListView(
      children: children,
    );
  }

  @override
  SliverList buildIOS(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) => children[index],
        childCount: children.length,
      ),
    );
  }
}
