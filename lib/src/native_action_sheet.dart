import 'dart:async';

import 'package:flutter/cupertino.dart' as cupertino;
import 'package:flutter/material.dart' as material;
import 'package:flutter/widgets.dart';

import '../flutter_native.dart';
import 'native_base.dart';

class NativeActionSheet {
  static Future<T?> showActionSheet<T>({
    required BuildContext context,
    bool barrierDismissible = true,
    required Widget title,
    required List<NativeActionSheetAction> actions,
    required NativeActionSheetAction cancelAction,
  }) {
    if (platformWidget == PlatformWidget.cupertino) {
      return cupertino.showCupertinoModalPopup<T>(
        context: context,
        builder: (context) => cupertino.CupertinoActionSheet(
          title: title,
          actions: actions,
          cancelButton: cancelAction,
        ),
      );
    }

    final children = <Widget>[
      Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
        child: DefaultTextStyle(
          style: material.Theme.of(context).textTheme.headline6!,
          child: title,
        ),
      )
    ];

    children.addAll(actions);
    children.add(material.Divider(height: 0));
    children.add(cancelAction);

    return material.showModalBottomSheet<T>(
      context: context,
      isScrollControlled: actions.length > 3,
      builder: (context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: children,
      ),
    );
  }
}

class NativeActionSheetAction extends BaseNativeStatelessWidget<
    cupertino.CupertinoActionSheetAction, material.ListTile> {
  final Icon? leading;
  final Widget child;
  final VoidCallback onPressed;
  final bool isDefaultAction;
  final bool isDestructiveAction;

  NativeActionSheetAction({
    required this.child,
    required this.onPressed,
    this.leading,
    this.isDefaultAction = false,
    this.isDestructiveAction = false,
  });

  @override
  cupertino.CupertinoActionSheetAction buildCupertino(
      cupertino.BuildContext context) {
    return cupertino.CupertinoActionSheetAction(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            leading == null
                ? SizedBox.shrink()
                : Icon(
                    leading!.icon,
                    size: leading!.size,
                    color: isDestructiveAction
                        ? cupertino.CupertinoDynamicColor.resolve(
                            cupertino.CupertinoColors.systemRed,
                            context,
                          )
                        : cupertino.CupertinoTheme.of(context).primaryColor,
                  ),
            leading == null ? SizedBox.shrink() : SizedBox(width: 8),
            child,
          ],
        ),
      ),
      onPressed: onPressed,
      isDefaultAction: isDefaultAction,
      isDestructiveAction: isDestructiveAction,
    );
  }

  @override
  material.ListTile buildMaterial(cupertino.BuildContext context) {
    return material.ListTile(
      leading: leading == null
          ? null
          : Icon(
              leading!.icon,
              size: leading!.size,
            ),
      title: DefaultTextStyle(
        style: TextStyle(
          fontWeight: isDefaultAction ? FontWeight.w500 : FontWeight.normal,
          color:
              isDestructiveAction ? material.Colors.red : material.Colors.black,
          fontSize: 16,
        ),
        child: child,
      ),
      onTap: onPressed,
    );
  }
}
