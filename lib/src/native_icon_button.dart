import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'native_base.dart';

class NativeIconButton
    extends BaseNativeStatelessWidget<CupertinoButton, IconButton> {
  const NativeIconButton({
    Key? key,
    required this.icon,
    required this.onPressed,
    this.color,
    this.focusColor,
    this.hoverColor,
    this.highlightColor,
    this.splashColor,
    this.disabledColor,
    this.iconSize,
    this.padding,
    this.alignment,
    this.focusNode,
    this.autoFocus,
    this.tooltip,
    this.enableFeedback,
    this.pressedOpacity,
    this.borderRadius,
  }) : super(key: key);

  final Widget icon;
  final VoidCallback onPressed;
  final Color? color;
  final Color? focusColor;
  final Color? hoverColor;
  final Color? highlightColor;
  final Color? splashColor;
  final Color? disabledColor;
  final double? iconSize;
  final EdgeInsetsGeometry? padding;
  final Alignment? alignment;
  final FocusNode? focusNode;
  final bool? autoFocus;
  final String? tooltip;
  final bool? enableFeedback;
  final double? pressedOpacity;
  final BorderRadius? borderRadius;

  @override
  CupertinoButton buildCupertino(BuildContext context) {
    return CupertinoButton(
      key: key,
      child: icon,
      padding: padding ?? const EdgeInsets.all(0.0),
      color: color,
      disabledColor: disabledColor ?? CupertinoColors.quaternarySystemFill,
      minSize: iconSize ?? 44.0,
      pressedOpacity: pressedOpacity ?? 0.4,
      borderRadius: borderRadius ??
          const BorderRadius.all(
            Radius.circular(8.0),
          ),
      onPressed: onPressed,
    );
  }

  @override
  IconButton buildMaterial(BuildContext context) {
    return IconButton(
      key: key,
      iconSize: iconSize ?? 24.0,
      padding: padding ?? const EdgeInsets.all(8.0),
      alignment: Alignment.center,
      icon: icon,
      color: color,
      focusColor: focusColor,
      hoverColor: hoverColor,
      highlightColor: highlightColor,
      splashColor: splashColor,
      disabledColor: disabledColor,
      onPressed: onPressed,
      focusNode: focusNode,
      autofocus: autoFocus ?? false,
      tooltip: tooltip,
      enableFeedback: enableFeedback ?? true,
    );
  }
}
