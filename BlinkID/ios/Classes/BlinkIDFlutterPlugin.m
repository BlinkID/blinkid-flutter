#import "BlinkIDFlutterPlugin.h"
#import <BlinkID/BlinkID.h>
#import "MicroblinkModule/Overlays/MBOverlayViewControllerDelegate.h"
#import "MicroblinkModule/Recognizers/MBRecognizerSerializers.h"
#import "MicroblinkModule/Overlays/MBOverlaySettingsSerializers.h"
#import "MBSerializationUtils.h"

@interface BlinkIDFlutterPlugin () <MBOverlayViewControllerDelegate, MBScanningRecognizerRunnerDelegate, MBFirstSideFinishedRecognizerRunnerDelegate>


@property (nonatomic, strong) MBRecognizerCollection *recognizerCollection;
@property (nonatomic, strong) MBRecognizerRunner *recognizerRunner;
@property (nonatomic, strong) NSString *backImageBase64String;

@property (nonatomic, strong) FlutterResult result;

@end

static NSString* const kChannelName = @"blinkid_scanner";
static NSString* const kScanWithCameraMethodName = @"scanWithCamera";
static NSString* const kScanWithDirectApiMethodName = @"scanWithDirectApi";

@implementation BlinkIDFlutterPlugin

+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
    FlutterMethodChannel* channel = [FlutterMethodChannel
                                     methodChannelWithName:kChannelName
                                     binaryMessenger:[registrar messenger]];
    BlinkIDFlutterPlugin* instance = [[BlinkIDFlutterPlugin alloc] init];
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

        @try {
            [self setLicenseKey:licenseKeyDict];
            [self scanWith:recognizerCollectionDict overlaySettingsDict:overlaySettingsDict];
        } @catch (NSException *exception) {
            self.result([FlutterError errorWithCode:exception.name
                                            message:exception.reason
                                            details:exception.userInfo]);
        }

    }
    else if ([kScanWithDirectApiMethodName isEqualToString:call.method]) {
        NSDictionary *recognizerCollectionDict = call.arguments[@"recognizerCollection"];
        NSString *frontImageBase64String = call.arguments[@"frontImage"];
        self.backImageBase64String = call.arguments[@"backImage"];
        NSDictionary *licenseKeyDict = call.arguments[@"license"];

        @try {
            [self setLicenseKey:licenseKeyDict];
            [self scanWithDirectApi:recognizerCollectionDict frontImageString:frontImageBase64String];
        } @catch (NSException *exception) {
            self.result([FlutterError errorWithCode:exception.name
                                            message:exception.reason
                                            details:exception.userInfo]);
        }

    }
    else {
        result(FlutterMethodNotImplemented);
    }
}

- (void)setLicenseKey:(NSDictionary *)licenseKeyDict {
    licenseKeyDict = [self sanitizeDictionary:licenseKeyDict];

    if ([licenseKeyDict objectForKey:@"showTrialLicenseWarning"] != nil) {
        BOOL showTrialLicenseWarning = [[licenseKeyDict objectForKey:@"showTrialLicenseWarning"] boolValue];
        [MBMicroblinkSDK sharedInstance].showTrialLicenseWarning = showTrialLicenseWarning;
    }

    NSString *iosLicense = [licenseKeyDict objectForKey:@"licenseKey"];
    if ([licenseKeyDict objectForKey:@"licensee"] != nil) {
        NSString *licensee = [licenseKeyDict objectForKey:@"licensee"];
        [[MBMicroblinkSDK sharedInstance] setLicenseKey:iosLicense andLicensee:licensee errorCallback:^(MBLicenseError licenseError) {
        }];
    } else {
        [[MBMicroblinkSDK sharedInstance] setLicenseKey:iosLicense errorCallback:^(MBLicenseError licenseError) {
        }];
    }
}

-(void)setLanguage:(NSDictionary *)overlaySettingsDict {
    if (overlaySettingsDict[@"language"] != nil) {
        if (overlaySettingsDict[@"country"] != nil && ![overlaySettingsDict[@"country"] isEqual: @""]) {
            MBMicroblinkApp.sharedInstance.language = [[(NSString *)overlaySettingsDict[@"language"] stringByAppendingString:@"-" ] stringByAppendingString:(NSString *)overlaySettingsDict[@"country"]];
        } else {
            MBMicroblinkApp.sharedInstance.language = overlaySettingsDict[@"language"];
        }
    }
}

