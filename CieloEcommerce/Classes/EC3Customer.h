//
//  EC3Customer.h
//  Pods
//
//  Created by Thiago Rodrigues de Paula on 28/09/16.
//
//

#import <Foundation/Foundation.h>
#import "EC3RequestModel.h"
#import "EC3Address.h"

@interface EC3Customer : EC3RequestModel

@property NSString *name;
@property NSString *email;
@property NSString *birthDate;
@property NSString *identity;
@property NSString *identityType;
@property EC3Address *address;
@property EC3Address *deliveryAddress;

@end
