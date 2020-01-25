library flutter_native;

import 'src/platform/platform.dart';

export 'src/native_action_sheet.dart';
export 'src/native_app.dart';
export 'src/native_appbar.dart';
export 'src/native_base.dart';
export 'src/native_button.dart';
export 'src/native_dialog.dart';
export 'src/native_icon_button.dart';
export 'src/native_list_tile.dart';
export 'src/native_list_view.dart';
export 'src/native_page_route.dart';
export 'src/native_picker.dart';
export 'src/native_progress_indicator.dart';
export 'src/native_refresh_list_view.dart';
export 'src/native_scaffold.dart';
export 'src/native_switch.dart';
export 'src/native_tab_scaffold.dart';
export 'src/native_textfield.dart';
export 'src/native_value.dart';
export 'src/native_widget.dart';

Platform defaultTargetPlatform;

PlatformWidget defaultTargetPlatformWidget;

PlatformWidget get platformWidget {
  if (defaultTargetPlatformWidget != null) {
    return defaultTargetPlatformWidget;
  }

  final platform = defaultTargetPlatform ?? Platform();

  if (platform.isIOS || platform.isMacOS) {
    return PlatformWidget.cupertino;
  }

  return PlatformWidget.material;
}

enum PlatformWidget { material, cupertino }
