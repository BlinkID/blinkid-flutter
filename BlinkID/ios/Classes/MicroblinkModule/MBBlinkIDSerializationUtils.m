//
//  MBBlinkIDSerializationUtils.m
//  BlinkIdDevDemo
//
//  Created by DoDo on 04/06/2018.
//

#import "MBBlinkIDSerializationUtils.h"
#import "MBSerializationUtils.h"

@implementation MBBlinkIDSerializationUtils

+(NSDictionary *) serializeMrzResult:(MBMrzResult *)mrzResult {
    return @{
        @"documentType" : [NSNumber numberWithInteger:(mrzResult.documentType + 1)],
        @"primaryId" : mrzResult.primaryID,
        @"secondaryId" : mrzResult.secondaryID,
        @"issuer" : mrzResult.issuer,
        @"dateOfBirth" : [MBSerializationUtils serializeMBDateResult:mrzResult.dateOfBirth],
        @"documentNumber" : mrzResult.documentNumber,
        @"nationality" : mrzResult.nationality,
        @"gender" : mrzResult.gender,
        @"documentCode" : mrzResult.documentCode,
        @"dateOfExpiry" : [MBSerializationUtils serializeMBDateResult:mrzResult.dateOfExpiry],
        @"opt1" : mrzResult.opt1,
        @"opt2" : mrzResult.opt2,
        @"alienNumber" : mrzResult.alienNumber,
        @"applicationReceiptNumber" : mrzResult.applicationReceiptNumber,
        @"immigrantCaseNumber" : mrzResult.immigrantCaseNumber,
        @"mrzText" : mrzResult.mrzText,
        @"mrzParsed" : [NSNumber numberWithBool:mrzResult.isParsed],
        @"mrzVerified" : [NSNumber numberWithBool:mrzResult.isVerified],
        @"sanitizedOpt1" : mrzResult.sanitizedOpt1,
        @"sanitizedOpt2" : mrzResult.sanitizedOpt2,
        @"sanitizedNationality" : mrzResult.sanitizedNationality,
        @"sanitizedIssuer" : mrzResult.sanitizedIssuer,
        @"sanitizedDocumentCode" : mrzResult.sanitizedDocumentCode,
        @"sanitizedDocumentNumber" : mrzResult.sanitizedDocumentNumber,
        @"age" : [NSNumber numberWithInteger:mrzResult.age]
     };
}

+(MBImageExtensionFactors) deserializeMBImageExtensionFactors:(NSDictionary *)jsonExtensionFactors {
    if (jsonExtensionFactors == nil) {
        return MBMakeImageExtensionFactors(0.f, 0.f, 0.f, 0.f);
    } else {
        return MBMakeImageExtensionFactors(
            [(NSNumber*)[jsonExtensionFactors valueForKey:@"upFactor"] floatValue],
            [(NSNumber*)[jsonExtensionFactors valueForKey:@"rightFactor"] floatValue],
            [(NSNumber*)[jsonExtensionFactors valueForKey:@"downFactor"] floatValue],
            [(NSNumber*)[jsonExtensionFactors valueForKey:@"leftFactor"] floatValue]
        );
    }
}

+(NSDictionary *) serializeDriverLicenseDetailedInfo:(MBDriverLicenseDetailedInfo *)driverLicenseDetailedInfo {
    return @{
             @"restrictions" : driverLicenseDetailedInfo.restrictions,
             @"endorsements" : driverLicenseDetailedInfo.endorsements,
             @"vehicleClass" : driverLicenseDetailedInfo.vehicleClass,
             };
}

+(NSDictionary *) serializeClassInfo:(MBClassInfo *)classInfo {
    return @{
             @"country" : [NSNumber numberWithInteger:(classInfo.country + 1)],
             @"region" : [NSNumber numberWithInteger:(classInfo.region + 1)],
             @"type" : [NSNumber numberWithInteger:(classInfo.type + 1)],
             };
}

@end
