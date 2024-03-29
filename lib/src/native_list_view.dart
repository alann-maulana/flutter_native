import 'package:flutter/widgets.dart';

import 'native_base.dart';

class NativeListView extends BaseNativeStatelessWidget<SliverList, ListView> {
  final List<Widget> children;
  final bool reverse;

  const NativeListView({
    Key? key,
    required this.children,
    this.reverse = false,
  }) : super(key: key);

  @override
  ListView buildMaterial(BuildContext context) {
    return ListView(
      reverse: reverse,
      children: children,
    );
  }

  @override
  SliverList buildCupertino(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) => children[index],
        childCount: children.length,
      ),
    );
  }
}
