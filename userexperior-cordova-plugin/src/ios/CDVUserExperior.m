#import "CDVUserExperior.h"
@import UserExperiorSDK;

@implementation CDVUserExperior

- (void)startRecording:(CDVInvokedUrlCommand *)command {
    CDVPluginResult* pluginResult = nil;
    NSString* apiKey = command.arguments[0];
    
    if (apiKey.length > 0) {
        NSLog(@"UserExperior 4.1.29 initiated with given key %@ via cordova", apiKey);
        [UserExperior initialize:apiKey];
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
    } else {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
    }
    
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)setCustomTag:(CDVInvokedUrlCommand*)command {
    CDVPluginResult *pluginResult = nil;
    NSString *tag = command.arguments[0];
    NSString *type = command.arguments[1];

    if (tag.length>0 && type.length>0) {
        [UserExperior setCustomTagWithString:tag customType:type];
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
        [UserExperior startScreen:screenName];
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
    [UserExperior stopRecording];

    [self.commandDelegate sendPluginResult:[CDVPluginResult resultWithStatus:CDVCommandStatus_OK] callbackId:command.callbackId];
}

- (void)consent:(CDVInvokedUrlCommand*)command {
    [UserExperior consent];

    [self.commandDelegate sendPluginResult:[CDVPluginResult resultWithStatus:CDVCommandStatus_OK] callbackId:command.callbackId];
}

- (void)optIn:(CDVInvokedUrlCommand*)command {
    [UserExperior optIn];

    [self.commandDelegate sendPluginResult:[CDVPluginResult resultWithStatus:CDVCommandStatus_OK] callbackId:command.callbackId];
}

- (void)optOut:(CDVInvokedUrlCommand*)command {
    [UserExperior optOut];

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
        [UserExperior startTimer:timerName];
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
        [UserExperior stopTimer:timerName];
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
    } else {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
    }

    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

// - (void)endTimerWithProperties:(CDVInvokedUrlCommand*)command {
//     CDVPluginResult* pluginResult = nil;
//     NSString* timerName = command.arguments[0];
//     NSDictionary* properties = command.arguments[1];

//     if (timerName.length>0 && [properties isKindOfClass:NSDictionary.class]) {
//         [UserExperior stopTimer:timerName properties:properties];
        
//         pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
//     } else {
//         pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
//     }

//     [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
// }

- (void)setUserProperties:(CDVInvokedUrlCommand*)command {
    CDVPluginResult* pluginResult = nil;
    NSDictionary* properties = command.arguments[0];
    if ([properties isKindOfClass:NSDictionary.class] {
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
    if (eventName.length>0) {
        [UserExperior logEvent:eventName];
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

    if (eventName.length>0 && [properties isKindOfClass:NSDictionary.class]) {
        [UserExperior logEvent:eventName properties:properties];
        
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
    } else {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
    }

    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)logMessage:(CDVInvokedUrlCommand*)command {
    CDVPluginResult* pluginResult = nil;
    NSString* messageName = command.arguments[0];
    if (messageName.length>0) {
        [UserExperior logMessage:messageName];
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

    if (messageName.length>0 && [properties isKindOfClass:NSDictionary.class]) {
        [UserExperior logMessage:messageName properties:properties];
        
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
    } else {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
    }

    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}



@end

