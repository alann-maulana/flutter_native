import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native/flutter_native.dart';

const double _kPickerSheetHeight = 216.0;

class PopupUtils {
  static Widget buildBottomPicker(Widget picker) {
    return Container(
      height: _kPickerSheetHeight,
      padding: const EdgeInsets.only(top: 6.0),
      color: CupertinoColors.white,
      child: DefaultTextStyle(
        style: const TextStyle(
          color: CupertinoColors.black,
          fontSize: 22.0,
        ),
        child: GestureDetector(
          // Blocks taps from propagating to the modal sheet and popping.
          onTap: () {},
          child: SafeArea(
            top: false,
            child: picker,
          ),
        ),
      ),
    );
  }

  static Future<T> showRoundedBottomSheetList<T>({
    @required BuildContext context,
    @required String title,
    @required List<ListTile> items,
    ListTile cancel,
  }) async {
    return showRoundedBottomSheet<T>(
      context: (context),
      title: title,
      body: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: items,
      ),
      dismiss: cancel,
    );
  }

  static Future<T> showRoundedBottomSheet<T>({
    @required BuildContext context,
    @required String title,
    @required Widget body,
    bool isScrollControlled,
    Widget dismiss,
  }) async {
    final shape = RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(16),
        topRight: Radius.circular(16),
      ),
    );

    final children = <Widget>[
      Padding(
        padding: const EdgeInsets.only(
          top: 16,
          left: 16,
          right: 16,
          bottom: 8,
        ),
        child: Text(
          title,
          style: Theme.of(context).textTheme.headline6,
          textAlign: defaultTargetPlatformWidget == PlatformWidget.cupertino
              ? TextAlign.center
              : null,
        ),
      ),
      Divider(),
    ];

    body = (body is CupertinoDatePicker) || (body is Row)
        ? Container(height: _kPickerSheetHeight, child: body)
        : body;
    children.add(body);
    if (dismiss != null) {
      children.addAll([
        Divider(height: 0),
        dismiss,
      ]);
    } else {
      children.add(SizedBox(height: 8));
    }

    final devicePixelRatio = MediaQuery.of(context).devicePixelRatio;
    isScrollControlled ??= devicePixelRatio <= 2.0;
    final child = Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: children,
    );

    return showModalBottomSheet<T>(
      context: (context),
      shape: shape,
      isScrollControlled: isScrollControlled,
      builder: (context) => Material(
        shape: shape,
        color: Colors.white,
        child: SafeArea(
          child:
              isScrollControlled ? SingleChildScrollView(child: child) : child,
        ),
      ),
    );
  }
}
