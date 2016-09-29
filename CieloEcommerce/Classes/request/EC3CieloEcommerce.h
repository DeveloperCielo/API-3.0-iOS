//
//  EC3AbstractSaleRequest.h
//  Pods
//
//  Created by Thiago Rodrigues de Paula on 28/09/16.
//
//

#import <Foundation/Foundation.h>

#import "EC3Merchant.h"
#import "EC3Environment.h"
#import "EC3Sale.h"

typedef void (^EC3RequestSuccessBlock) (EC3Sale *sale);
typedef void (^EC3RequestFailureBlock) (NSError *error, NSHTTPURLResponse* httpResponse);

@interface EC3CieloEcommerce : NSObject

@property (readonly) EC3Merchant *merchant;
@property (readonly) EC3Environment *environment;

- (id)initWithMerchant:(EC3Merchant *)merchant
        andEnvironment:(EC3Environment *)environment;

- (void)createSale:(EC3Sale *)sale success:(EC3RequestSuccessBlock)success failure:(EC3RequestFailureBlock)failure;

- (void)querySale:(NSString *)paymentId success:(EC3RequestSuccessBlock)success failure:(EC3RequestFailureBlock)failure;

- (void)cancelSale:(NSString *)paymentId withAmount:(int)amount success:(EC3RequestSuccessBlock)success failure:(EC3RequestFailureBlock)failure;
- (void)cancelSale:(NSString *)paymentId success:(EC3RequestSuccessBlock)success failure:(EC3RequestFailureBlock)failure;

- (void)captureSale:(NSString *)paymentId withAmount:(int)amount andServiceTaxAmount:(int)serviceTaxAmount success:(EC3RequestSuccessBlock)success failure:(EC3RequestFailureBlock)failure;
- (void)captureSale:(NSString *)paymentId withAmount:(int)amount success:(EC3RequestSuccessBlock)success failure:(EC3RequestFailureBlock)failure;
- (void)captureSale:(NSString *)paymentId success:(EC3RequestSuccessBlock)success failure:(EC3RequestFailureBlock)failure;
@end
