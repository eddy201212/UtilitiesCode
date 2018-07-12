//
//  ViewController.m
//  Utilities
//
//  Created by Eddy on 15/11/2.
//  Copyright © 2015年 ed. All rights reserved.
//

#import "HomewViewController.h"
//#import "AutolayoutWithXib.h"
#import "NetworkStatus.h"

@interface HomewViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (strong, nonatomic) NSArray *dataArray;

@end

@implementation HomewViewController


- (void)injected
{
    NSLog(@"I have been injected!");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Utilities";
    self.dataArray = @[@"AutolayoutWithXib",@"AutolayoutWithPureLayout",@"AutolayoutWithPureLayout2",@"MasonryDemoViewController",@"TableViewDemo",@"KeyboardAvoidingDemo",@"RegularExpressionDemo",@"JSDemo",@"BlurEffectDemo",@"RuntimeDemo",@"MutipleThreadDemo",@"TopScrollBannerViewController", @"JSAndOCInteractionDemo",@"ObjcLoadWebviewImageDemo",@"HeaderSitckDemo",@"HYBModalBubbleViewController",@"HYBModalBubbleTopRightViewController",@"HYBModalHalfController",@"HYBMoveViewController",@"HYBEaseInOutController",@"SystemPermissionsManagerViewController",@"ShopcartTestViewController"];
    
    //滑动的时候隐藏navigation bar
//    self.navigationController.hidesBarsOnSwipe = YES;
    
    //将Navigationbar变成透明而不模糊
//    [self.navigationController.navigationBar setBackgroundImage:[UIImage new]
//                                                  forBarMetrics:UIBarMetricsDefault];
//    self.navigationController.navigationBar .shadowImage = [UIImage new];
//    self.navigationController.navigationBar .translucent = YES;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"tableView444"];
    UITableViewCell *tableCell = [tableView dequeueReusableCellWithIdentifier:@"tableView444" forIndexPath:indexPath];
    
    tableCell.textLabel.text = self.dataArray[indexPath.row];
    
    return tableCell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"selected index = %ld", (long)indexPath.row);
    switch (indexPath.row) {
        case 0:
        {
           
        }
            break;
        case 1:
        {
        
        }
            break;
    
        default:
            break;
    }
    
    NSString *viewControllerClassName = [NSString stringWithFormat:@"%@", self.dataArray[indexPath.row]];
    Class viewControllerKlass = NSClassFromString(viewControllerClassName);
    NSAssert(viewControllerKlass, @"Class should not be nil!");
    NSAssert([viewControllerKlass isSubclassOfClass:[UIViewController class]], @"Class should be a view controller!");
    UIViewController *demoViewController = [[viewControllerKlass alloc] initWithNibName:nil bundle:nil];
   
    if (demoViewController) {
        demoViewController.title = self.dataArray[indexPath.row];
        [self.navigationController pushViewController:demoViewController animated:YES];
    }

     NSLog(@"%d", [NetworkStatus isReachableViaNetwork]);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}




@end
