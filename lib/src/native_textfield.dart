part of flutter_native;

class NativeTextField extends _NativeStatefulWidget<
    cupertino.CupertinoTextField, material.TextField> {
  NativeTextField({
    this.androidData = const NativeTextFieldDataAndroid(),
    this.iosData = const NativeTextFieldDataIOS(),
  });

  final NativeTextFieldDataAndroid androidData;
  final NativeTextFieldDataIOS iosData;

  @override
  material.TextField buildAndroid(cupertino.BuildContext context) {
    return material.TextField(
      key: androidData.key,
      controller: androidData.controller,
      focusNode: androidData.focusNode,
      decoration: androidData.decoration,
      keyboardType: androidData.keyboardType,
      textInputAction: androidData.textInputAction,
      textCapitalization: androidData.textCapitalization,
      style: androidData.style,
      strutStyle: androidData.strutStyle,
      textAlign: androidData.textAlign,
      textAlignVertical: androidData.textAlignVertical,
      textDirection: androidData.textDirection,
      readOnly: androidData.readOnly,
      showCursor: androidData.showCursor,
      autofocus: androidData.autofocus,
      obscureText: androidData.obscureText,
      autocorrect: androidData.autocorrect,
      maxLines: androidData.maxLines,
      minLines: androidData.minLines,
      expands: androidData.expands,
      maxLength: androidData.maxLength,
      maxLengthEnforced: androidData.maxLengthEnforced,
      onChanged: androidData.onChanged,
      onEditingComplete: androidData.onEditingComplete,
      onSubmitted: androidData.onSubmitted,
      inputFormatters: androidData.inputFormatters,
      enabled: androidData.enabled,
      cursorWidth: androidData.cursorWidth,
      cursorRadius: androidData.cursorRadius,
      cursorColor: androidData.cursorColor,
      keyboardAppearance: androidData.keyboardAppearance,
      scrollPadding: androidData.scrollPadding,
      dragStartBehavior: androidData.dragStartBehavior,
      enableInteractiveSelection: androidData.enableInteractiveSelection,
      onTap: androidData.onTap,
      buildCounter: androidData.buildCounter,
      scrollController: androidData.scrollController,
      scrollPhysics: androidData.scrollPhysics,
    );
  }

  @override
  cupertino.CupertinoTextField buildIOS(cupertino.BuildContext context) {
    return cupertino.CupertinoTextField(
      key: iosData.key,
      controller: iosData.controller,
      focusNode: iosData.focusNode,
      decoration: iosData.decoration,
      padding: iosData.padding,
      placeholder: iosData.placeholder,
      placeholderStyle: iosData.placeholderStyle,
      prefix: iosData.prefix,
      prefixMode: iosData.prefixMode,
      suffix: iosData.suffix,
      suffixMode: iosData.suffixMode,
      clearButtonMode: iosData.clearButtonMode,
      keyboardType: iosData.keyboardType,
      textInputAction: iosData.textInputAction,
      textCapitalization: iosData.textCapitalization,
      style: iosData.style,
      strutStyle: iosData.strutStyle,
      textAlign: iosData.textAlign,
      readOnly: iosData.readOnly,
      showCursor: iosData.showCursor,
      autofocus: iosData.autofocus,
      obscureText: iosData.obscureText,
      autocorrect: iosData.autocorrect,
      maxLines: iosData.maxLines,
      minLines: iosData.minLines,
      expands: iosData.expands,
      maxLength: iosData.maxLength,
      maxLengthEnforced: iosData.maxLengthEnforced,
      onChanged: iosData.onChanged,
      onEditingComplete: iosData.onEditingComplete,
      onSubmitted: iosData.onSubmitted,
      inputFormatters: iosData.inputFormatters,
      enabled: iosData.enabled,
      cursorWidth: iosData.cursorWidth,
      cursorRadius: iosData.cursorRadius,
      cursorColor: iosData.cursorColor,
      keyboardAppearance: iosData.keyboardAppearance,
      scrollPadding: iosData.scrollPadding,
      dragStartBehavior: iosData.dragStartBehavior,
      enableInteractiveSelection: iosData.enableInteractiveSelection,
      scrollController: iosData.scrollController,
      scrollPhysics: iosData.scrollPhysics,
    );
  }
}

class NativeTextFieldDataIOS {
  // Value extracted via color reader from iOS simulator.
  static const BorderSide _kDefaultRoundedBorderSide = BorderSide(
    color: cupertino.CupertinoColors.lightBackgroundGray,
    style: BorderStyle.solid,
    width: 0.0,
  );

  static const Border _kDefaultRoundedBorder = Border(
    top: _kDefaultRoundedBorderSide,
    bottom: _kDefaultRoundedBorderSide,
    left: _kDefaultRoundedBorderSide,
    right: _kDefaultRoundedBorderSide,
  );

  // Counted manually on magnified simulator.
  static const BoxDecoration _kDefaultRoundedBorderDecoration = BoxDecoration(
    border: _kDefaultRoundedBorder,
    borderRadius: BorderRadius.all(Radius.circular(4.0)),
  );

  // Value extracted via color reader from iOS simulator.
  static const Color _kSelectionHighlightColor = Color(0x667FAACF);
  static const Color _kInactiveTextColor = Color(0xFFC2C2C2);
  static const Color _kDisabledBackground = Color(0xFFFAFAFA);

