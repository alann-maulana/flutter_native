import 'package:example/home_page.dart';
import 'package:example/list_view_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native/flutter_native.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return NativeApp(
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
  }
}
