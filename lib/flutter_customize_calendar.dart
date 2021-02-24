
import 'dart:async';

import 'package:flutter/services.dart';

class FlutterCustomizeCalendar {
  static const MethodChannel _channel =
      const MethodChannel('flutter_customize_calendar');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
