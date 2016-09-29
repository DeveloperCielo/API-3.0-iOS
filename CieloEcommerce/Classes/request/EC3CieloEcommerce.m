//
//  EC3AbstractSaleRequest.m
//  Pods
//
//  Created by Thiago Rodrigues de Paula on 28/09/16.
//
//

#import <AFNetworking/AFNetworking.h>
#import "EC3JSONAdapter.h"
#import "EC3CieloEcommerce.h"
#import "EC3Sale.h"

@implementation EC3CieloEcommerce

- (id)initWithMerchant:(EC3Merchant *)merchant
        andEnvironment:(EC3Environment *)environment {
    self = [super init];
    if (!self) return nil;
    
    _merchant = merchant;
    _environment = environment;
    
    return self;
}

- (void)createSale:(EC3Sale *)sale success:(EC3RequestSuccessBlock)success failure:(EC3RequestFailureBlock)failure; {
    NSDictionary *saleParams = [EC3JSONAdapter JSONDictionaryFromModel:sale error:nil];
    [[self apiManager] POST:@"/1/sales"
                  parameters:saleParams
                   progress:nil
                    success:[self successBlock:success]
                    failure:[self failureBlock:failure]];
}

- (void)querySale:(NSString *)paymentId success:(EC3RequestSuccessBlock)success failure:(EC3RequestFailureBlock)failure; {
    [[self apiQueryManager] GET:[NSString stringWithFormat:@"/1/sales/%@", paymentId]
                     parameters:nil
                       progress:nil
                        success:[self successBlock:success]
                        failure:[self failureBlock:failure]];
}

- (void)cancelSale:(NSString *)paymentId withAmount:(int)amount success:(EC3RequestSuccessBlock)success failure:(EC3RequestFailureBlock)failure {
    [[self apiManager] PUT:[NSString stringWithFormat:@"/1/sales/%@/void?amount=%i", paymentId, amount]
                parameters:nil
                   success:[self successBlock:success]
                   failure:[self failureBlock:failure]];
}

- (void)cancelSale:(NSString *)paymentId success:(EC3RequestSuccessBlock)success failure:(EC3RequestFailureBlock)failure; {
    [[self apiManager] PUT:[NSString stringWithFormat:@"/1/sales/%@/void", paymentId]
                parameters:nil
                   success:[self successBlock:success]
                   failure:[self failureBlock:failure]];
}

- (void)captureSale:(NSString *)paymentId
          withAmount:(int)amount
andServiceTaxAmount:(int)serviceTaxAmount
            success:(EC3RequestSuccessBlock)success
            failure:(EC3RequestFailureBlock)failure {
    [[self apiManager] PUT:[NSString stringWithFormat:@"/1/sales/%@/capture?amount=%i&serviceTaxAmount=%i", paymentId, amount, serviceTaxAmount]
                parameters:nil
                   success:[self successBlock:success]
                   failure:[self failureBlock:failure]];
}

- (void)captureSale:(NSString *)paymentId
         withAmount:(int)amount
            success:(EC3RequestSuccessBlock)success
            failure:(EC3RequestFailureBlock)failure {
    [[self apiManager] PUT:[NSString stringWithFormat:@"/1/sales/%@/capture?amount=%i", paymentId, amount]
                parameters:nil
                   success:[self successBlock:success]
                   failure:[self failureBlock:failure]];
}

- (void)captureSale:(NSString *)paymentId success:(EC3RequestSuccessBlock)success failure:(EC3RequestFailureBlock)failure {
    [[self apiManager] PUT:[NSString stringWithFormat:@"/1/sales/%@/capture", paymentId]
                parameters:nil
                   success:[self successBlock:success]
                   failure:[self failureBlock:failure]];
}

# pragma mark - Private methods

- (void(^)(NSURLSessionDataTask*, id))successBlock:(EC3RequestSuccessBlock)success {
    return ^(NSURLSessionDataTask *task, id responseObject) {
        EC3Sale *sale = [EC3JSONAdapter modelOfClass:EC3Sale.class fromJSONDictionary:responseObject error:nil];
        success(sale);
    };
}

- (void(^)(NSURLSessionDataTask*, NSError*))failureBlock:(EC3RequestFailureBlock)failure {
    return ^(NSURLSessionDataTask *task, NSError *error) {
        failure(task.response, error);
    };
}

- (AFHTTPSessionManager *)apiManager {
    return [self httpManager:self.environment.apiUrl];
}

- (AFHTTPSessionManager *)apiQueryManager {
    return [self httpManager:self.environment.apiQueryUrl];
}

- (AFHTTPSessionManager *)httpManager:(NSString *)baseUrl {
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc]
                                     initWithBaseURL:baseUrl];
    
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    
    [self addHeadersTo:manager];
    
    return manager;
}

- (void)addHeadersTo:(AFHTTPSessionManager *)manager {
    [[self requestHeaders] enumerateKeysAndObjectsUsingBlock:^(NSString* key, NSString* value, BOOL *stop) {
        [manager.requestSerializer setValue:value forHTTPHeaderField:key];
    }];
    
}

- (NSDictionary *)requestHeaders {
    return @{
             @"Accept": @"application/json",
             @"Accept-Encoding": @"gzip",
             @"Content-Type": @"application/json",
             @"User-Agent": @"CieloEcommerce/3.0 iOS SDK",
             @"MerchantId": self.merchant.ID,
             @"MerchantKey": self.merchant.key,
             @"RequestId": [[NSUUID UUID] UUIDString]
             };
}

@end
