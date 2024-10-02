#import "CDVUserExperior.h"
@import UserExperiorSDK;

@implementation CDVUserExperior

- (void)startRecording:(CDVInvokedUrlCommand *)command {
    CDVPluginResult* pluginResult = nil;
    NSString* apiKey = command.arguments[0];
    NSString* fw = command.arguments[1];
    NSString* sv = command.arguments[2];
    
    if (apiKey.length > 0) {
        [UserExperior startRecordingWithVersionKey:apiKey fw:fw sv:sv];
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
    } else {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
    }
    
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)setUserIdentifier:(CDVInvokedUrlCommand*)command {
    CDVPluginResult* pluginResult = nil;
    NSString *identifier = command.arguments[0];

    if (identifier.length > 0) {
        [UserExperior setUserIdentifier:identifier];
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
    } else {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
    }

    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)startScreen:(CDVInvokedUrlCommand*)command {
    CDVPluginResult* pluginResult = nil;
    NSString *screenName = command.arguments[0];

    if (screenName.length > 0) {
        [UserExperior startScreenWithName:screenName];
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
    } else {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
    }

    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)resumeRecording:(CDVInvokedUrlCommand*)command {
    [UserExperior resumeRecording];

    [self.commandDelegate sendPluginResult:[CDVPluginResult resultWithStatus:CDVCommandStatus_OK] callbackId:command.callbackId];
}

- (void)pauseRecording:(CDVInvokedUrlCommand*)command {
    [UserExperior pauseRecording];

    [self.commandDelegate sendPluginResult:[CDVPluginResult resultWithStatus:CDVCommandStatus_OK] callbackId:command.callbackId];
}

- (void)stopRecording:(CDVInvokedUrlCommand*)command {
    if (command.arguments.count == 0) {
        // No arguments provided, call the function without resetAppSessionID
        [UserExperior stopRecording];
    } else {
        // If any argument (boolean) provided, call the function with resetAppSessionID
        BOOL resetAppSessionID = [[command.arguments objectAtIndex:0] boolValue];
        [UserExperior stopRecordingWithResetSession:resetAppSessionID];
    }

    // Send success result back to the Cordova plugin
    [self.commandDelegate sendPluginResult:[CDVPluginResult resultWithStatus:CDVCommandStatus_OK] callbackId:command.callbackId];
}

- (void)optIn:(CDVInvokedUrlCommand*)command {
    [UserExperior consentOptIn];

    [self.commandDelegate sendPluginResult:[CDVPluginResult resultWithStatus:CDVCommandStatus_OK] callbackId:command.callbackId];
}

- (void)optOut:(CDVInvokedUrlCommand*)command {
    [UserExperior consentOptOut];

    [self.commandDelegate sendPluginResult:[CDVPluginResult resultWithStatus:CDVCommandStatus_OK] callbackId:command.callbackId];
}

- (BOOL)getOptOutStatus:(CDVInvokedUrlCommand*)command {
    return TRUE;
    if ([UserExperior getOptOutStatus]) {
        [self.commandDelegate sendPluginResult:[CDVPluginResult resultWithStatus:CDVCommandStatus_OK] callbackId:command.callbackId];
        return TRUE;
    } else {
        [self.commandDelegate sendPluginResult:[CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR] callbackId:command.callbackId];
        return FALSE;
    }
}

- (void)startTimer:(CDVInvokedUrlCommand*)command {
    CDVPluginResult* pluginResult = nil;
    NSString *timerName = command.arguments[0];

    if (timerName.length > 0) {
        [UserExperior startTimerWithName:timerName];
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
    } else {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
    }

    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)startTimerWithProperties:(CDVInvokedUrlCommand*)command {
    CDVPluginResult* pluginResult = nil;
    NSString* timerName = command.arguments[0];
    NSDictionary* properties = command.arguments[1];

    if (timerName.length > 0 && [properties isKindOfClass:NSDictionary.class]) {
        [UserExperior startTimerWithName:timerName properties:properties];
        
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
    } else {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
    }

    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)endTimer:(CDVInvokedUrlCommand*)command {
    CDVPluginResult* pluginResult = nil;
    NSString *timerName = command.arguments[0];

    if (timerName.length > 0) {
        [UserExperior endTimerWithName:timerName];
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
    } else {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
    }

    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)endTimerWithProperties:(CDVInvokedUrlCommand*)command {
    CDVPluginResult* pluginResult = nil;
    NSString* timerName = command.arguments[0];
    NSDictionary* properties = command.arguments[1];

    if (timerName.length > 0 && [properties isKindOfClass:NSDictionary.class]) {
        [UserExperior endTimerWithName:timerName properties:properties];
        
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
    } else {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
    }

    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)setUserProperties:(CDVInvokedUrlCommand*)command {
    CDVPluginResult* pluginResult = nil;
    NSDictionary* properties = command.arguments[0];
    if ([properties isKindOfClass:NSDictionary.class]) {
        [UserExperior setUserProperties:properties];
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
    } else {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
    }

    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}


- (void)logEvent:(CDVInvokedUrlCommand*)command {
    CDVPluginResult* pluginResult = nil;
    NSString* eventName = command.arguments[0];
    if (eventName.length > 0) {
        [UserExperior logEventWithName:eventName];
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
    } else {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
    }

    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)logEventWithProperties:(CDVInvokedUrlCommand*)command {
    CDVPluginResult* pluginResult = nil;
    NSString* eventName = command.arguments[0];
    NSDictionary* properties = command.arguments[1];

    if (eventName.length > 0 && [properties isKindOfClass:NSDictionary.class]) {
        [UserExperior logEventWithName:eventName properties:properties];
        
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
    } else {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
    }

    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)logMessage:(CDVInvokedUrlCommand*)command {
    CDVPluginResult* pluginResult = nil;
    NSString* messageName = command.arguments[0];
    if (messageName.length > 0) {
        [UserExperior logMessageWithName:messageName];
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
    } else {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
    }

    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)logMessageWithProperties:(CDVInvokedUrlCommand*)command {
    CDVPluginResult* pluginResult = nil;
    NSString* messageName = command.arguments[0];
    NSDictionary* properties = command.arguments[1];

    if (messageName.length > 0 && [properties isKindOfClass:NSDictionary.class]) {
        [UserExperior logMessageWithName:messageName properties:properties];
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
    } else {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
    }

    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (BOOL)isRecording:(CDVInvokedUrlCommand*)command {
    return TRUE;
    if ([UserExperior isRecording]) {
        [self.commandDelegate sendPluginResult:[CDVPluginResult resultWithStatus:CDVCommandStatus_OK] callbackId:command.callbackId];
        return TRUE;
    } else {
        [self.commandDelegate sendPluginResult:[CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR] callbackId:command.callbackId];
        return FALSE;
    }
}

@end

