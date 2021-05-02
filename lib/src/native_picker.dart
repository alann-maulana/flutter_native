import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../flutter_native.dart';
import 'popup_utils.dart';

class NativePicker {
  static Future<DateTime> pickerDate({
    @required BuildContext context,
    @required DateTime initialDate,
    @required DateTime firstDate,
    @required DateTime lastDate,
    String title = 'Select Date',
  }) async {
    if (platformWidget == PlatformWidget.cupertino) {
      DateTime _dateTime = initialDate;
      return await PopupUtils.showRoundedBottomSheet<DateTime>(
        context: context,
        title: title,
        body: CupertinoDatePicker(
          onDateTimeChanged: (dateTime) {
            _dateTime = dateTime;
          },
          initialDateTime: initialDate,
          minimumDate: firstDate,
          maximumDate: lastDate,
          mode: CupertinoDatePickerMode.date,
        ),
        dismiss: Material(
          color: CupertinoColors.white,
          child: ListTile(
            onTap: () => Navigator.pop(
              context,
              _dateTime,
            ),
            title: Text(
              'SELECT',
              textAlign: TextAlign.center,
              style: TextStyle(color: Theme.of(context).primaryColor),
            ),
          ),
        ),
      );
    }

    return showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: firstDate,
      lastDate: lastDate,
    );
  }

  static Future<TimeOfDay> pickerTime({
    String title = 'Select Time',
    @required BuildContext context,
    @required TimeOfDay initialTime,
    int minuteInterval = 15,
  }) async {
    if (platformWidget == PlatformWidget.cupertino) {
      final now = DateTime.now();
      DateTime _dateTime = DateTime(
        now.year,
        now.month,
        now.day,
        initialTime.hour,
        initialTime.minute,
      );
      await PopupUtils.showRoundedBottomSheet(
        title: title,
        body: CupertinoDatePicker(
          onDateTimeChanged: (dateTime) {
            _dateTime = dateTime;
          },
          initialDateTime: _dateTime,
          mode: CupertinoDatePickerMode.time,
          minuteInterval: minuteInterval,
          use24hFormat: true,
        ),
        context: context,
      );
      return TimeOfDay.fromDateTime(_dateTime);
    }

    return showTimePicker(
      context: context,
      initialTime: initialTime,
      builder: (BuildContext context, Widget child) => MediaQuery(
        data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
        child: child,
      ),
    );
  }

  static Future<TimeRange> pickerTimeRange({
    String title = 'Select Time Range',
    @required BuildContext context,
    @required TimeRange initialRange,
    int minuteInterval = 15,
  }) async {
    final now = DateTime.now();
    DateTime _dateTime = DateTime(
      now.year,
      now.month,
      now.day,
      initialRange.start.hour,
      initialRange.start.minute,
    );
    DateTime _dateTime2 = DateTime(
      now.year,
      now.month,
      now.day,
      initialRange.end.hour,
      initialRange.end.minute,
    );
    final range = await PopupUtils.showRoundedBottomSheet(
      title: title,
      body: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: CupertinoDatePicker(
              onDateTimeChanged: (dateTime) {
                _dateTime = dateTime;
              },
              initialDateTime: _dateTime,
              mode: CupertinoDatePickerMode.time,
              minuteInterval: minuteInterval,
              use24hFormat: true,
            ),
          ),
          Expanded(
            child: CupertinoDatePicker(
              onDateTimeChanged: (dateTime) {
                _dateTime2 = dateTime;
              },
              initialDateTime: _dateTime2,
              mode: CupertinoDatePickerMode.time,
              minuteInterval: minuteInterval,
              use24hFormat: true,
            ),
          )
        ],
      ),
      context: context,
      dismiss: InkWell(
        onTap: () => Navigator.pop(
          context,
          TimeRange(
            start: TimeOfDay.fromDateTime(_dateTime),
            end: TimeOfDay.fromDateTime(_dateTime2),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Text(
            'SELECT',
            textAlign: TextAlign.center,
            style: TextStyle(color: Theme.of(context).primaryColor),
          ),
        ),
      ),
      isScrollControlled: true,
    );

    return range;
  }
}

class TimeRange {
  TimeRange({@required this.start, @required this.end});

  TimeRange.fromString(String range) {
    final splits = range.split('-');
    if (splits.length != 2) {
      return;
    }

    final String start = splits.first;
    var hourMinute = start.contains('.')
        ? start.split('.')
        : start.contains(':')
            ? start.split(':')
            : <String>[];
    if (hourMinute.length == 2) {
      this.start = TimeOfDay(
        hour: int.tryParse(hourMinute.first) ?? 0,
        minute: int.tryParse(hourMinute[1]) ?? 0,
      );
    }

    final String end = splits[1];
    hourMinute = end.contains('.')
        ? end.split('.')
        : end.contains(':')
            ? end.split(':')
            : [];
    if (hourMinute.length == 2) {
      this.end = TimeOfDay(
        hour: int.tryParse(hourMinute.first) ?? 0,
        minute: int.tryParse(hourMinute[1]) ?? 0,
      );
    }
  }

  TimeOfDay start;
  TimeOfDay end;

  String _addLeadingZeroIfNeeded(int value) {
    if (value < 10) {
      return '0$value';
    }
    return value.toString();
  }

  String startDesc() {
    final String hourLabel = _addLeadingZeroIfNeeded(start.hour);
    final String minuteLabel = _addLeadingZeroIfNeeded(start.minute);

    return '$hourLabel.$minuteLabel';
  }

  String endDesc() {
    final String hourLabel = _addLeadingZeroIfNeeded(end.hour);
    final String minuteLabel = _addLeadingZeroIfNeeded(end.minute);

    return '$hourLabel.$minuteLabel';
  }

  @override
  String toString() {
    return '${startDesc()}-${endDesc()}';
  }
}
