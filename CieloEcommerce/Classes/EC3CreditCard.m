//
//  EC3CreditCard.m
//  Pods
//
//  Created by Thiago Rodrigues de Paula on 28/09/16.
//
//

#import "EC3CreditCard.h"

@implementation EC3CreditCard

- (id)init {
    if (self = [super init]) {
        _saveCard = false;
    }
    return self;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"cardNumber": @"CardNumber",
             @"holder": @"Holder",
             @"expirationDate": @"ExpirationDate",
             @"securityCode": @"SecurityCode",
             @"saveCard": @"SaveCard",
             @"brand": @"Brand",
             @"cardToken": @"CardToken"
             };
};

@end
