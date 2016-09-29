//
//  EC3JSONAdapter.m
//  Pods
//
//  Created by Thiago Rodrigues de Paula on 28/09/16.
//
//

#import "EC3JSONAdapter.h"

@implementation EC3JSONAdapter

- (NSSet *)serializablePropertyKeys:(NSSet *)propertyKeys
                           forModel:(id<EC3JSONAdapting>)model
{
    if ([[model class] respondsToSelector:@selector(withoutNil)]
        && [[model class] withoutNil]) {
        NSMutableSet *propertyKeys_ = [propertyKeys mutableCopy];
        
        [propertyKeys enumerateObjectsUsingBlock:^(NSString *_Nonnull propertyKey,
                                                   BOOL * _Nonnull stop) {
            if ([[NSNull null] isEqual:model.dictionaryValue[propertyKey]]) {
                [propertyKeys_ removeObject:propertyKey];
            }
        }];
        propertyKeys = [propertyKeys_ copy];
    }
    if ([[model class] respondsToSelector:@selector(propertyKeysForJSONRepresentation)]) {
        NSMutableSet *propertyKeys_ = [propertyKeys mutableCopy];
        [propertyKeys_ minusSet:[[model class] propertyKeysForJSONRepresentation]];
        
        propertyKeys = [propertyKeys_ copy];
    }
    return propertyKeys;
}

@end
