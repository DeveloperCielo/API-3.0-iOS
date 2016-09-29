//
//  EC3Sale.m
//  Pods
//
//  Created by Thiago Rodrigues de Paula on 28/09/16.
//
//

#import "EC3Sale.h"
#import "EC3JSONAdapter.h"

@implementation EC3Sale

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"merchantOrderId": @"MerchantOrderId",
             @"customer": @"Customer",
             @"payment": @"Payment"
             };
}

+ (NSValueTransformer *)customerJSONTransformer {
    return [EC3JSONAdapter dictionaryTransformerWithModelClass:EC3Customer.class];
}

+ (NSValueTransformer *)paymentJSONTransformer {
    return [EC3JSONAdapter dictionaryTransformerWithModelClass:EC3Payment.class];
}

@end
