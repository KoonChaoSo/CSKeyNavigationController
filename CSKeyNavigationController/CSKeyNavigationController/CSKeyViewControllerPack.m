//
//  CSKeyViewControllerPack.m
//  CSKeyNavigationController
//
//  Created by ChaoSo on 16/1/12.
//  Copyright © 2016年 ChaoSo. All rights reserved.
//

#import "CSKeyViewControllerPack.h"

@implementation CSKeyViewControllerPack
+ (CSKeyViewControllerPack *)getInstant
{
    static CSKeyViewControllerPack *sharedInstance = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}


NSString *descriptionForObject(NSObject *object, id locale, NSUInteger indent)
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


- (id)init
{
    return [self initWithCapacity:0];
}

- (id)initWithCapacity:(NSUInteger)capacity
{
    self = [super init];
    if (self != nil)
    {
        self.viewControllerDic = [[NSMutableDictionary alloc] initWithCapacity:capacity];
        self.viewControllersList = [[NSMutableArray alloc] initWithCapacity:capacity];
    }
    return self;
}

- (void)dealloc
{
    _viewControllerDic = nil;
    _viewControllersList = nil;
}

- (id)copy
{
    return [self mutableCopy];
}

- (void)setObject:(id)anObject forKey:(id)aKey
{
    if (![self.viewControllerDic objectForKey:aKey])
    {
        [self.viewControllersList addObject:aKey];
    }
    [self.viewControllerDic setObject:anObject forKey:aKey];
}

- (void)removeObjectForKey:(id)aKey
{
    [self.viewControllerDic removeObjectForKey:aKey];
    [self.viewControllersList removeObject:aKey];
}

- (NSUInteger)count
{
    return [self.viewControllerDic count];
}

- (id)objectForKey:(id)aKey
{
    return [self.viewControllerDic objectForKey:aKey];
}

- (NSEnumerator *)keyEnumerator
{
    return [self.viewControllersList objectEnumerator];
}

- (NSEnumerator *)reverseKeyEnumerator
{
    return [self.viewControllersList reverseObjectEnumerator];
}

- (void)addObject:(id)anObject forKey:(id)aKey
{
    if ([self.viewControllerDic objectForKey:aKey])
    {
        [self removeObjectForKey:aKey];
    }
    [self.viewControllersList addObject:aKey];
    [self.viewControllerDic setObject:anObject forKey:aKey];
}

- (void)insertObject:(id)anObject forKey:(id)aKey atIndex:(NSUInteger)anIndex
{
    if ([self.viewControllerDic objectForKey:aKey])
    {
        [self removeObjectForKey:aKey];
    }
    [self.viewControllersList insertObject:aKey atIndex:anIndex];
    [self.viewControllerDic setObject:anObject forKey:aKey];
}

- (id)keyAtIndex:(NSUInteger)anIndex
{
    return [self.viewControllersList objectAtIndex:anIndex];
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
    for (NSObject *key in self.viewControllersList)
    {
        [description appendFormat:@"%@    %@ = %@;\n",
         indentString,
         descriptionForObject(key, locale, level),
         descriptionForObject([self objectForKey:key], locale, level)];
    }
    [description appendFormat:@"%@}\n", indentString];
    return description;
}

@end


