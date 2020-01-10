import 'package:flutter/widgets.dart';

import 'native_base.dart';

class NativeStatelessWidget extends BaseNativeStatelessWidget<Widget, Widget> {
  final NativeBuilder<Widget> material;
  final NativeBuilder<Widget> cupertino;

  const NativeStatelessWidget({
    Key key,
    @required this.material,
    @required this.cupertino,
  })  : assert(material != null),
        assert(cupertino != null),
        super(key: key);

  @override
  Widget buildMaterial(BuildContext context) {
    return material(context);
  }

  @override
  Widget buildCupertino(BuildContext context) {
    return cupertino(context);
  }
}
