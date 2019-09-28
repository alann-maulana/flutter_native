part of flutter_native;

class NativeIconButton extends StatefulWidget {
  final VoidCallback onPressed;
  final Widget icon;
  final Color color;
  final Color disabledColor;
  final double iconSize;
  final EdgeInsetsGeometry padding;

  NativeIconButton({
    @required this.icon,
    @required this.onPressed,
    this.color,
    this.disabledColor,
    this.iconSize = 24.0,
    this.padding,
  });

  @override
  _NativeIconButtonState createState() {
    return _NativeIconButtonState();
  }
}

class _NativeIconButtonState extends State<NativeIconButton> {
  @override
  Widget build(BuildContext context) {
    if (Platform.isAndroid) {
      return material.IconButton(
        icon: widget.icon,
        iconSize: widget.iconSize,
        onPressed: widget.onPressed,
        color: widget.color,
        disabledColor: widget.disabledColor,
        padding: widget.padding ?? const EdgeInsets.all(8.0),
      );
    }

    return cupertino.CupertinoButton(
      child: widget.icon,
      minSize: widget.iconSize,
      onPressed: widget.onPressed,
      color: widget.color,
      disabledColor: widget.disabledColor,
      padding: widget.padding ?? const EdgeInsets.all(0.0),
    );
  }
}
