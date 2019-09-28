part of flutter_native;

class NativeApp extends StatelessWidget {
  final String title;
  final String initialRoute;
  final Widget home;
  final Map<String, WidgetBuilder> routes;
  final GlobalKey<NavigatorState> navigatorKey;
  final bool debugShowCheckedModeBanner;
  final RouteFactory onGenerateRoute;
  final RouteFactory onUnknownRoute;
  final material.ThemeData androidTheme;
  final cupertino.CupertinoThemeData iosTheme;

  NativeApp({
    this.title,
    this.initialRoute,
    this.navigatorKey,
    this.home,
    this.debugShowCheckedModeBanner = true,
    this.onGenerateRoute,
    this.onUnknownRoute,
    this.androidTheme,
    this.iosTheme,
    this.routes = const <String, WidgetBuilder>{},
  })  : assert(title != null),
        assert(routes != null);

  @override
  Widget build(BuildContext context) {
    if (Platform.isAndroid) {
      return material.MaterialApp(
        title: title,
        initialRoute: initialRoute,
        home: home,
        routes: routes,
        navigatorKey: navigatorKey,
        debugShowCheckedModeBanner: debugShowCheckedModeBanner,
        onGenerateRoute: onGenerateRoute,
        onUnknownRoute: onUnknownRoute,
        theme: androidTheme,
      );
    }

    return cupertino.CupertinoApp(
      title: title,
      initialRoute: initialRoute,
      home: home,
      routes: routes,
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: debugShowCheckedModeBanner,
      onGenerateRoute: onGenerateRoute,
      onUnknownRoute: onUnknownRoute,
      theme: iosTheme,
    );
  }
}
