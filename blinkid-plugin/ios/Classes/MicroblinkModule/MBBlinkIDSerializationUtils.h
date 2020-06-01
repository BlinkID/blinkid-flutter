//
//  MBBlinkIDSerializationUtils.h
//  BlinkIdDevDemo
//
//  Created by DoDo on 04/06/2018.
//

#import <MicroBlink/MicroBlink.h>

#import <Foundation/Foundation.h>

@interface MBBlinkIDSerializationUtils : NSObject

+(NSDictionary * _Nonnull) serializeMrzResult:(MBMrzResult * _Nonnull)mrzResult;
+(MBImageExtensionFactors) deserializeMBImageExtensionFactors:(NSDictionary * _Nullable)jsonExtensionFactors;
+(NSDictionary * _Nonnull) serializeDriverLicenseDetailedInfo:(MBDriverLicenseDetailedInfo * _Nonnull)driverLicenseDetailedInfo;
+(NSDictionary * _Nonnull) serializeClassInfo:(MBClassInfo * _Nonnull)classInfo;

@end
