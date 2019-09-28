part of flutter_native;

class NativeListTile extends StatelessWidget {
  final bool firstIndex;
  final Widget leading;
  final Widget title;
  final Widget subtitle;
  final Widget trailing;
  final EdgeInsets contentPadding;
  final GestureTapCallback onTap;

  NativeListTile({
    this.firstIndex = false,
    this.leading,
    @required this.title,
    this.subtitle,
    this.trailing,
    this.contentPadding = const EdgeInsets.symmetric(
      horizontal: 16.0,
      vertical: 4.0,
    ),
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final children = <Widget>[];

    if (leading != null) {
      children.add(leading);
      children.add(SizedBox(width: 8.0));
    }

    if (subtitle == null) {
      children.add(Expanded(child: title));
    } else {
      children.add(
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              title,
              SizedBox(height: 4.0),
              subtitle,
            ],
          ),
        ),
      );
    }

    if (trailing != null) {
      children.add(SizedBox(width: 8.0));
      children.add(trailing);
    }

    final container = Container(
      decoration: BoxDecoration(
        color: cupertino.CupertinoColors.white,
        border: Border(
          top: firstIndex
              ? BorderSide(
                  color: cupertino.CupertinoColors.inactiveGray,
                  width: 0.0,
                )
              : BorderSide.none,
          bottom: BorderSide(
            color: cupertino.CupertinoColors.inactiveGray,
            width: 0.0,
          ),
        ),
      ),
      padding: contentPadding,
      child: Row(
        children: children,
      ),
    );

    if (Platform.isAndroid) {
      return material.InkWell(
        onTap: onTap,
        child: container,
      );
    }

    return GestureDetector(
      onTap: onTap,
      child: container,
    );
  }
}
