//
//  CSKeyNavigationController.m
//  CSKeyNavigationController
//
//  Created by ChaoSo on 16/1/12.
//  Copyright © 2016年 ChaoSo. All rights reserved.
//

#import "CSKeyNavigationController.h"
#import "CSKeyViewControllerPack.h"

@interface CSKeyNavigationController ()

@end

@implementation CSKeyNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/**
 *  Push ViewController With ViewController Object
 *
 *  @param viewController viewController Object
 *  @param animated       Yes Or No
 */
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (viewController)
    {
        NSString *clazzName = [NSString stringWithUTF8String:object_getClassName(viewController)];
        [self cs_registerClass:viewController forKey:clazzName];
        [self pushViewControllerWithKey:clazzName animated:animated];
    }
    else
    {
        NSLog(@"I can't find the viewController");
    }
}

/**
 *  Push ViewController With Key
 *
 *  @param aKey     Key Name
 *  @param animated Yes Or No
 */
- (void)pushViewControllerWithKey:(NSString *)aKey animated:(BOOL)animated
{
    if (aKey)
    {
        UIViewController *viewController = (UIViewController *)[[CSKeyViewControllerPack getInstant] objectForKey:aKey];
        [super pushViewController:viewController animated:animated];
    }
    else
    {
        NSLog(@"I can't find the key");
    }
}

/**
 *  Pop ViewController In NavigationController With Key
 *
 *  @param aKey     Key Name (Default:ViewController's Name)
 *  @param animated
 */
- (void)popViewControllerWithKey:(NSString *)aKey animated:(BOOL)animated
{
    UIViewController *viewController = (UIViewController *)[[CSKeyViewControllerPack getInstant] objectForKey:aKey];
    if (viewController)
    {
        [self popToViewController:viewController animated:animated];
    }
    else
    {
        NSLog(@"I can't find the key");
    }
}

/**
 *  Get The Previos ViewController Object
 *
 *  @return return value description
 */
-(UIViewController *)previousViewController
{
    NSInteger count = [CSKeyViewControllerPack getInstant].packList.count;
    if (count <= 2)
    {
        return (UIViewController *)[[CSKeyViewControllerPack getInstant].packList lastObject];
    }
    UIViewController *viewController = (UIViewController *)[[CSKeyViewControllerPack getInstant].packList objectAtIndex:count - 2];
    return viewController;
}


@end


@implementation UIViewController (CSKeyNavigationController)

@dynamic cs_navigationController;

- (CSKeyNavigationController *)cs_navigationController {
    
    UIResponder *responder = [self nextResponder];
    
    while (responder) {
        
        if ([responder isKindOfClass:[CSKeyNavigationController class]]) {
            
            return (CSKeyNavigationController *)responder;
        }
        
        responder = [responder nextResponder];
    }
    
    return nil;
}

/**
 *  Register ViewController To Pack With Key
 *
 *  @param aClass ViewController
 *  @param key    Key Name
 */
- (void)cs_registerClass:(UIViewController *)aClass forKey:(NSString *)key
{
    [[CSKeyViewControllerPack getInstant] addObject:aClass forKey:key];
}

/**
 *  Register Self (Now ViewController) To Pack With Key
 *
 *  @param key key Name
 */
- (void)cs_registerSelfForKey:(NSString *)key
{
    [self cs_registerClass:self forKey:key];
}

@end
