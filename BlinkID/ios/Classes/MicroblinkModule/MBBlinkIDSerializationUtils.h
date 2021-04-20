//
//  MBBlinkIDSerializationUtils.h
//  BlinkIdDevDemo
//
//  Created by DoDo on 04/06/2018.
//

#import <Microblink/Microblink.h>

#import <Foundation/Foundation.h>

@interface MBBlinkIDSerializationUtils : NSObject

+(NSDictionary * _Nonnull) serializeMrzResult:(MBMrzResult * _Nonnull)mrzResult;
+(MBImageExtensionFactors) deserializeMBImageExtensionFactors:(NSDictionary * _Nullable)jsonExtensionFactors;
+(NSDictionary * _Nonnull) serializeDriverLicenseDetailedInfo:(MBDriverLicenseDetailedInfo * _Nonnull)driverLicenseDetailedInfo;
+(NSDictionary * _Nonnull) serializeClassInfo:(MBClassInfo * _Nonnull)classInfo;
+(NSDictionary * _Nonnull) serializeVizResult:(MBVizResult * _Nonnull)vizResult;
+(NSDictionary * _Nonnull) serializeBarcodeResult:(MBBarcodeResult * _Nonnull)barcodeResult;
+(NSDictionary * _Nonnull) serializeImageAnalysisResult:(MBImageAnalysisResult * _Nonnull)imageAnalysisResult;
+(MBRecognitionModeFilter * _Nonnull) deserializeMBRecognitionModeFilter:(NSDictionary * _Nullable)jsonRecognitionModeFilter;
+(NSDictionary * _Nonnull) serializeBarcodeElements:(MBBarcodeElements * _Nonnull)extendedElements;
+(NSArray<NSString *> *) serializeBarcodeElementsValues:(MBBarcodeElements *)extendedElements;

@end