import 'dart:async';

import 'package:flutter/cupertino.dart' as cupertino;
import 'package:flutter/material.dart' as material;
import 'package:flutter/widgets.dart';

import '../flutter_native.dart';
import 'native_base.dart';

class NativeDialog {
  static Future<T?> showDialog<T>({
    required BuildContext context,
    bool barrierDismissible = true,
    required Widget title,
    required Widget content,
    required List<NativeDialogAction> actions,
  }) {
    if (platformWidget == PlatformWidget.cupertino) {
      return cupertino.showCupertinoDialog<T>(
        context: context,
        builder: (context) => cupertino.CupertinoAlertDialog(
          title: title,
          content: content,
          actions: actions,
        ),
      );
    }

    return material.showDialog<T>(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (context) => material.AlertDialog(
        title: title,
        content: content,
        actions: actions,
      ),
    );
  }
}

class NativeDialogAction extends BaseNativeStatelessWidget<
    cupertino.CupertinoDialogAction, material.TextButton> {
  final Icon? leading;
  final Widget child;
  final VoidCallback onPressed;
  final bool isDefaultAction;
  final bool isDestructiveAction;

  NativeDialogAction({
    required this.child,
    required this.onPressed,
    this.leading,
    this.isDefaultAction = false,
    this.isDestructiveAction = false,
  });

  @override
  cupertino.CupertinoDialogAction buildCupertino(
      cupertino.BuildContext context) {
    return cupertino.CupertinoDialogAction(
      child: child,
      onPressed: onPressed,
      isDefaultAction: isDefaultAction,
      isDestructiveAction: isDestructiveAction,
    );
  }

  @override
  material.TextButton buildMaterial(cupertino.BuildContext context) {
    return material.TextButton(
      child: child,
      onPressed: onPressed,
    );
  }
}
