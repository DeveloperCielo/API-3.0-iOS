//
//  EC3Environment.m
//  Pods
//
//  Created by Thiago Rodrigues de Paula on 28/09/16.
//
//

#import "EC3Environment.h"

@implementation EC3Environment

- (id)initWithApiUrl:(NSString *)apiUrl andApiQueryUrl:(NSString *)apiQueryUrl {
    self = [super init];
    if (!self) return nil;
    
    _apiUrl = [NSURL URLWithString:apiUrl];
    _apiQueryUrl = [NSURL URLWithString:apiQueryUrl];
    
    return self;
}

+ (id)initWithApiUrl:(NSString *)apiUrl andApiQueryUrl:(NSString *)apiQueryUrl {
    return [[[self class] alloc] initWithApiUrl:apiUrl andApiQueryUrl:apiQueryUrl];
}

+ (EC3Environment *)sandbox {
    static EC3Environment *sharedSandboxInstance = nil;
    static dispatch_once_t sandboxOnceToken;
    
    dispatch_once(&sandboxOnceToken, ^{
        sharedSandboxInstance = [EC3Environment initWithApiUrl:@"https://apisandbox.cieloecommerce.cielo.com.br"
                                                andApiQueryUrl:@"https://apiquerysandbox.cieloecommerce.cielo.com.br"];
    });
    
    return sharedSandboxInstance;
}

+ (EC3Environment *)production {
    static EC3Environment *sharedProductionInstance = nil;
    static dispatch_once_t productionOnceToken;
    
    dispatch_once(&productionOnceToken, ^{
        sharedProductionInstance = [EC3Environment initWithApiUrl:@"https://api.cieloecommerce.cielo.com.br"
                                                   andApiQueryUrl:@"https://apiquery.cieloecommerce.cielo.com.br"];
    });
    
    return sharedProductionInstance;
}

@end
