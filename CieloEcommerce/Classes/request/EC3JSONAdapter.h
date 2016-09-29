//
//  EC3JSONAdapter.h
//  Pods
//
//  Created by Thiago Rodrigues de Paula on 28/09/16.
//
//

#import <Mantle/Mantle.h>

@protocol EC3JSONAdapting <MTLJSONSerializing>

@optional
+ (NSSet<NSString *> *)propertyKeysForJSONRepresentation;
+ (BOOL)withoutNil;

@end

@interface EC3JSONAdapter : MTLJSONAdapter

- (NSSet *)serializablePropertyKeys:(NSSet *)propertyKeys
                           forModel:(id<EC3JSONAdapting>)model;

@end
