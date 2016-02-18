//
//  TwoVC.m
//  CSKeyNavigationController
//
//  Created by ChaoSo on 16/1/12.
//  Copyright © 2016年 ChaoSo. All rights reserved.
//

#import "TwoVC.h"
#import "CSKeyNavigationController.h"

@interface TwoVC ()

@end

@implementation TwoVC

-(void)viewDidLoad
{
    [super viewDidLoad];
}


- (IBAction)pushBtnClicked {
    
    UIViewController *childVC = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"ThreeVC"];
    [self.cs_navigationController pushViewController:childVC animated:YES];
}

@end
