part of flutter_native;

class NativeSwitch extends StatefulWidget {
  final bool value;
  final ValueChanged<bool> onChanged;
  final Color activeColor;
  final Color activeTrackColor;
  final Color inactiveThumbColor;
  final Color inactiveTrackColor;
  final ImageProvider activeThumbImage;
  final ImageProvider inactiveThumbImage;
  final material.MaterialTapTargetSize materialTapTargetSize;

  const NativeSwitch({
    Key key,
    @required this.value,
    @required this.onChanged,
    this.activeColor,
    this.activeTrackColor,
    this.inactiveThumbColor,
    this.inactiveTrackColor,
    this.activeThumbImage,
    this.inactiveThumbImage,
    this.materialTapTargetSize,
  }) : super(key: key);

  @override
  _NativeSwitchState createState() {
    return _NativeSwitchState();
  }
}

class _NativeSwitchState extends State<NativeSwitch> {
  @override
  Widget build(BuildContext context) {
    return material.Switch.adaptive(
      value: widget.value,
      onChanged: widget.onChanged,
      activeColor: widget.activeColor,
      inactiveThumbColor: widget.inactiveThumbColor,
      inactiveTrackColor: widget.activeTrackColor,
      activeThumbImage: widget.activeThumbImage,
      inactiveThumbImage: widget.inactiveThumbImage,
      materialTapTargetSize: widget.materialTapTargetSize,
    );
  }
}
