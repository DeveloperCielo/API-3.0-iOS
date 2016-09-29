//
//  EC3Merchant.h
//  Pods
//
//  Created by Thiago Rodrigues de Paula on 28/09/16.
//
//

#import <Foundation/Foundation.h>

@interface EC3Merchant : NSObject

@property (readonly) NSString *ID;
@property (readonly) NSString *key;

+(id) initWithId:(NSString *)ID andKey:(NSString *)key;

@end
