//
//  EC3Address.m
//  Pods
//
//  Created by Thiago Rodrigues de Paula on 28/09/16.
//
//

#import "EC3Address.h"

@implementation EC3Address

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"street": @"Street",
             @"number": @"Number",
             @"complement": @"Complement",
             @"zipCode": @"ZipCode",
             @"city": @"City",
             @"state": @"State",
             @"country": @"Country"
             };
}

@end
