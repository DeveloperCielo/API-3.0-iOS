//
//  EC3Payment.h
//  Pods
//
//  Created by Thiago Rodrigues de Paula on 28/09/16.
//
//

#import <Foundation/Foundation.h>
#import "EC3RequestModel.h"
#import "EC3RecurrentPayment.h"
#import "EC3CreditCard.h"

typedef enum {
    Bradesco,
    BancoDoBrasil,
    Simulado
} EC3PaymentProvider;

typedef enum {
    CreditCard,
    DebitCard,
    ElectronicTransfer,
    Boleto
} EC3PaymentType;

typedef enum {
    BRL,
    USD,
    MXN,
    COP,
    CLP,
    ARS,
    PEN,
    EUR,
    PYN,
    UYU,
    VEB,
    VEF,
    GBP
} EC3PaymentCurrency;

@interface EC3Payment : EC3RequestModel

@property NSNumber *serviceTaxAmount;
@property NSNumber *installments;
@property NSString *interest;
@property BOOL capture;
@property BOOL authenticate;
@property BOOL recurrent;
@property EC3RecurrentPayment *recurrentPayment;
@property EC3CreditCard *creditCard;
@property NSString *tid;
@property NSString *proofOfSale;
@property NSString *authorizationCode;
@property NSString *softDescriptor;
@property NSString *returnUrl;
@property EC3PaymentProvider provider;
@property NSString *paymentId;
@property EC3PaymentType type;
@property NSNumber *amount;
@property NSString *receivedDate;
@property NSNumber *capturedAmount;
@property NSString *capturedDate;
@property EC3PaymentCurrency currency;
@property NSString *country;
@property NSString *returnCode;
@property NSString *returnMessage;
@property NSNumber *status;
@property NSArray *links;
@property NSArray *extraDataCollection;
@property NSString *expirationDate;
@property NSString *url;
@property NSString *number;
@property NSString *barCodeNumber;
@property NSString *digitableLine;
@property NSString *address;

@end
