import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_native/flutter_native.dart';

class FormDialog extends StatefulWidget {
  @override
  FormDialogState createState() {
    return new FormDialogState();
  }
}

class FormDialogState extends State<FormDialog> {
  _handleSave() {
    Navigator.pop(context, true);
  }

  @override
  Widget build(BuildContext context) {
    final form = Center(child: Text('FORM'));
    return new NativeScaffold(
        appBar: NativeAppBar(
          title: Text('Add New Form'),
          iosTrailing: NativeButton(
              child: Text('Save'),
              padding: const EdgeInsets.all(0.0),
              onPressed: _handleSave),
          androidActions: <Widget>[
            NativeIconButton(icon: Icon(Icons.save), onPressed: _handleSave)
          ],
        ),
        body: new NativeStatelessWidget(
          android: (context) => form,
          ios: (context) => SliverFillRemaining(child: form),
        ));
  }
}
