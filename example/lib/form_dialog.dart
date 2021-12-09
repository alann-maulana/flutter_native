import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_native/flutter_native.dart';

class FormDialog extends StatefulWidget {
  const FormDialog({Key key}) : super(key: key);

  @override
  FormDialogState createState() {
    return FormDialogState();
  }
}

class FormDialogState extends State<FormDialog> {
  _handleSave() {
    Navigator.pop(context, true);
  }

  @override
  Widget build(BuildContext context) {
    const form = Center(child: Text('FORM'));
    return NativeScaffold(
      appBar: NativeAppBar(
        title: const Text('Add New Form'),
        iosTrailing: NativeButton(
          child: const Text('Save'),
          padding: const EdgeInsets.all(0.0),
          onPressed: _handleSave,
        ),
        androidActions: <Widget>[
          NativeIconButton(
            icon: const Icon(Icons.save),
            onPressed: _handleSave,
          )
        ],
      ),
      body: NativeStatelessWidget(
        material: (context) => form,
        cupertino: (context) => const SliverFillRemaining(child: form),
      ),
    );
  }
}
