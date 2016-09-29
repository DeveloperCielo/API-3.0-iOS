//
//  EC3Payment.m
//  Pods
//
//  Created by Thiago Rodrigues de Paula on 28/09/16.
//
//

#import "EC3Payment.h"

@implementation EC3Payment

- (id)init {
    if (self = [super init]) {
        _capture = NO;
        _authenticate = NO;
        _softDescriptor = @"";
        _currency = BRL;
    }
    return self;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"serviceTaxAmount": @"ServiceTaxAmount",
             @"installments": @"Installments",
             @"interest": @"Interest",
             @"capture": @"Capture",
             @"authenticate": @"Authenticate",
             @"recurrent": @"Recurrent",
             @"creditCard": @"CreditCard",
             @"tid": @"Tid",
             @"proofOfSale": @"ProofOfSale",
             @"authorizationCode": @"AuthorizationCode",
             @"softDescriptor": @"SoftDescriptor",
             @"returnUrl": @"ReturnUrl",
             @"provider": @"Provider",
             @"paymentId": @"PaymentId",
             @"type": @"Type",
             @"amount": @"Amount",
             @"receivedDate": @"ReceiveDate",
             @"capturedAmount": @"CapturedAmount",
             @"capturedDate": @"CapturedDate",
             @"currency": @"Currency",
             @"country": @"Country",
             @"returnCode": @"ReturnCode",
             @"returnMessage": @"ReturnMessage",
             @"status": @"Status",
             @"links": @"Links",
             @"extraDataCollection": @"ExtraDataCollection",
             @"expirationDate": @"ExpirationDate",
             @"url": @"Url",
             @"number": @"Number",
             @"barCodeNumber": @"BarCodeNumber",
             @"digitableLine": @"DigitableLine",
             @"address": @"Address"
             };
}

+ (NSValueTransformer *)creditCardJSONTransformer {
    return [EC3JSONAdapter dictionaryTransformerWithModelClass:EC3CreditCard.class];
}

+ (NSValueTransformer *)interestJSONTransformer {
    return [MTLValueTransformer transformerUsingForwardBlock:^id(id value, BOOL *success, NSError *__autoreleasing *error) {
        if ([value isKindOfClass:NSNumber.class]) return nil;
        
        return value;
    } reverseBlock:^id(id value, BOOL *success, NSError *__autoreleasing *error) {
        return value;
    }];
}

+ (NSValueTransformer *)providerJSONTransformer {
    NSDictionary *providerDict = @{
                                   @"Bradesco": @(Bradesco),
                                   @"BancoDoBrasil": @(BancoDoBrasil),
                                   @"Simulado": @(Simulado)
                                   };
    
    return [NSValueTransformer mtl_valueMappingTransformerWithDictionary:providerDict];
}

+ (NSValueTransformer *)typeJSONTransformer {
    NSDictionary *typeDict = @{
                                   @"CreditCard": @(CreditCard),
                                   @"DebitCard": @(DebitCard),
                                   @"ElectronicTransfer": @(ElectronicTransfer),
                                   @"Boleto": @(Boleto)
                                   };
    
    return [NSValueTransformer mtl_valueMappingTransformerWithDictionary:typeDict];
}

+ (NSValueTransformer *)currencyJSONTransformer {
    NSDictionary *currencyDict = @{
                                   @"BRL": @(BRL),
                                   @"USD": @(USD),
                                   @"MXN": @(MXN),
                                   @"COP": @(COP),
                                   @"CLP": @(CLP),
                                   @"ARS": @(ARS),
                                   @"PEN": @(PEN),
                                   @"EUR": @(EUR),
                                   @"PYN": @(PYN),
                                   @"UYU": @(UYU),
                                   @"VEB": @(VEB),
                                   @"VEF": @(VEF),
                                   @"GBP": @(GBP)
                                   };
    
    return [NSValueTransformer mtl_valueMappingTransformerWithDictionary:currencyDict];
}

@end
