part of flutter_native;

class NativeDialog {
  static Future<T> showDialog<T>({
    @required BuildContext context,
    bool barrierDismissible = true,
    @required Widget title,
    @required Widget content,
    @required List<NativeDialogAction> actions,
  }) {
    if (Platform.isAndroid) {
      return material.showDialog<T>(
        context: context,
        barrierDismissible: barrierDismissible,
        builder: (context) => material.AlertDialog(
          title: title,
          content: content,
          actions: actions.map((a) => a._action).toList(),
        ),
      );
    } else if (Platform.isIOS) {
      return cupertino.showCupertinoDialog<T>(
        context: context,
        builder: (context) => cupertino.CupertinoAlertDialog(
          title: title,
          content: content,
          actions: actions.map((a) => a._action).toList(),
        ),
      );
    }

    throw Exception('unknown native platform');
  }

  static Future<T> showDialogList<T>({
    @required BuildContext context,
    bool barrierDismissible = true,
    @required Widget title,
    @required List<NativeDialogAction> actions,
    @required NativeDialogAction cancelAction,
  }) {
    if (Platform.isAndroid) {
      final children = <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
          child: DefaultTextStyle(
            style: material.Theme.of(context).textTheme.title,
            child: title,
          ),
        )
      ];

      children.addAll(actions.map((a) => a._actionSheet).toList());
      children.add(material.Divider(height: 0));
      children.add(cancelAction._actionSheet);

      return material.showModalBottomSheet<T>(
        context: context,
        isScrollControlled: actions.length > 3,
        builder: (context) => Column(
          mainAxisSize: MainAxisSize.min,
          children: children,
        ),
      );
    } else if (Platform.isIOS) {
      return cupertino.showCupertinoModalPopup<T>(
        context: context,
        builder: (context) => cupertino.CupertinoActionSheet(
          title: title,
          actions: actions.map((a) => a._actionSheet).toList(),
          cancelButton: cancelAction._actionSheet,
        ),
      );
    }

    throw Exception('unknown native platform');
  }
}

class NativeDialogAction {
  final Icon leading;
  final Widget child;
  final VoidCallback onPressed;
  final bool isDefaultAction;
  final bool isDestructiveAction;

  NativeDialogAction({
    @required this.child,
    @required this.onPressed,
    this.leading,
    this.isDefaultAction = false,
    this.isDestructiveAction = false,
  });

  Widget get _action {
    if (Platform.isAndroid) {
      return material.FlatButton(child: child, onPressed: onPressed);
    } else if (Platform.isIOS) {
      return cupertino.CupertinoDialogAction(
        child: child,
        onPressed: onPressed,
        isDefaultAction: isDefaultAction,
        isDestructiveAction: isDestructiveAction,
      );
    }

    throw Exception('unknown native platform');
  }

  Widget get _actionSheet {
    if (Platform.isAndroid) {
      return material.ListTile(
        leading: leading == null
            ? null
            : Icon(
                leading.icon,
                size: leading.size,
              ),
        title: DefaultTextStyle(
          style: TextStyle(
            fontWeight: isDefaultAction ? FontWeight.w500 : FontWeight.normal,
            color: isDestructiveAction
                ? material.Colors.red
                : material.Colors.black,
            fontSize: 16,
          ),
          child: child,
        ),
        onTap: onPressed,
      );
    } else if (Platform.isIOS) {
      return cupertino.CupertinoActionSheetAction(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              leading == null
                  ? SizedBox.shrink()
                  : Icon(
                      leading.icon,
                      size: leading.size,
                      color: isDestructiveAction
                          ? cupertino.CupertinoColors.destructiveRed
                          : cupertino.CupertinoColors.activeBlue,
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

    throw Exception('unknown native platform');
  }
}
