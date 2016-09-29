//
//  EC3Address.h
//  Pods
//
//  Created by Thiago Rodrigues de Paula on 28/09/16.
//
//

#import <Foundation/Foundation.h>
#import "EC3RequestModel.h"

@interface EC3Address : EC3RequestModel

@property NSString *street;
@property NSString *number;
@property NSString *complement;
@property NSString *zipCode;
@property NSString *city;
@property NSString *state;
@property NSString *country;

@end
