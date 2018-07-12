//
//  SystemPermissionsManagerViewController.m
//  UtilitiesCode
//
//  Created by Eddy on 2017/2/16.
//  Copyright © 2017年 tutuge. All rights reserved.
//

#import "SystemPermissionsManagerViewController.h"
#import "SystemPermissionsManager.h"

@interface SystemPermissionsManagerViewController ()

@end

@implementation SystemPermissionsManagerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    [[SystemPermissionsManager sharedManager] requestAuthorization:KABAddressBook];
}

@end
