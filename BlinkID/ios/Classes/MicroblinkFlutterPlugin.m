#import "MicroblinkFlutterPlugin.h"
#import "Microblink/Microblink.h"
#import "MicroblinkModule/Overlays/MBOverlayViewControllerDelegate.h"
#import "MicroblinkModule/Recognizers/MBRecognizerSerializers.h"
#import "MicroblinkModule/Overlays/MBOverlaySettingsSerializers.h"
#import "MBSerializationUtils.h"

@interface MicroblinkFlutterPlugin () <MBOverlayViewControllerDelegate>

@property (nonatomic, strong) MBRecognizerCollection *recognizerCollection;

@property (nonatomic, strong) FlutterResult result;

@end

static NSString* const kChannelName = @"microblink_scanner";
static NSString* const kScanWithCameraMethodName = @"scanWithCamera";

@implementation MicroblinkFlutterPlugin

+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
    FlutterMethodChannel* channel = [FlutterMethodChannel
                                     methodChannelWithName:kChannelName
                                     binaryMessenger:[registrar messenger]];
    MicroblinkFlutterPlugin* instance = [[MicroblinkFlutterPlugin alloc] init];
    [registrar addMethodCallDelegate:instance channel:channel];
}

/**
 Method  sanitizes the dictionary replaces all occurances of NSNull with nil

 @param dictionary JSON objects
 @return new dictionary with NSNull values replaced with nil
 */
- (NSDictionary *)sanitizeDictionary:(NSDictionary *)dictionary {
    NSMutableDictionary *mutableDictionary = [[NSMutableDictionary alloc] initWithDictionary:dictionary];
    for (NSString* key in dictionary.allKeys) {
        if (mutableDictionary[key] == [NSNull null]) {
            mutableDictionary[key] = nil;
        }
    }
    return mutableDictionary;
}

- (NSString *) serializeJSONObject:(id) object {
    NSData *data = [NSJSONSerialization dataWithJSONObject:object options:NSJSONWritingPrettyPrinted error:nil];
    return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
    self.result = result;
    
    if ([kScanWithCameraMethodName isEqualToString:call.method]) {
        NSDictionary *recognizerCollectionDict = call.arguments[@"recognizerCollection"];
        NSDictionary *overlaySettingsDict = call.arguments[@"overlaySettings"];
        NSDictionary *licenseKeyDict = call.arguments[@"license"];
        
        [self setLicenseKey:licenseKeyDict];
        [self scanWith:recognizerCollectionDict overlaySettingsDict:overlaySettingsDict];
    }
    else {
        result(FlutterMethodNotImplemented);
    }
}

- (void)setLicenseKey:(NSDictionary *)licenseKeyDict {
    licenseKeyDict = [self sanitizeDictionary:licenseKeyDict];
    
    if ([licenseKeyDict objectForKey:@"showTimeLimitedLicenseKeyWarning"] != nil) {
        BOOL showTimeLimitedLicenseKeyWarning = [[licenseKeyDict objectForKey:@"showTimeLimitedLicenseKeyWarning"] boolValue];
        [MBMicroblinkSDK sharedInstance].showLicenseKeyTimeLimitedWarning = showTimeLimitedLicenseKeyWarning;
    }
    
    NSString *iosLicense = [licenseKeyDict objectForKey:@"licenseKey"];
    if ([licenseKeyDict objectForKey:@"licensee"] != nil) {
        NSString *licensee = [licenseKeyDict objectForKey:@"licensee"];
        [[MBMicroblinkSDK sharedInstance] setLicenseKey:iosLicense andLicensee:licensee];
    } else {
        [[MBMicroblinkSDK sharedInstance] setLicenseKey:iosLicense];
    }
}

- (void)scanWith:(NSDictionary *)recognizerCollectionDict overlaySettingsDict:(NSDictionary *)overlaySettingsDict {
    recognizerCollectionDict = [self sanitizeDictionary:recognizerCollectionDict];
    overlaySettingsDict = [self sanitizeDictionary:overlaySettingsDict];
    
    self.recognizerCollection = [[MBRecognizerSerializers sharedInstance] deserializeRecognizerCollection:recognizerCollectionDict];
    
    MBOverlayViewController *overlayVC = [[MBOverlaySettingsSerializers sharedInstance] createOverlayViewController:overlaySettingsDict recognizerCollection:self.recognizerCollection delegate:self];
    
    UIViewController<MBRecognizerRunnerViewController>* recognizerRunnerViewController = [MBViewControllerFactory recognizerRunnerViewControllerWithOverlayViewController:overlayVC];
    
    UIViewController *rootViewController = (UINavigationController *) UIApplication.sharedApplication.keyWindow.rootViewController;
    
    recognizerRunnerViewController.modalPresentationStyle = UIModalPresentationFullScreen;
    [rootViewController presentViewController:recognizerRunnerViewController animated:YES completion:nil];
}

- (void)overlayViewControllerDidFinishScanning:(MBOverlayViewController *)overlayViewController state:(MBRecognizerResultState)state {
    if (state != MBRecognizerResultStateEmpty) {
        [overlayViewController.recognizerRunnerViewController pauseScanning];
        // recognizers within self.recognizerCollection now have their results filled

        BOOL isDocumentCaptureRecognizer = NO;

        NSMutableArray *arrayResults = [[NSMutableArray alloc] initWithCapacity:self.recognizerCollection.recognizerList.count];
        for (NSUInteger i = 0; i < self.recognizerCollection.recognizerList.count; ++i) {
            [arrayResults addObject:[[self.recognizerCollection.recognizerList objectAtIndex:i] serializeResult]];
        }

        if (!isDocumentCaptureRecognizer) {
            self.result([self serializeJSONObject:arrayResults]);
        }

        // dismiss recognizer runner view controller
        dispatch_async(dispatch_get_main_queue(), ^{
            UIViewController *rootViewController = UIApplication.sharedApplication.keyWindow.rootViewController;
            [rootViewController dismissViewControllerAnimated:YES completion:nil];
            
            self.recognizerCollection = nil;
            self.result = nil;
        });
    }
}

- (void)overlayDidTapClose:(MBOverlayViewController *)overlayViewController {
    UIViewController *rootViewController = UIApplication.sharedApplication.keyWindow.rootViewController;
    [rootViewController dismissViewControllerAnimated:YES completion:nil];
    
    self.recognizerCollection = nil;
    self.result(@"null");
    self.result = nil;
}

@end