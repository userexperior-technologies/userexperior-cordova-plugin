#import <Cordova/CDVPlugin.h>

@interface CDVUserExperior : CDVPlugin

- (void)startRecording:(CDVInvokedUrlCommand*)command;
- (void)setCustomTag:(CDVInvokedUrlCommand*)command;
- (void)setUserIdentifier:(CDVInvokedUrlCommand*)command;
- (void)resumeRecording:(CDVInvokedUrlCommand*)command;
- (void)pauseRecording:(CDVInvokedUrlCommand*)command;
- (void)stopRecording:(CDVInvokedUrlCommand*)command;
- (BOOL)getOptOutStatus:(CDVInvokedUrlCommand*)command;
- (void)optOut:(CDVInvokedUrlCommand*)command;
- (void)optIn:(CDVInvokedUrlCommand*)command;
- (void)consent:(CDVInvokedUrlCommand*)command;
- (void)startScreen:(CDVInvokedUrlCommand*)command;
- (void)startTimer:(CDVInvokedUrlCommand*)command;
- (void)stopTimer:(CDVInvokedUrlCommand*)command;

@end
