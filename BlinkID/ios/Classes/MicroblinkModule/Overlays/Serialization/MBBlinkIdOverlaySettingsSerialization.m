//
//  MBBlinkIdOverlaySettingsSerialization.m
//  BlinkIdDevDemo
//
//  Created by DoDo on 04/06/2018.
//

#import "MBBlinkIdOverlaySettingsSerialization.h"
#import "MBOverlaySerializationUtils.h"

@interface MBBlinkIdOverlaySettingsSerialization ()

@property (nonatomic, weak) id<MBOverlayViewControllerDelegate> delegate;

@end

@implementation MBBlinkIdOverlaySettingsSerialization

@synthesize jsonName = _jsonName;

-(instancetype) init {
    self = [super init];
    if (self) {
        _jsonName = @"BlinkIdOverlaySettings";
    }
    return self;
}

-(MBOverlayViewController *) createOverlayViewController:(NSDictionary *)jsonOverlaySettings recognizerCollection:(MBRecognizerCollection*)recognizerCollection delegate:(id<MBOverlayViewControllerDelegate>) delegate {
    // no settings deserialized at the moment
    MBBlinkIdOverlaySettings *sett = [[MBBlinkIdOverlaySettings alloc] init];
    self.delegate = delegate;
    [MBOverlaySerializationUtils extractCommonOverlaySettings:jsonOverlaySettings overlaySettings:sett];

    {
        id firstSideInstructionsText = [jsonOverlaySettings valueForKey:@"firstSideInstructionsText"];
        if (firstSideInstructionsText != nil && firstSideInstructionsText != NSNull.null) {
            sett.firstSideInstructionsText = (NSString *)firstSideInstructionsText;
        }
    }

    {
        id flipInstructions = [jsonOverlaySettings valueForKey:@"flipInstructions"];
        if (flipInstructions != nil && flipInstructions != NSNull.null) {
            sett.flipInstructions = (NSString *)flipInstructions;
        }
    }

    {
        id errorMoveCloser = [jsonOverlaySettings valueForKey:@"errorMoveCloser"];
        if (errorMoveCloser != nil && errorMoveCloser != NSNull.null) {
            sett.errorMoveCloser = (NSString *)errorMoveCloser;
        }
    }

    {
        id errorMoveFarther = [jsonOverlaySettings valueForKey:@"errorMoveFarther"];
        if (errorMoveFarther != nil && errorMoveFarther != NSNull.null) {
            sett.errorMoveFarther = (NSString *)errorMoveFarther;
        }
    }

    {
        id sidesNotMatchingTitle = [jsonOverlaySettings valueForKey:@"sidesNotMatchingTitle"];
        if (sidesNotMatchingTitle != nil && sidesNotMatchingTitle != NSNull.null) {
            sett.sidesNotMatchingTitle = (NSString *)sidesNotMatchingTitle;
        }
    }

    {
        id sidesNotMatchingMessage = [jsonOverlaySettings valueForKey:@"sidesNotMatchingMessage"];
        if (sidesNotMatchingMessage != nil && sidesNotMatchingMessage != NSNull.null) {
            sett.sidesNotMatchingMessage = (NSString *)sidesNotMatchingMessage;
        }
    }

    {
        id unsupportedDocumentTitle = [jsonOverlaySettings valueForKey:@"unsupportedDocumentTitle"];
        if (unsupportedDocumentTitle != nil && unsupportedDocumentTitle != NSNull.null) {
            sett.unsupportedDocumentTitle = (NSString *)unsupportedDocumentTitle;
        }
    }

    {
        id unsupportedDocumentMessage = [jsonOverlaySettings valueForKey:@"unsupportedDocumentMessage"];
        if (unsupportedDocumentMessage != nil && unsupportedDocumentMessage != NSNull.null) {
            sett.unsupportedDocumentMessage = (NSString *)unsupportedDocumentMessage;
        }
    }

    {
        id recognitionTimeoutTitle = [jsonOverlaySettings valueForKey:@"recognitionTimeoutTitle"];
        if (recognitionTimeoutTitle != nil && recognitionTimeoutTitle != NSNull.null) {
            sett.recognitionTimeoutTitle = (NSString *)recognitionTimeoutTitle;
        }
    }

    {
        id recognitionTimeoutMessage = [jsonOverlaySettings valueForKey:@"recognitionTimeoutMessage"];
        if (recognitionTimeoutMessage != nil && recognitionTimeoutMessage != NSNull.null) {
            sett.recognitionTimeoutMessage = (NSString *)recognitionTimeoutMessage;
        }
    }

    {
        id retryButtonText = [jsonOverlaySettings valueForKey:@"retryButtonText"];
        if (retryButtonText != nil && retryButtonText != NSNull.null) {
            sett.retryButtonText = (NSString *)retryButtonText;
        }
    }

    {
        id requireDocumentSidesDataMatch = [jsonOverlaySettings valueForKey:@"requireDocumentSidesDataMatch"];
        if (requireDocumentSidesDataMatch != nil && requireDocumentSidesDataMatch != NSNull.null) {
            sett.requireDocumentSidesDataMatch = [requireDocumentSidesDataMatch boolValue];
        }
    }

    {
        id showNotSupportedDialog = [jsonOverlaySettings valueForKey:@"showNotSupportedDialog"];
        if (showNotSupportedDialog != nil && showNotSupportedDialog != NSNull.null) {
            sett.showNotSupportedDialog = [showNotSupportedDialog boolValue];
        }
    }

    {
        id showFlashlightWarning = [jsonOverlaySettings valueForKey:@"showFlashlightWarning"];
        if (showFlashlightWarning != nil && showFlashlightWarning != NSNull.null) {
            sett.showFlashlightWarning = [showFlashlightWarning boolValue];
        }
    }

    {
        id backSideScanningTimeoutMilliseconds = [jsonOverlaySettings valueForKey:@"backSideScanningTimeoutMilliseconds"];
        if (backSideScanningTimeoutMilliseconds != nil && backSideScanningTimeoutMilliseconds != NSNull.null) {
            sett.backSideScanningTimeout = [backSideScanningTimeoutMilliseconds doubleValue] / 1000.0;
        }
    }

    {
        id scanBarcodeText = [jsonOverlaySettings valueForKey:@"scanBarcodeText"];
        if (scanBarcodeText != nil && scanBarcodeText != NSNull.null) {
            sett.scanBarcodeText = (NSString *)scanBarcodeText;
        }
    }

    {
        id errorDocumentTooCloseToEdge = [jsonOverlaySettings valueForKey:@"errorDocumentTooCloseToEdge"];
        if (errorDocumentTooCloseToEdge != nil && errorDocumentTooCloseToEdge != NSNull.null) {
            sett.errorDocumentTooCloseToEdge = (NSString *)errorDocumentTooCloseToEdge;
        }
    }

    return [[MBBlinkIdOverlayViewController alloc] initWithSettings:sett recognizerCollection:recognizerCollection delegate:self];
}


- (void)blinkIdOverlayViewControllerDidFinishScanning:(nonnull MBBlinkIdOverlayViewController *)blinkIdOverlayViewController state:(MBRecognizerResultState)state {
    [self.delegate overlayViewControllerDidFinishScanning:blinkIdOverlayViewController state:state];
}

- (void)blinkIdOverlayViewControllerDidTapClose:(nonnull MBBlinkIdOverlayViewController *)blinkIdOverlayViewController {
    [self.delegate overlayDidTapClose:blinkIdOverlayViewController];
}

@end
