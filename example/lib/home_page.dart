import 'package:example/list_view_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_native/flutter_native.dart';

import 'setting_page.dart';

class MyHomePage extends StatefulWidget {
  static const route = '/';
  const MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool checked = true;
  int _index = 0;

  _handleShowList() async {
    final result = await Navigator.pushNamed(context, ListViewPage.route);

    if (result == true) {
      debugPrint('Saved');
    }
  }

  @override
  Widget build(BuildContext context) {
    final body = Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          NativeSwitch(
            value: checked,
            onChanged: (flag) => setState(() => checked = !checked),
          ),
          NativeButton(
            child: const Text('Button'),
            onPressed: () {},
          ),
          NativeIconButton(
            icon: const Icon(Icons.title),
            onPressed: () {},
          ),
          const NativeProgressIndicator(
            radius: 20.0,
          )
        ],
      ),
    );
    final home = NativeScaffold(
      appBar: NativeAppBar(
        title: Text(widget.title),
        iosTrailing: NativeIconButton(
          icon: const Icon(CupertinoIcons.add),
          onPressed: _handleShowList,
        ),
      ),
      body: NativeStatelessWidget(
        material: (context) => body,
        cupertino: (context) => SliverFillRemaining(child: body),
      ),
      androidFab: FloatingActionButton(
        onPressed: _handleShowList,
        child: const Icon(Icons.add),
      ),
    );

    final profile = NativeScaffold(
      appBar: NativeAppBar(
        title: const Text('Native Profile'),
        iosLargeTitle: false,
      ),
      body: NativeStatelessWidget(
        material: (context) => const Center(
          child: Text('Profile Page'),
        ),
        cupertino: (context) => const SliverFillRemaining(
          child: Center(
            child: Text('Profile Page'),
          ),
        ),
      ),
    );

    const setting = SettingPage();

    return NativeTabScaffold(
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: NativeStatelessWidget(
            material: (context) => const Icon(Icons.home),
            cupertino: (context) => const Icon(CupertinoIcons.home),
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: NativeStatelessWidget(
            material: (context) => const Icon(Icons.account_circle),
            cupertino: (context) => const Icon(CupertinoIcons.profile_circled),
          ),
          label: 'Profile',
        ),
        BottomNavigationBarItem(
          icon: NativeStatelessWidget(
            material: (context) => const Icon(Icons.settings),
            cupertino: (context) => const Icon(CupertinoIcons.settings),
          ),
          label: 'Setting',
        ),
      ],
      builders: <WidgetBuilder>[
        (context) => NativeStatelessWidget(
              material: (context) => home,
              cupertino: (context) =>
                  CupertinoTabView(builder: (context) => home),
            ),
        (context) => NativeStatelessWidget(
              material: (context) => profile,
              cupertino: (context) =>
                  CupertinoTabView(builder: (context) => profile),
            ),
        (context) => NativeStatelessWidget(
              material: (context) => setting,
              cupertino: (context) =>
                  CupertinoTabView(builder: (context) => setting),
            ),
      ],
      currentIndex: _index,
      onTap: (index) => setState(() => _index = index),
    );
  }
}
