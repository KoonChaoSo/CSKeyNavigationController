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
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (viewController)
    {
        NSString *clazzName = [NSString stringWithUTF8String:object_getClassName(viewController)];
        [self giz_registerClass:viewController ForKey:clazzName];
        [self pushViewControllerWithKey:clazzName animated:animated];
    }
    else
    {
        NSLog(@"I can't find the viewController");
    }
}

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


@end


@implementation UIViewController (CSKeyNavigationController)

@dynamic giz_navigationController;

- (CSKeyNavigationController *)giz_navigationController {
    
    UIResponder *responder = [self nextResponder];
    
    while (responder) {
        
        if ([responder isKindOfClass:[CSKeyNavigationController class]]) {
            
            return (CSKeyNavigationController *)responder;
        }
        
        responder = [responder nextResponder];
    }
    
    return nil;
}

- (void)giz_registerClass:(id)aClass ForKey:(NSString *)key
{
    [[CSKeyViewControllerPack getInstant] addObject:aClass forKey:key];
}

- (void)giz_registerSelfForKey:(NSString *)key
{
    [self giz_registerClass:self ForKey:key];
}

@end
