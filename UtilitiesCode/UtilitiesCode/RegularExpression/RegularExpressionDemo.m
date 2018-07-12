//
//  RegularExpressionDemo.m
//  Utilities
//
//  Created by Eddy on 16/1/4.
//  Copyright © 2016年 Zx. All rights reserved.
//

#import "RegularExpressionDemo.h"
#import <RegExCategories/RegExCategories.h>

@interface RegularExpressionDemo ()

@end

@implementation RegularExpressionDemo

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    // Without this library
    NSString* string = @"I have 2 dogs.";
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"\\d+" options:NSRegularExpressionCaseInsensitive error:nil];
    NSTextCheckingResult *match = [regex firstMatchInString:string options:0 range:NSMakeRange(0, [string length])];
    BOOL isMatch = match != nil;
    
    // With this library
    BOOL isMatch2 = [@"I have 2 dogs." isMatch:RX(@"\\d+")];
    NSLog(@"isMatch = %d, isMatch2 = %d", isMatch, isMatch2);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -匹配html5

- (void)testStringCategory
{
    TICK;
    NSString *pageurl = [NSString stringWithFormat:@"http://www.hao123.com/gaoxiao?pn=%ld", (long)1];
    NSString *dataString = [NSString stringWithContentsOfURL:[NSURL URLWithString:pageurl] encoding:NSUTF8StringEncoding error:nil];
    NSArray *urls = [dataString componentsSeparatedFromString:@"<img selector=\"pic\" img-src=\"" toString:@"\" src="];
    NSLog(@"urls.count = %lu", (unsigned long)urls.count);
    TOCK;
    
    NSString *string = @"444";
    NSLog(@"string = %@", string);
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
