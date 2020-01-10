import 'package:flutter/cupertino.dart' as cupertino;
import 'package:flutter/material.dart' as material;
import 'package:flutter/widgets.dart';

import 'native_base.dart';

class NativeApp extends BaseNativeStatelessWidget<cupertino.CupertinoApp,
    material.MaterialApp> {
  NativeApp({
    Key key,
    this.navigatorKey,
    this.home,
    this.routes,
    this.initialRoute,
    this.onGenerateRoute,
    this.onUnknownRoute,
    this.navigatorObservers,
    this.builder,
    this.title,
    this.onGenerateTitle,
    this.color,
    this.materialTheme,
    this.materialDarkTheme,
    this.cupertinoTheme,
    this.themeMode = material.ThemeMode.system,
    this.locale,
    this.localizationsDelegates,
    this.localeListResolutionCallback,
    this.localeResolutionCallback,
    this.supportedLocales,
    this.debugShowMaterialGrid = false,
    this.showPerformanceOverlay = false,
    this.checkerboardRasterCacheImages = false,
    this.checkerboardOffscreenLayers = false,
    this.showSemanticsDebugger = false,
    this.debugShowCheckedModeBanner = true,
    this.shortcuts,
    this.actions,
  }) : super(key: key);

  final GlobalKey<NavigatorState> navigatorKey;
  final Widget home;
  final Map<String, WidgetBuilder> routes;
  final String initialRoute;
  final RouteFactory onGenerateRoute;
  final RouteFactory onUnknownRoute;
  final List<NavigatorObserver> navigatorObservers;
  final material.TransitionBuilder builder;
  final String title;
  final GenerateAppTitle onGenerateTitle;
  final Color color;
  final material.ThemeData materialTheme;
  final material.ThemeData materialDarkTheme;
  final cupertino.CupertinoThemeData cupertinoTheme;
  final material.ThemeMode themeMode;
  final Locale locale;
  final Iterable<LocalizationsDelegate<dynamic>> localizationsDelegates;
  final LocaleListResolutionCallback localeListResolutionCallback;
  final LocaleResolutionCallback localeResolutionCallback;
  final List<Locale> supportedLocales;
  final bool debugShowMaterialGrid;
  final bool showPerformanceOverlay;
  final bool checkerboardRasterCacheImages;
  final bool checkerboardOffscreenLayers;
  final bool showSemanticsDebugger;
  final bool debugShowCheckedModeBanner;
  final Map<LogicalKeySet, Intent> shortcuts;
  final Map<LocalKey, ActionFactory> actions;

  @override
  cupertino.CupertinoApp buildCupertino(cupertino.BuildContext context) {
    return cupertino.CupertinoApp(
      key: key,
      navigatorKey: navigatorKey,
      home: home,
      theme: cupertinoTheme,
      routes: routes ?? const <String, WidgetBuilder>{},
      initialRoute: initialRoute,
      onGenerateRoute: onGenerateRoute,
      onUnknownRoute: onUnknownRoute,
      navigatorObservers: navigatorObservers ?? const <NavigatorObserver>[],
      builder: builder,
      title: title,
      onGenerateTitle: onGenerateTitle,
      color: color,
      locale: locale,
      localizationsDelegates: localizationsDelegates,
      localeListResolutionCallback: localeListResolutionCallback,
      localeResolutionCallback: localeResolutionCallback,
      supportedLocales: supportedLocales ?? const <Locale>[Locale('en', 'US')],
      showPerformanceOverlay: showPerformanceOverlay ?? false,
      checkerboardRasterCacheImages: checkerboardRasterCacheImages ?? false,
      checkerboardOffscreenLayers: checkerboardOffscreenLayers ?? false,
      showSemanticsDebugger: showSemanticsDebugger ?? false,
      debugShowCheckedModeBanner: debugShowCheckedModeBanner ?? true,
      shortcuts: shortcuts,
      actions: actions,
    );
  }

  @override
  material.MaterialApp buildMaterial(cupertino.BuildContext context) {
    return material.MaterialApp(
      key: key,
      navigatorKey: navigatorKey,
      home: home,
      routes: routes ?? const <String, WidgetBuilder>{},
      initialRoute: initialRoute,
      onGenerateRoute: onGenerateRoute,
      onUnknownRoute: onUnknownRoute,
      navigatorObservers: navigatorObservers ?? const <NavigatorObserver>[],
      builder: builder,
      title: title,
      onGenerateTitle: onGenerateTitle,
      color: color,
      theme: materialTheme,
      darkTheme: materialDarkTheme,
      themeMode: themeMode ?? material.ThemeMode.system,
      locale: locale,
      localizationsDelegates: localizationsDelegates,
      localeListResolutionCallback: localeListResolutionCallback,
      localeResolutionCallback: localeResolutionCallback,
      supportedLocales: supportedLocales ?? const <Locale>[Locale('en', 'US')],
      debugShowMaterialGrid: debugShowMaterialGrid ?? false,
      showPerformanceOverlay: showPerformanceOverlay ?? false,
      checkerboardRasterCacheImages: checkerboardRasterCacheImages ?? false,
      checkerboardOffscreenLayers: checkerboardOffscreenLayers ?? false,
      showSemanticsDebugger: showSemanticsDebugger ?? false,
      debugShowCheckedModeBanner: debugShowCheckedModeBanner ?? true,
      shortcuts: shortcuts,
      actions: actions,
    );
  }
}
