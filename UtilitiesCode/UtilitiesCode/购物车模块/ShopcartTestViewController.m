//
//  ShopcartTestViewController.m
//  UtilitiesCode
//
//  Created by Eddy on 2017/4/1.
//  Copyright © 2017年 tutuge. All rights reserved.
//

#import "ShopcartTestViewController.h"
#import "JVShopcartViewController.h"

@interface ShopcartTestViewController ()

@property (nonatomic, strong) UIButton *goShoppingButton;

@end

@implementation ShopcartTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@""
                                                                             style:UIBarButtonItemStylePlain
                                                                            target:self
                                                                            action:nil];
    
    [self.view addSubview:self.goShoppingButton];
}

- (UIButton *)goShoppingButton {
    if(_goShoppingButton == nil)
    {
        _goShoppingButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_goShoppingButton setTitle:@"进入购物车" forState:UIControlStateNormal];
        [_goShoppingButton addTarget:self action:@selector(goShoppingButtonAction) forControlEvents:UIControlEventTouchUpInside];
        _goShoppingButton.layer.cornerRadius = 5;
        _goShoppingButton.layer.masksToBounds = YES;
        [_goShoppingButton setBackgroundColor:[UIColor colorWithRed:0.918  green:0.141  blue:0.137 alpha:1]];
        _goShoppingButton.frame = CGRectMake(0, 0, 100, 40);
        _goShoppingButton.center = self.view.center;
    }
    return _goShoppingButton;
}

- (void)goShoppingButtonAction {
    JVShopcartViewController *shopcartVC = [[JVShopcartViewController alloc] init];
    [self.navigationController pushViewController:shopcartVC animated:YES];
}


@end
