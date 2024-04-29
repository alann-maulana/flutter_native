import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'native_base.dart';

class NativeButton extends BaseNativeStatelessWidget<CupertinoButton, Widget> {
  const NativeButton({
    Key? key,
    required this.child,
    required this.onPressed,
    this.onLongPress,
    this.onHighlightChanged,
    this.textTheme,
    this.textColor,
    this.disabledTextColor,
    this.color,
    this.disabledColor,
    this.focusColor,
    this.hoverColor,
    this.highlightColor,
    this.splashColor,
    this.colorBrightness,
    this.elevation,
    this.focusElevation,
    this.hoverElevation,
    this.highlightElevation,
    this.disabledElevation,
    this.padding,
    this.shape,
    this.clipBehavior,
    this.focusNode,
    this.autoFocus = false,
    this.materialTapTargetSize,
    this.animationDuration,
    this.minSize,
    this.pressedOpacity,
    this.borderRadius,
    this.filled = false,
  }) : super(key: key);

  final Widget child;
  final VoidCallback onPressed;
  final VoidCallback? onLongPress;
  final ValueChanged<bool>? onHighlightChanged;
  final ButtonTextTheme? textTheme;
  final Color? textColor;
  final Color? disabledTextColor;
  final Color? color;
  final Color? disabledColor;
  final Color? focusColor;
  final Color? hoverColor;
  final Color? highlightColor;
  final Color? splashColor;
  final Brightness? colorBrightness;
  final double? elevation;
  final double? focusElevation;
  final double? hoverElevation;
  final double? highlightElevation;
  final double? disabledElevation;
  final EdgeInsetsGeometry? padding;
  final ShapeBorder? shape;
  final Clip? clipBehavior;
  final FocusNode? focusNode;
  final bool? autoFocus;
  final MaterialTapTargetSize? materialTapTargetSize;
  final Duration? animationDuration;
  final double? minSize;
  final double? pressedOpacity;
  final BorderRadius? borderRadius;
  final bool filled;

  @override
  CupertinoButton buildCupertino(BuildContext context) {
    return filled == true
        ? CupertinoButton.filled(
            child: child,
            onPressed: onPressed,
            disabledColor:
                disabledColor ?? CupertinoColors.quaternarySystemFill,
            padding: padding,
            minSize: minSize ?? 44.0,
            pressedOpacity: 0.4,
            borderRadius:
                borderRadius ?? const BorderRadius.all(Radius.circular(8.0)),
          )
        : CupertinoButton(
            child: child,
            onPressed: onPressed,
            color: color,
            disabledColor:
                disabledColor ?? CupertinoColors.quaternarySystemFill,
            padding: padding,
            minSize: minSize ?? 44.0,
            pressedOpacity: 0.4,
            borderRadius:
                borderRadius ?? const BorderRadius.all(Radius.circular(8.0)),
          );
  }

  @override
  Widget buildMaterial(BuildContext context) {
    return filled == true
        ? ElevatedButton(
            key: key,
            child: child,
            onPressed: onPressed,
            onLongPress: onLongPress,
            clipBehavior: clipBehavior ?? Clip.none,
            focusNode: focusNode,
            autofocus: autoFocus ?? false,
            style: ElevatedButton.styleFrom(
              tapTargetSize: materialTapTargetSize,
              animationDuration: animationDuration,
              elevation: elevation,
              padding: padding,
              // onHighlightChanged: onHighlightChanged,
              // textTheme: textTheme,
              // textColor: textColor,
              // disabledTextColor: disabledTextColor,
              // color: color,
              // disabledColor: disabledColor,
              // focusColor: focusColor,
              // hoverColor: hoverColor,
              // highlightColor: highlightColor,
              // splashColor: splashColor,
              // colorBrightness: colorBrightness,
              // focusElevation: focusElevation,
              // hoverElevation: hoverElevation,
              // highlightElevation: highlightElevation,
              // disabledElevation: disabledElevation,
              // shape: shape,
            ),
          )
        // ignore: deprecated_member_use
        : TextButton(
            key: key,
            onPressed: onPressed,
            onLongPress: onLongPress,
            clipBehavior: clipBehavior ?? Clip.none,
            focusNode: focusNode,
            autofocus: autoFocus ?? false,
            style: TextButton.styleFrom(
              padding: padding,
              tapTargetSize: materialTapTargetSize,
              // onHighlightChanged: onHighlightChanged,
              // textTheme: textTheme,
              // textColor: textColor,
              // disabledTextColor: disabledTextColor,
              // color: color,
              // disabledColor: disabledColor,
              // focusColor: focusColor,
              // hoverColor: hoverColor,
              // highlightColor: highlightColor,
              // splashColor: splashColor,
              // colorBrightness: colorBrightness,
              // shape: shape,
            ),
            child: child,
          );
  }
}
