//
//  CSKeyNavigationController.h
//  CSKeyNavigationController
//
//  Created by ChaoSo on 16/1/12.
//  Copyright © 2016年 ChaoSo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CSKeyNavigationController : UINavigationController
- (void)popViewControllerWithKey:(NSString *)aKey animated:(BOOL)animated;
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated;
- (void)pushViewControllerWithKey:(NSString *)aKey animated:(BOOL)animated;
@end

@interface UIViewController (CSKeyNavigationController)
@property (nonatomic, strong) CSKeyNavigationController *giz_navigationController;
- (void)giz_registerSelfForKey:(NSString *)key;
- (void)giz_registerClass:(id)aClass ForKey:(NSString *)key;
@end