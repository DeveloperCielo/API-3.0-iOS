//
//  EC3Customer.m
//  Pods
//
//  Created by Thiago Rodrigues de Paula on 28/09/16.
//
//

#import "EC3Customer.h"
#import "EC3JSONAdapter.h"

@implementation EC3Customer

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"name": @"Name",
             @"email": @"Email",
             @"birthDate": @"BirthDate",
             @"identity": @"Identity",
             @"identityType": @"IdentityType",
             @"address": @"Address",
             @"deliveryAddress": @"DeliveryAddress"
             };
}

+ (NSValueTransformer *)addressJSONTransformer {
    return [EC3JSONAdapter dictionaryTransformerWithModelClass:EC3Address.class];
}

+ (NSValueTransformer *)deliveryAddressJSONTransformer {
    return [EC3JSONAdapter dictionaryTransformerWithModelClass:EC3Address.class];
}

@end
