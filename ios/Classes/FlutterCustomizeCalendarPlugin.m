#import "FlutterCustomizeCalendarPlugin.h"
#if __has_include(<flutter_customize_calendar/flutter_customize_calendar-Swift.h>)
#import <flutter_customize_calendar/flutter_customize_calendar-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "flutter_customize_calendar-Swift.h"
#endif

@implementation FlutterCustomizeCalendarPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftFlutterCustomizeCalendarPlugin registerWithRegistrar:registrar];
}
@end
