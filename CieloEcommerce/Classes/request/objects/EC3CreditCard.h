//
//  EC3CreditCard.h
//  Pods
//
//  Created by Thiago Rodrigues de Paula on 28/09/16.
//
//

#import <Foundation/Foundation.h>
#import "EC3RequestModel.h"

@interface EC3CreditCard : EC3RequestModel

@property NSString *cardNumber;
@property NSString *holder;
@property NSString *expirationDate;
@property NSString *securityCode;
@property BOOL saveCard;
@property NSString *brand;
@property NSString *cardToken;

@end
