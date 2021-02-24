import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_customize_calendar/flutter_customize_calendar.dart';

void main() {
  const MethodChannel channel = MethodChannel('flutter_customize_calendar');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await FlutterCustomizeCalendar.platformVersion, '42');
  });
}
