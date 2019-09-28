part of flutter_native;

typedef RefreshCallback = Future<void> Function();

class NativeScaffold extends StatefulWidget {
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
  _NativeScaffoldState createState() {
    return _NativeScaffoldState();
  }
}

class _NativeScaffoldState extends State<NativeScaffold> {
  @override
  Widget build(BuildContext context) {
    if (Platform.isAndroid) {
      if (widget.onRefresh == null) {
        return material.Scaffold(
          appBar: widget.appBar,
          body: widget.body,
          floatingActionButton: widget.androidFab,
        );
      }

      return material.Scaffold(
        appBar: widget.appBar,
        body: material.RefreshIndicator(
          onRefresh: widget.onRefresh,
          child: widget.body,
        ),
        floatingActionButton: widget.androidFab,
      );
    }

    final slivers = <Widget>[];

    cupertino.ObstructingPreferredSizeWidget navigationBar;
    if (widget.appBar.iosLargeTitle) {
      slivers.add(widget.appBar);
    } else {
      navigationBar = widget.appBar._iosBar;
    }

    if (widget.onRefresh != null) {
      slivers.add(cupertino.CupertinoSliverRefreshControl(
        onRefresh: widget.onRefresh,
      ));
    }

    slivers.add(SliverSafeArea(
      top: !widget.appBar.iosLargeTitle,
      sliver: widget.body,
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
}
