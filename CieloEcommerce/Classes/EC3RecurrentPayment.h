//
//  EC3RecurrentPayment.h
//  Pods
//
//  Created by Thiago Rodrigues de Paula on 28/09/16.
//
//

#import <Foundation/Foundation.h>

typedef enum {
    Monthly,
    Bimonthly,
    Quarterly,
    SemiAnnual,
    Annual
} EC3RecurrentPaymentInterval;

@interface EC3RecurrentPayment : NSObject

@property BOOL authorizeNow;
@property NSString *endDate;
@property EC3RecurrentPaymentInterval interval;

@end
