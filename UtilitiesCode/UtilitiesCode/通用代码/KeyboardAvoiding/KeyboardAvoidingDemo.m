//
//  KeyboardAvoidingDemo.m
//  Utilities
//
//  Created by Eddy on 15/12/10.
//  Copyright © 2015年 ed. All rights reserved.
//

#import "KeyboardAvoidingDemo.h"

@implementation KeyboardAvoidingDemo

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Utilities";
    self.dataArray = @[@"KeyboardAvoidingScrollView",@"KeyboardAvoidingTableView",@"KeyboardAvoidingCollectionView"];
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
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