- (void)scanWith:(NSDictionary *)recognizerCollectionDict overlaySettingsDict:(NSDictionary *)overlaySettingsDict {
    recognizerCollectionDict = [self sanitizeDictionary:recognizerCollectionDict];
    overlaySettingsDict = [self sanitizeDictionary:overlaySettingsDict];

    self.recognizerCollection = [[MBRecognizerSerializers sharedInstance] deserializeRecognizerCollection:recognizerCollectionDict];
    [self setLanguage:overlaySettingsDict];
    
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

//MARK: DirectAPI scanning
- (void)scanWithDirectApi:(NSDictionary *)recognizerCollectionDict frontImageString:(NSString *)frontImageString {
    [self setupRecognizerRunner:[self sanitizeDictionary:recognizerCollectionDict]];
    UIImage *frontImage = [self convertbase64ToImage:frontImageString];
    if (frontImageString != [NSNull null]) {
        UIImage *frontImage = [self convertbase64ToImage:frontImageString];
        if (!CGSizeEqualToSize(frontImage.size, CGSizeZero)) {
            [self processImage:frontImage];
        } else {
            [self handleDirectApiError:[FlutterError errorWithCode:@"" message:@"Could not decode the Base64 image!" details:nil]];
        }
    } else {
        [self handleDirectApiError:[FlutterError errorWithCode:@"" message:@"The provided image for the 'frontImage' parameter is empty!" details:nil]];
    }
}

- (void)recognizerRunnerDidFinishRecognitionOfFirstSide:(MBRecognizerRunner *)recognizerRunner {
    if (self.backImageBase64String != [NSNull null]) {
        UIImage *backImage = [self convertbase64ToImage:self.backImageBase64String];
        if (!CGSizeEqualToSize(backImage.size, CGSizeZero)) {
            [self processImage:backImage];
        } else {
            [self handleJsonResult];
        }
    } else {
        [self handleJsonResult];
    }
}

- (void)recognizerRunner:(nonnull MBRecognizerRunner *)recognizerRunner didFinishScanningWithState:(MBRecognizerResultState)state {
    dispatch_async(dispatch_get_main_queue(), ^{
        if (state == MBRecognizerResultStateValid || state == MBRecognizerResultStateUncertain) {
            [self handleJsonResult];
        } else if (state == MBRecognizerResultStateEmpty) {
            [self handleDirectApiError:[FlutterError errorWithCode:@"" message:@"Could not extract the information with DirectAPI!" details:nil]];
        }
    });
}

//setup the recognizer runner
- (void) setupRecognizerRunner:(NSDictionary *)jsonRecognizerCollection {
    self.recognizerCollection = [[MBRecognizerSerializers sharedInstance] deserializeRecognizerCollection:jsonRecognizerCollection];
    self.recognizerRunner = [[MBRecognizerRunner alloc] initWithRecognizerCollection:self.recognizerCollection];
    self.recognizerRunner.scanningRecognizerRunnerDelegate = self;
    self.recognizerRunner.metadataDelegates.firstSideFinishedRecognizerRunnerDelegate = self;
}

//Handle JSON results
- (void) handleJsonResult {
    BOOL isDocumentCaptureRecognizer = NO;
    NSMutableArray *arrayResults = [[NSMutableArray alloc] initWithCapacity:self.recognizerCollection.recognizerList.count];
    for (NSUInteger i = 0; i < self.recognizerCollection.recognizerList.count; ++i) {
        [arrayResults addObject:[[self.recognizerCollection.recognizerList objectAtIndex:i] serializeResult]];
    }

    if (!isDocumentCaptureRecognizer) {
        self.result([self serializeJSONObject:arrayResults]);
    }
    self.recognizerCollection = nil;
    self.recognizerRunner = nil;
}


//convert the image to MBImage and process it
- (void)processImage:(UIImage *)originalImage {
    MBImage *image = [MBImage imageWithUIImage:originalImage];
    image.cameraFrame = NO;
    image.orientation = MBProcessingOrientationLeft;
    dispatch_queue_t _serialQueue = dispatch_queue_create("com.microblink.DirectAPI", DISPATCH_QUEUE_SERIAL);
    dispatch_async(_serialQueue, ^{
        [self.recognizerRunner processImage:image];
    });
}

//convert image from base64 to UIImage
-(UIImage*)convertbase64ToImage:(NSString *)base64Image {
    NSData *imageData = [[NSData alloc] initWithBase64EncodedString:base64Image options:NSDataBase64DecodingIgnoreUnknownCharacters];
    if (imageData) {
        UIImage *image = [UIImage imageWithData:imageData];
        return image;
    } else {
        return [UIImage new];
    }
}

- (void) handleDirectApiError:(FlutterError*) flutterError {
    self.result(flutterError);
    self.result = nil;
    self.recognizerCollection = nil;
    self.recognizerRunner = nil;
}

@end