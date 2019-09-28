# Flutter Native Example

A new Flutter application.

## Native App

```dart
NativeApp(
  title: 'Flutter Demo',
  androidTheme: ThemeData(
    primarySwatch: Colors.orange,
  ),
  iosTheme: CupertinoThemeData(
    primaryColor: CupertinoColors.activeOrange,
  ),
  routes: <String, WidgetBuilder>{
    MyHomePage.ROUTE: (_) => MyHomePage(title: 'Flutter Native Demo'),
    ListViewPage.ROUTE: (_) => ListViewPage(),
  },
);
```
