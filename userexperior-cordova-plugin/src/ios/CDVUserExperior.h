#import <Cordova/CDVPlugin.h>

@interface CDVUserExperior : CDVPlugin

- (void)startRecording:(CDVInvokedUrlCommand*)command;
// - (void)setCustomTag:(CDVInvokedUrlCommand*)command;
- (void)setUserIdentifier:(CDVInvokedUrlCommand*)command;
- (void)resumeRecording:(CDVInvokedUrlCommand*)command;
- (void)pauseRecording:(CDVInvokedUrlCommand*)command;
- (void)stopRecording:(CDVInvokedUrlCommand*)command;
- (BOOL)getOptOutStatus:(CDVInvokedUrlCommand*)command;
- (void)optOut:(CDVInvokedUrlCommand*)command;
- (void)optIn:(CDVInvokedUrlCommand*)command;
// - (void)consent:(CDVInvokedUrlCommand*)command;
- (void)startScreen:(CDVInvokedUrlCommand*)command;
- (void)startTimer:(CDVInvokedUrlCommand*)command;
- (void)startTimerWithProperties:(CDVInvokedUrlCommand*)command;
- (void)endTimer:(CDVInvokedUrlCommand*)command;
- (void)endTimerWithProperties:(CDVInvokedUrlCommand*)command;
- (void)setUserProperties:(CDVInvokedUrlCommand*)command;
- (void)logEvent:(CDVInvokedUrlCommand*)command;
- (void)logEventWithProperties:(CDVInvokedUrlCommand*)command;
- (void)logMessage:(CDVInvokedUrlCommand*)command;
- (void)logMessageWithProperties:(CDVInvokedUrlCommand*)command;
- (BOOL)isRecording:(CDVInvokedUrlCommand*)command;


@end
