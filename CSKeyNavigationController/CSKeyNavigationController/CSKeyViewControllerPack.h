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
@property (strong, nonatomic) NSMutableDictionary *viewControllerDic;
@property (strong, nonatomic) NSMutableArray *viewControllersList;

+ (CSKeyViewControllerPack *)getInstant;

- (void)addObject:(id)anObject forKey:(id)aKey;
- (void)insertObject:(id)anObject forKey:(id)aKey atIndex:(NSUInteger)anIndex;
- (id)objectForKey:(id)aKey;
- (id)keyAtIndex:(NSUInteger)anIndex;
- (NSEnumerator *)reverseKeyEnumerator;
@end
