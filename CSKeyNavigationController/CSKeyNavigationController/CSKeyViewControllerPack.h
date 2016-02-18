//
//  CSKeyViewControllerPack.h
//  CSKeyNavigationController
//
//  Created by ChaoSo on 16/1/12.
//  Copyright © 2016年 ChaoSo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface CSKeyViewControllerPack : NSObject
@property (strong, nonatomic) NSMutableDictionary *packDictionary;
@property (strong, nonatomic) NSMutableArray *packList;

+ (CSKeyViewControllerPack *)getInstant;

/**
 *  add Object To PackDictionary
 *
 *  @param anObject Object
 *  @param aKey     Key Name
 */
- (void)addObject:(id)anObject forKey:(id)aKey;

/**
 *  insert Object to PackList And Set Object To Dictionary
 *
 *  @param anObject Object
 *  @param aKey     Key Name
 *  @param anIndex  index
 */
- (void)insertObject:(id)anObject forKey:(id)aKey atIndex:(NSUInteger)anIndex;

/**
 *  Get Object For Key
 *
 *  @param aKey Key Name
 *
 *  @return Object
 */
- (id)objectForKey:(id)aKey;

/**
 *  Get Key At Index
 *
 *  @param anIndex anIndex
 *
 *  @return Object
 */
- (id)keyAtIndex:(NSUInteger)anIndex;

- (NSEnumerator *)reverseKeyEnumerator;
@end
