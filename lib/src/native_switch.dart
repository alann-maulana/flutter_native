import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'native_base.dart';

class NativeSwitch extends BaseNativeStatelessWidget<CupertinoSwitch, Switch> {
  NativeSwitch({
    Key? key,
    required this.value,
    required this.onChanged,
    this.activeColor,
    this.activeTrackColor,
    this.inactiveThumbColor,
    this.inactiveTrackColor,
    this.activeThumbImage,
    this.inactiveThumbImage,
    this.materialTapTargetSize,
    this.dragStartBehavior,
    this.focusColor,
    this.hoverColor,
    this.focusNode,
    this.autoFocus,
  }) : super(key: key);

  final bool value;
  final ValueChanged<bool> onChanged;
  final Color? activeColor;
  final Color? activeTrackColor;
  final Color? inactiveThumbColor;
  final Color? inactiveTrackColor;
  final ImageProvider? activeThumbImage;
  final ImageProvider? inactiveThumbImage;
  final MaterialTapTargetSize? materialTapTargetSize;
  final DragStartBehavior? dragStartBehavior;
  final Color? focusColor;
  final Color? hoverColor;
  final FocusNode? focusNode;
  final bool? autoFocus;

  @override
  CupertinoSwitch buildCupertino(BuildContext context) {
    return CupertinoSwitch(
      key: key,
      value: value,
      onChanged: onChanged,
      activeColor: activeColor,
      dragStartBehavior: dragStartBehavior ?? DragStartBehavior.start,
    );
  }

  @override
  Switch buildMaterial(BuildContext context) {
    return Switch(
      key: key,
      value: value,
      onChanged: onChanged,
      activeColor: activeColor,
      activeTrackColor: activeTrackColor,
      inactiveThumbColor: inactiveThumbColor,
      inactiveTrackColor: activeTrackColor,
      activeThumbImage: activeThumbImage,
      inactiveThumbImage: inactiveThumbImage,
      materialTapTargetSize: materialTapTargetSize,
      dragStartBehavior: dragStartBehavior ?? DragStartBehavior.start,
      focusColor: focusColor,
      hoverColor: hoverColor,
      focusNode: focusNode,
      autofocus: autoFocus ?? false,
    );
  }
}
