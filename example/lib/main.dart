import 'package:example/home_page.dart';
import 'package:example/list_view_page.dart';
import 'package:example/native_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native/flutter_native.dart';

void main() {
  //defaultTargetPlatformWidget = PlatformWidget.cupertino;

  runApp(const NativeTheme(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NativeApp(
      title: 'Flutter Demo',
      materialTheme: NativeTheme.of(context).theme,
      cupertinoTheme: NativeTheme.of(context).cupertinoTheme,
      routes: <String, WidgetBuilder>{
        MyHomePage.route: (_) => const MyHomePage(title: 'Flutter Native Demo'),
        ListViewPage.route: (_) => const ListViewPage(),
      },
    );
  }
}
