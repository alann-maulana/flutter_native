import 'package:flutter/widgets.dart';

import '../flutter_native.dart';

typedef NativeBuilder<T> = T Function(BuildContext context);

abstract class BaseNativeStatelessWidget<CUPERTINO extends Widget,
    MATERIAL extends Widget> extends StatelessWidget {
  const BaseNativeStatelessWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (platformWidget == PlatformWidget.cupertino) {
      return buildCupertino(context);
    }

    return buildMaterial(context);
  }

  CUPERTINO buildCupertino(BuildContext context);

  MATERIAL buildMaterial(BuildContext context);
}
