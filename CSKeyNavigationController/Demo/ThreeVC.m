//
//  ThreeVC.m
//  CSKeyNavigationController
//
//  Created by ChaoSo on 16/1/12.
//  Copyright © 2016年 ChaoSo. All rights reserved.
//

#import "ThreeVC.h"
#import "CSKeyNavigationController.h"

@interface ThreeVC ()

@end

@implementation ThreeVC
-(void)viewDidLoad
{
    [super viewDidLoad];
}

- (IBAction)popToTwo:(id)sender {
        [self.giz_navigationController popViewControllerWithKey:@"TwoVC" animated:YES];
}


- (IBAction)popBtnClicked {
    [self.giz_navigationController popViewControllerWithKey:@"OneVC" animated:YES];
}

- (IBAction)popToRootBtnClicked {
    
    [self.giz_navigationController popToRootViewControllerAnimated:YES];
}

@end
