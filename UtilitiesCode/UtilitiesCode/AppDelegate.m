//
//  AppDelegate.m
//  UtilitiesCode
//
//  Created by Eddy on 15/5/13.
//  Copyright (c) 2015年 wb. All rights reserved.
//

#import "AppDelegate.h"
#import "BlocksKit+UIKit.h"
#import "NetworkStatus.h"
#import "PicModel.h"
#import "Aspects.h"
//#import <StoreKit/SKStoreReviewController.h>

@interface AppDelegate ()
{
}
@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    CFAbsoluteTime start = CFAbsoluteTimeGetCurrent();
    CFAbsoluteTime end = CFAbsoluteTimeGetCurrent();
    NSLog(@"使用时间:%f", end-start);
    
    //=========================================
    [UIViewController aspect_hookSelector:@selector(viewWillAppear:) withOptions:AspectPositionAfter usingBlock:^(){
        NSLog(@"view appear! -->>>>>>>>>><<<<<<<<<<<<<--");
        
        
    } error:nil];
    
    UIViewController *vc = [[UIViewController alloc] init];
    [vc aspect_hookSelector:@selector(viewWillAppear:) withOptions:AspectPositionAfter usingBlock:^(){
        NSLog(@"view appear! -->>>>>>>>>><<<<<<<<<<<<<--");
    } error:nil];
    
    [UIViewController aspect_hookSelector:@selector(viewDidLoad) withOptions:AspectPositionAfter usingBlock:^(){
        NSLog(@"viewDidLoad! -->>>>>>>>>><<<<<<<<<<<<<--");
       
        
    } error:nil];
    //=======================================
    
    //滑动的时候隐藏navigation bar
    //self.navigationController.hidesBarsOnSwipe = YES;
    
    //消除导航条返回键带的title
    [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(0, -60)
                                                         forBarMetrics:UIBarMetricsDefault];
    //[[UINavigationBar appearance] setTintColor:[UIColor redColor]];
    
    //将Navigationbar变成透明而不模糊
    
    
    [self requestForAPPInfo];
    return YES;
}

#pragma mark - 请求应用版本信息

- (void)requestForAPPInfo
{
#warning 填写自己应用的appleid
    NSString *appId = @"";
    
    __weak typeof(self) weakSelf = self;
    NSMutableURLRequest *mutableReqeust = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"https://itunes.apple.com/lookup?id=%@", appId]]];
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:mutableReqeust
                                                completionHandler:
                                      ^(NSData *data, NSURLResponse *response, NSError *error) {
                                          dispatch_async(dispatch_get_main_queue(), ^{
                                              NSError *error;
                                              NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:&error];
                                              if (dic.count > 0) {
                                                  [weakSelf processInfoDict:dic];
                                              }
                                          });
                                      }];
    [dataTask resume];
}

- (void)processInfoDict:(NSDictionary *)dict
{
    BOOL openTag = NO;
    NSArray *array = [dict objectForKey:@"results"];
    if (array.count > 0) {
        NSDictionary *dict = [array objectAtIndex:0];
        NSString *sverVersion = [dict objectForKey:@"version"];
        NSLog(@"sverVersion = %@", sverVersion);
        
        // app版本
        NSString *appVersion = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
        NSLog(@"appVersion = %@", appVersion);
        
        if ([sverVersion isEqualToString:appVersion]) {
            openTag = YES;
        }else{
            
            sverVersion = [sverVersion stringByReplacingOccurrencesOfString:@"." withString:@""];
            appVersion = [appVersion stringByReplacingOccurrencesOfString:@"." withString:@""];
            
            NSUInteger length1 = sverVersion.length;
            NSUInteger length2 = appVersion.length;
            if (length1 > 0 && length2 > 0) {
                if (length1 == length2) {
                    NSInteger sVersion = [sverVersion integerValue];
                    NSInteger aVersion = [appVersion integerValue];
                    
                    openTag = (aVersion <= sVersion);
                }else if (length1 > length2){
                    NSInteger sVersion = [sverVersion integerValue];
                    NSInteger aVersion = [appVersion integerValue];
                    
                    aVersion *= pow(10, length1-length2);
                    
                    openTag = (aVersion <= sVersion);
                }else{
                    NSInteger sVersion = [sverVersion integerValue];
                    NSInteger aVersion = [appVersion integerValue];
                    
                    sVersion *= pow(10, length2-length1);
                    
                    openTag = (aVersion <= sVersion);
                }
            }
        }
    }
    
    NSLog(@"openTag = %d", openTag);
}

#pragma mark - 


#pragma mark -

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
