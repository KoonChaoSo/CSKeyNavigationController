//
//  CSKeyViewControllerPack.m
//  CSKeyNavigationController
//
//  Created by ChaoSo on 16/1/12.
//  Copyright © 2016年 ChaoSo. All rights reserved.
//

#import "CSKeyViewControllerPack.h"

@implementation CSKeyViewControllerPack


- (id)init
{
    return [self initWithCapacity:0];
}

- (id)initWithCapacity:(NSUInteger)capacity
{
    self = [super init];
    if (self != nil)
    {
        self.packDictionary = [[NSMutableDictionary alloc] initWithCapacity:capacity];
        self.packList = [[NSMutableArray alloc] initWithCapacity:capacity];
    }
    return self;
}

- (id)copy
{
    return [self mutableCopy];
}

- (void)dealloc
{
    _packDictionary = nil;
    _packList = nil;
}

#pragma mark - Single Instance
+ (CSKeyViewControllerPack *)getInstant
{
    static CSKeyViewControllerPack *sharedInstance = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}



#pragma mark - Function

- (void)setObject:(id)anObject forKey:(id)aKey
{
    if (![self.packDictionary objectForKey:aKey])
    {
        [self.packList addObject:aKey];
    }
    [self.packDictionary setObject:anObject forKey:aKey];
}

- (void)removeObjectForKey:(id)aKey
{
    [self.packDictionary removeObjectForKey:aKey];
    [self.packList removeObject:aKey];
}

- (NSUInteger)count
{
    return [self.packDictionary count];
}

- (id)objectForKey:(id)aKey
{
    return [self.packDictionary objectForKey:aKey];
}

- (NSEnumerator *)keyEnumerator
{
    return [self.packList objectEnumerator];
}

- (NSEnumerator *)reverseKeyEnumerator
{
    return [self.packList reverseObjectEnumerator];
}

- (void)addObject:(id)anObject forKey:(id)aKey
{
    if ([self.packDictionary objectForKey:aKey])
    {
        [self removeObjectForKey:aKey];
    }
    [self.packList addObject:aKey];
    [self.packDictionary setObject:anObject forKey:aKey];
}

- (void)insertObject:(id)anObject forKey:(id)aKey atIndex:(NSUInteger)anIndex
{
    if ([self.packDictionary objectForKey:aKey])
    {
        [self removeObjectForKey:aKey];
    }
    [self.packList insertObject:aKey atIndex:anIndex];
    [self.packDictionary setObject:anObject forKey:aKey];
}

- (id)keyAtIndex:(NSUInteger)anIndex
{
    return [self.packList objectAtIndex:anIndex];
}


#pragma mark - Log
/**
 *  Description
 *
 */
- (NSString *)descriptionWithObject:(id)object
                             locale:(id)locale
                             indent:(NSUInteger)indent
{
    {
        NSString *objectString;
        if ([object isKindOfClass:[NSString class]])
        {
            objectString = (NSString *)object;
        }
        else if ([object respondsToSelector:@selector(descriptionWithLocale:indent:)])
        {
            objectString = [(NSDictionary *)object descriptionWithLocale:locale indent:indent];
        }
        else if ([object respondsToSelector:@selector(descriptionWithLocale:)])
        {
            objectString = [(NSSet *)object descriptionWithLocale:locale];
        }
        else
        {
            objectString = [object description];
        }
        return objectString;
    }
    
}

- (NSString *)descriptionWithLocale:(id)locale indent:(NSUInteger)level
{
    NSMutableString *indentString = [NSMutableString string];
    NSUInteger i, count = level;
    for (i = 0; i < count; i++)
    {
        [indentString appendFormat:@"    "];
    }
    
    NSMutableString *description = [NSMutableString string];
    [description appendFormat:@"%@{\n", indentString];
    for (NSObject *key in self.packList)
    {

        [description appendFormat:@"%@    %@ = %@;\n",
         indentString,
         [self descriptionWithObject:key locale:locale indent:level],
         [self descriptionWithObject:[self objectForKey:key] locale:locale indent:level]];
    }
    [description appendFormat:@"%@}\n", indentString];
    return description;
}

@end


