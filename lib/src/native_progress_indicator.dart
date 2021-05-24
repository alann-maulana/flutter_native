import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'native_base.dart';

class NativeProgressIndicator
    extends BaseNativeStatelessWidget<Widget, SizedBox> {
  NativeProgressIndicator({
    Key? key,
    this.radius,
    this.value,
    this.backgroundColor,
    this.valueColor,
    this.strokeWidth,
    this.semanticsLabel,
    this.semanticsValue,
    this.animating,
    this.brightness,
  }) : super(key: key);

  final double? radius;
  final double? value;
  final Color? backgroundColor;
  final Animation<Color>? valueColor;
  final double? strokeWidth;
  final String? semanticsLabel;
  final String? semanticsValue;
  final bool? animating;
  final Brightness? brightness;

  @override
  Widget buildCupertino(BuildContext context) {
    return CupertinoTheme(
        data: brightness == null
            ? CupertinoTheme.of(context)
            : CupertinoThemeData(
                brightness: brightness,
              ),
        child: CupertinoActivityIndicator(
          radius: radius ?? 10.0,
          animating: animating ?? true,
        ));
  }

  @override
  SizedBox buildMaterial(BuildContext context) {
    return SizedBox(
      width: (radius ?? 10.0) * 2,
      height: (radius ?? 10.0) * 2,
      child: CircularProgressIndicator(
        key: key,
        value: value,
        backgroundColor: backgroundColor,
        valueColor: valueColor,
        strokeWidth: strokeWidth ?? 4.0,
        semanticsLabel: semanticsLabel,
        semanticsValue: semanticsValue,
      ),
    );
  }
}
