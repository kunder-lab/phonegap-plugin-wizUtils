/* WizUtils - For all your wizarding needs!
 *
 * @author WizCorp Inc. [ Incorporated Wizards ] 
 * @copyright 2011
 * @file WizUtils.m for PhoneGap
 *
 */ 

#import "WizUtils.h"
#import "GlobalStore.h"
#import "WizDebugLog.h"


@implementation WizUtils





- (void)getDeviceHeight:(NSArray *)arguments withDict:(NSDictionary *)options {
    WizLog(@"[WizUtils] ******* getDeviceHeight ");
    
    NSString *callbackId = [arguments objectAtIndex:0];
    
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    int _height = screenRect.size.height;
    
    PluginResult* pluginResult = [PluginResult resultWithStatus:PGCommandStatus_OK messageAsInt:_height];
    
    [self writeJavascript: [pluginResult toSuccessCallbackString:callbackId]];
    
}


- (void)getDeviceWidth:(NSArray *)arguments withDict:(NSDictionary *)options {
    WizLog(@"[WizUtils] ******* getDeviceWidth ");
    
    NSString *callbackId = [arguments objectAtIndex:0];
    
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    int _width = screenRect.size.width;
    
    PluginResult* pluginResult = [PluginResult resultWithStatus:PGCommandStatus_OK messageAsInt:_width];
    
    [self writeJavascript: [pluginResult toSuccessCallbackString:callbackId]];
    
}


- (void)getBundleVersion:(NSArray*)arguments withDict:(NSDictionary*)options {
    WizLog(@"[WizUtils] ******* getBundleVersion ");
    
    NSString *callbackId = [arguments objectAtIndex:0];
    
    // Get the main bundle for the app.
    NSDictionary* infoDict = [[NSBundle mainBundle] infoDictionary];
    
    // Get version string
    NSString* ver = [infoDict objectForKey:@"CFBundleVersion"];
    
    PluginResult* pluginResult = [PluginResult resultWithStatus:PGCommandStatus_OK messageAsString:ver];
    
    [self writeJavascript: [pluginResult toSuccessCallbackString:callbackId]];
    
    
}

- (void)getBundleIdentifier:(NSArray*)arguments withDict:(NSDictionary*)options {
    WizLog(@"[WizUtils] ******* getBundleIdentifier ");
    
    NSString *callbackId = [arguments objectAtIndex:0];
    
    // Get bundle identifier string
    NSString* bundleIdent = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleIdentifier"];
    
    PluginResult* pluginResult = [PluginResult resultWithStatus:PGCommandStatus_OK messageAsString:bundleIdent];
    
    [self writeJavascript: [pluginResult toSuccessCallbackString:callbackId]];
    
}

- (void)getBundleDisplayName:(NSArray*)arguments withDict:(NSDictionary*)options{
    WizLog(@"[WizUtils] ******* getBundleDisplayName ");
    
    NSString *callbackId = [arguments objectAtIndex:0];
    
    // Get display name string
    NSString* dispName = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleDisplayName"];
    
    PluginResult* pluginResult = [PluginResult resultWithStatus:PGCommandStatus_OK messageAsString:dispName];
    
    [self writeJavascript: [pluginResult toSuccessCallbackString:callbackId]];
    
}


+ (NSString*) stringWithUUID {
    CFUUIDRef uuidObj = CFUUIDCreate(nil);//create a new UUID
    //get the string representation of the UUID
    NSString *uuidString = (NSString*)CFUUIDCreateString(nil, uuidObj);
    CFRelease(uuidObj);
    return [uuidString autorelease];
}


+ (NSString*) deviceId {
    UIDevice *device = [UIDevice currentDevice];
    NSString *uniqueIdentifier = [device uniqueIdentifier];
    return uniqueIdentifier;
    
}



- (void)setSplashInBackground:(NSArray*)arguments withDict:(NSDictionary*)options
{
    Store* myStore = [Store sharedStore];
    myStore.enableSplashOnGotoBackground = [[arguments objectAtIndex:1]boolValue];
    WizLog(@"[WizUtils] ******* setSplashInBackground %i", myStore.enableSplashOnGotoBackground);
    
    
}


@end