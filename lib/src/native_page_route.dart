part of flutter_native;

class NativePageRoute<T> extends PageRoute<T> {
  final material.MaterialPageRoute<T> _android;
  final cupertino.CupertinoPageRoute<T> _ios;

  final WidgetBuilder builder;
  final bool fullscreenDialog;

  NativePageRoute({@required this.builder, this.fullscreenDialog = false})
      : assert(builder != null),
        this._android = material.MaterialPageRoute(
            builder: builder, fullscreenDialog: fullscreenDialog),
        this._ios = cupertino.CupertinoPageRoute(
            builder: builder, fullscreenDialog: fullscreenDialog);

  @override
  Duration get transitionDuration => Platform.isAndroid
      ? _android.transitionDuration
      : _ios.transitionDuration;

  @override
  Color get barrierColor =>
      Platform.isAndroid ? _android.barrierColor : _ios.barrierColor;

  @override
  String get barrierLabel =>
      Platform.isAndroid ? _android.barrierLabel : _ios.barrierLabel;

  @override
  bool canTransitionFrom(TransitionRoute<dynamic> previousRoute) {
    return Platform.isAndroid
        ? _android.canTransitionFrom(previousRoute)
        : _ios.canTransitionFrom(previousRoute);
  }

  @override
  bool canTransitionTo(TransitionRoute<dynamic> nextRoute) {
    return Platform.isAndroid
        ? _android.canTransitionTo(nextRoute)
        : _ios.canTransitionTo(nextRoute);
  }

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return Platform.isAndroid
        ? _android.buildPage(context, animation, secondaryAnimation)
        : _ios.buildPage(context, animation, secondaryAnimation);
  }

  @override
  bool get maintainState =>
      Platform.isAndroid ? _android.maintainState : _ios.maintainState;

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return Platform.isAndroid
        ? _android.buildTransitions(
            context, animation, secondaryAnimation, child)
        : _ios.buildTransitions(context, animation, secondaryAnimation, child);
  }

  @override
  String get debugLabel =>
      Platform.isAndroid ? _android.debugLabel : _ios.debugLabel;
}
