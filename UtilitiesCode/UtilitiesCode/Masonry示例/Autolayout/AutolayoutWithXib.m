//
//  AutolayoutWithXib.m
//  Utilities
//
//  Created by Eddy on 15/12/1.
//  Copyright © 2015年 ed. All rights reserved.
//

#import "AutolayoutWithXib.h"
#import "UIView+BlocksKit.h"

@interface AutolayoutWithXib ()

@end

@implementation AutolayoutWithXib

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view bk_whenTapped:^{
        NSLog(@"点击页面");
    }];
    
    [self.view bk_whenTouches:2 tapped:1 handler:^{
         NSLog(@"88888");
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