  const NativeTextFieldDataIOS({
    this.key,
    this.controller,
    this.focusNode,
    this.decoration = _kDefaultRoundedBorderDecoration,
    this.padding = const EdgeInsets.all(6.0),
    this.placeholder,
    this.placeholderStyle = const TextStyle(
        fontWeight: FontWeight.w300,
        color: _kInactiveTextColor
    ),
    this.prefix,
    this.prefixMode = cupertino.OverlayVisibilityMode.always,
    this.suffix,
    this.suffixMode = cupertino.OverlayVisibilityMode.always,
    this.clearButtonMode = cupertino.OverlayVisibilityMode.never,
    TextInputType keyboardType,
    this.textInputAction,
    this.textCapitalization = TextCapitalization.none,
    this.style,
    this.strutStyle,
    this.textAlign = TextAlign.start,
    this.readOnly = false,
    this.showCursor,
    this.autofocus = false,
    this.obscureText = false,
    this.autocorrect = true,
    this.maxLines = 1,
    this.minLines,
    this.expands = false,
    this.maxLength,
    this.maxLengthEnforced = true,
    this.onChanged,
    this.onEditingComplete,
    this.onSubmitted,
    this.inputFormatters,
    this.enabled,
    this.cursorWidth = 2.0,
    this.cursorRadius = const Radius.circular(2.0),
    this.cursorColor,
    this.keyboardAppearance,
    this.scrollPadding = const EdgeInsets.all(20.0),
    this.dragStartBehavior = DragStartBehavior.start,
    this.enableInteractiveSelection,
    this.scrollController,
    this.scrollPhysics,
  }) : keyboardType = keyboardType ??
      (maxLines == 1 ? TextInputType.text : TextInputType.multiline);

  final Key key;
  final TextEditingController controller;
  final FocusNode focusNode;
  final BoxDecoration decoration;
  final EdgeInsetsGeometry padding;
  final String placeholder;
  final TextStyle placeholderStyle;
  final Widget prefix;
  final cupertino.OverlayVisibilityMode prefixMode;
  final Widget suffix;
  final cupertino.OverlayVisibilityMode suffixMode;
  final cupertino.OverlayVisibilityMode clearButtonMode;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final TextCapitalization textCapitalization;
  final TextStyle style;
  final StrutStyle strutStyle;
  final TextAlign textAlign;
  final bool readOnly;
  final bool showCursor;
  final bool autofocus;
  final bool obscureText;
  final bool autocorrect;
  final int maxLines;
  final int minLines;
  final bool expands;
  final int maxLength;
  final bool maxLengthEnforced;
  final ValueChanged<String> onChanged;
  final VoidCallback onEditingComplete;
  final ValueChanged<String> onSubmitted;
  final List<TextInputFormatter> inputFormatters;
  final bool enabled;
  final double cursorWidth;
  final Radius cursorRadius;
  final Color cursorColor;
  final Brightness keyboardAppearance;
  final EdgeInsets scrollPadding;
  final bool enableInteractiveSelection;
  final DragStartBehavior dragStartBehavior;
  final ScrollController scrollController;
  final ScrollPhysics scrollPhysics;
}

class NativeTextFieldDataAndroid {
  const NativeTextFieldDataAndroid({
    this.key,
    this.controller,
    this.focusNode,
    this.decoration = const material.InputDecoration(),
    TextInputType keyboardType,
    this.textInputAction,
    this.textCapitalization = material.TextCapitalization.none,
    this.style,
    this.strutStyle,
    this.textAlign = TextAlign.start,
    this.textAlignVertical,
    this.textDirection,
    this.readOnly = false,
    this.showCursor,
    this.autofocus = false,
    this.obscureText = false,
    this.autocorrect = true,
    this.maxLines = 1,
    this.minLines,
    this.expands = false,
    this.maxLength,
    this.maxLengthEnforced = true,
    this.onChanged,
    this.onEditingComplete,
    this.onSubmitted,
    this.inputFormatters,
    this.enabled,
    this.cursorWidth = 2.0,
    this.cursorRadius,
    this.cursorColor,
    this.keyboardAppearance,
    this.scrollPadding = const EdgeInsets.all(20.0),
    this.dragStartBehavior = DragStartBehavior.start,
    this.enableInteractiveSelection,
    this.onTap,
    this.buildCounter,
    this.scrollController,
    this.scrollPhysics,
  }) : keyboardType = keyboardType ??
            (maxLines == 1 ? TextInputType.text : TextInputType.multiline);

  final Key key;
  final TextEditingController controller;
  final FocusNode focusNode;
  final material.InputDecoration decoration;
  final TextInputType keyboardType;
  final material.TextInputAction textInputAction;
  final material.TextCapitalization textCapitalization;
  final TextStyle style;
  final StrutStyle strutStyle;
  final TextAlign textAlign;
  final material.TextAlignVertical textAlignVertical;
  final TextDirection textDirection;
  final bool autofocus;
  final bool obscureText;
  final bool autocorrect;
  final int maxLines;
  final int minLines;
  final bool expands;
  final bool readOnly;
  final bool showCursor;
  final int maxLength;
  final bool maxLengthEnforced;
  final ValueChanged<String> onChanged;
  final VoidCallback onEditingComplete;
  final ValueChanged<String> onSubmitted;
  final List<TextInputFormatter> inputFormatters;
  final bool enabled;
  final double cursorWidth;
  final Radius cursorRadius;
  final Color cursorColor;
  final Brightness keyboardAppearance;
  final EdgeInsets scrollPadding;
  final bool enableInteractiveSelection;
  final DragStartBehavior dragStartBehavior;
  final GestureTapCallback onTap;
  final material.InputCounterWidgetBuilder buildCounter;
  final ScrollPhysics scrollPhysics;
  final ScrollController scrollController;
}
