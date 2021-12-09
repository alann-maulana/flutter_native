import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NativeThemes {
  static ThemeData themeData(Brightness brightness) {
    return ThemeData(
      brightness: brightness,
      primaryColor: brightness == Brightness.light ? Colors.blue : Colors.black,
      accentColor: brightness == Brightness.light ? null : Colors.blueAccent,
    );
  }

  static CupertinoThemeData cupertinoThemeData(Brightness brightness) {
    return CupertinoThemeData(
      brightness: brightness,
      primaryColor: brightness == Brightness.light
          ? CupertinoColors.systemBlue
          : CupertinoColors.systemOrange,
      scaffoldBackgroundColor: brightness == Brightness.light
          ? CupertinoColors.systemBackground.color
          : CupertinoColors.systemBackground.darkColor,
    );
  }
}

class _NativeInheritedWidget extends InheritedWidget {
  final NativeThemeState data;

  _NativeInheritedWidget({
    this.data,
    Key key,
    @required Widget child,
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(_NativeInheritedWidget oldWidget) {
    return true;
  }
}

class NativeTheme extends StatefulWidget {
  final Widget child;
  final Brightness brightness;

  const NativeTheme({
    Key key,
    this.brightness = Brightness.light,
    @required this.child,
  }) : super(key: key);

  @override
  NativeThemeState createState() => new NativeThemeState();

  static NativeThemeState of(BuildContext context) {
    _NativeInheritedWidget inherited =
        (context.dependOnInheritedWidgetOfExactType<_NativeInheritedWidget>());
    return inherited.data;
  }
}

class NativeThemeState extends State<NativeTheme> {
  Brightness _brightness;
  ThemeData _theme;
  CupertinoThemeData _cupertinoTheme;

  Brightness get brightness => _brightness;
  ThemeData get theme => _theme;
  CupertinoThemeData get cupertinoTheme => _cupertinoTheme;

  @override
  void initState() {
    _brightness = widget.brightness;
    _theme = NativeThemes.themeData(_brightness);
    _cupertinoTheme = NativeThemes.cupertinoThemeData(_brightness);
    super.initState();
  }

  void changeTheme(Brightness brightness) {
    setState(() {
      _brightness = brightness;
      _theme = NativeThemes.themeData(brightness);
      _cupertinoTheme = NativeThemes.cupertinoThemeData(brightness);
    });
  }

  @override
  Widget build(BuildContext context) {
    return _NativeInheritedWidget(
      data: this,
      child: widget.child,
    );
  }
}
