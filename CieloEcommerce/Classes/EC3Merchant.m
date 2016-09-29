//
//  EC3Merchant.m
//  Pods
//
//  Created by Thiago Rodrigues de Paula on 28/09/16.
//
//

#import "EC3Merchant.h"

@implementation EC3Merchant

- (id)initWithId:(NSString *)ID andKey:(NSString *)key {
    self = [super init];
    if (!self) return nil;
    
    _ID = ID;
    _key = key;
    
    return self;
}

+ (id)initWithId:(NSString *)ID andKey:(NSString *)key {
    return [[[self class] alloc] initWithId:ID andKey:key];
}

@end
