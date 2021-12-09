import 'dart:ui';

import 'package:flutter/widgets.dart';
import 'package:flutter_native/flutter_native.dart';

import 'native_theme.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key key}) : super(key: key);

  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  bool darkMode;

  @override
  Widget build(BuildContext context) {
    darkMode ??= NativeTheme.of(context).theme.brightness == Brightness.dark;
    return NativeScaffold(
      appBar: NativeAppBar(
        title: const Text('Native Setting'),
        iosLargeTitle: true,
      ),
      body: NativeListView(
        children: <Widget>[
          const SizedBox(height: 32),
          NativeListTile(
            title: const Text('Dark Mode'),
            trailing: NativeSwitch(
              value: darkMode,
              onChanged: (darkMode) {
                setState(() {
                  this.darkMode = darkMode;
                });

                if (darkMode) {
                  NativeTheme.of(context).changeTheme(Brightness.dark);
                } else {
                  NativeTheme.of(context).changeTheme(Brightness.light);
                }
              },
            ),
            onTap: () {
              setState(() {
                darkMode = !darkMode;
              });

              if (darkMode) {
                NativeTheme.of(context).changeTheme(Brightness.dark);
              } else {
                NativeTheme.of(context).changeTheme(Brightness.light);
              }
            },
          ),
          const NativeListTile(
            title: Text('Progress'),
            subtitle: Text(
              'Indicator',
              style: TextStyle(
                fontSize: 12,
                color: Color(0xFF9E9E9E),
              ),
            ),
            trailing: NativeProgressIndicator(
              radius: 12,
            ),
          ),
        ],
      ),
    );
  }
}
