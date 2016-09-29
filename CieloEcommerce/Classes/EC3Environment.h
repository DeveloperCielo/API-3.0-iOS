//
//  EC3Environment.h
//  Pods
//
//  Created by Thiago Rodrigues de Paula on 28/09/16.
//
//

#import <Foundation/Foundation.h>

@interface EC3Environment : NSObject

@property (readonly) NSURL *apiUrl;
@property (readonly) NSURL *apiQueryUrl;

+ (EC3Environment *)sandbox;
+ (EC3Environment *)production;

@end
