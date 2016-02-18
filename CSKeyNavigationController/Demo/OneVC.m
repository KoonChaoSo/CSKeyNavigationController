//
//  OneVC.m
//  CSKeyNavigationController
//
//  Created by ChaoSo on 16/1/12.
//  Copyright © 2016年 ChaoSo. All rights reserved.
//

#import "OneVC.h"
#import "CSKeyNavigationController.h"
#import "TwoVC.h"
@interface OneVC ()

@end

@implementation OneVC
-(void)viewDidLoad
{
    [super viewDidLoad];
}

- (IBAction)pushBtnClicked {
    
    TwoVC *childVC = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"TwoVC"];
    
    [self.cs_navigationController pushViewController:childVC animated:YES];
}

@end
