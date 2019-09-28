part of flutter_native;

class NativeButton extends StatefulWidget {
  final VoidCallback onPressed;
  final Widget child;
  final Color color;
  final Color disabledColor;
  final EdgeInsetsGeometry padding;
  final double iosMinSize;

  NativeButton({
    @required this.child,
    @required this.onPressed,
    this.color,
    this.disabledColor,
    this.padding,
    this.iosMinSize = 8.0,
  });

  @override
  _NativeButtonState createState() {
    return _NativeButtonState();
  }
}

class _NativeButtonState extends State<NativeButton> {
  @override
  Widget build(BuildContext context) {
    if (Platform.isAndroid) {
      return material.RaisedButton(
        child: widget.child,
        onPressed: widget.onPressed,
        color: widget.color,
        disabledColor: widget.disabledColor,
        padding: widget.padding,
      );
    }

    return cupertino.CupertinoButton(
      child: widget.child,
      onPressed: widget.onPressed,
      color: widget.color,
      disabledColor: widget.disabledColor,
      padding: widget.padding,
      minSize: widget.iosMinSize,
    );
  }
}
