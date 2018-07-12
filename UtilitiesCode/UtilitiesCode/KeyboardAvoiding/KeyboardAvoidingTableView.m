//
//  KeyboardAvoidingTableView.m
//  Utilities
//
//  Created by Eddy on 15/12/10.
//  Copyright © 2015年 ed. All rights reserved.
//

#import "KeyboardAvoidingTableView.h"
#import "TPKeyboardAvoidingTableView.h"
#import "Masonry.h"

@interface KeyboardAvoidingTableView ()<UITableViewDelegate,UITableViewDataSource>

@property (strong, nonatomic) UITableView *mytableView;

@end

@implementation KeyboardAvoidingTableView

- (void)viewDidLoad{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    _mytableView = [TPKeyboardAvoidingTableView new];
    _mytableView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_mytableView];
    _mytableView.delegate = self;
    _mytableView.dataSource = self;
    
    [_mytableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 30;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        
        UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, 200, 30)];
        textField.borderStyle = UITextBorderStyleRoundedRect;
        cell.accessoryView = textField;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"Label %d", (int)indexPath.row];
    ((UITextField*)cell.accessoryView).placeholder = [NSString stringWithFormat:@"Field %d", (int)indexPath.row];
    
    return cell;
}


@end
