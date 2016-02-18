//
//  CSKeyNavigationController.h
//  CSKeyNavigationController
//
//  Created by ChaoSo on 16/1/12.
//  Copyright © 2016年 ChaoSo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CSKeyNavigationController : UINavigationController

/**
 *  Pop ViewController In NavigationController With Key
 *
 *  @param aKey     Key Name (Default:ViewController's Name)
 *  @param animated
 */
- (void)popViewControllerWithKey:(NSString *)aKey animated:(BOOL)animated;

/**
 *  Push ViewController With ViewController Object
 *
 *  @param viewController viewController Object
 *  @param animated       animated
 */
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated;

/**
 *  Push ViewController With Key
 *
 *  @param aKey     Key Name
 *  @param animated animated
 */
- (void)pushViewControllerWithKey:(NSString *)aKey animated:(BOOL)animated;
@end

@interface UIViewController (CSKeyNavigationController)

/**
 *  Get The CSKeyNavigationController Instance
 *
 */
@property (nonatomic, strong) CSKeyNavigationController *cs_navigationController;

/**
 *  Register Self (Now ViewController) To Pack With Key
 *
 *  @param key key Name
 */
- (void)cs_registerSelfForKey:(NSString *)key;

/**
 *  Register ViewController To Pack With Key
 *
 *  @param aClass ViewController
 *  @param key    Key Name
 */
- (void)cs_registerClass:(UIViewController *)aClass forKey:(NSString *)key;
@end