//
//  EC3Sale.h
//  Pods
//
//  Created by Thiago Rodrigues de Paula on 28/09/16.
//
//

#import <Foundation/Foundation.h>
#import "EC3RequestModel.h"
#import "EC3Customer.h"
#import "EC3Payment.h"

@interface EC3Sale : EC3RequestModel

@property NSString *merchantOrderId;
@property EC3Customer *customer;
@property EC3Payment *payment;

@end
