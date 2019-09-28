part of flutter_native;

class NativeProgressIndicator extends StatefulWidget {
  final double radius;
  final double androidValue;
  final double androidStrokeWidth;
  final Color androidBackgroundColor;
  final Animation<Color> androidValueColor;

  NativeProgressIndicator({
    this.radius = 10.0,
    this.androidValue,
    this.androidBackgroundColor,
    this.androidValueColor,
    this.androidStrokeWidth = 4.0,
  });

  @override
  _NativeProgressIndicatorState createState() {
    return _NativeProgressIndicatorState();
  }
}

class _NativeProgressIndicatorState extends State<NativeProgressIndicator> {
  @override
  Widget build(BuildContext context) {
    if (Platform.isAndroid) {
      return Container(
        width: widget.radius * 2.5,
        height: widget.radius * 2.5,
        child: material.CircularProgressIndicator(
          value: widget.androidValue,
          backgroundColor: widget.androidBackgroundColor,
          valueColor: widget.androidValueColor,
          strokeWidth: widget.androidStrokeWidth,
        ),
      );
    }

    return cupertino.CupertinoActivityIndicator(
      radius: widget.radius,
    );
  }
}
