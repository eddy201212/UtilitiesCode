//
//  NetworkStatus.m
//  Utilities
//
//  Created by Eddy on 16/1/11.
//  Copyright © 2016年 Zx. All rights reserved.
//

#import "NetworkStatus.h"
#import "AFNetworkReachabilityManager.h"

@implementation NetworkStatus

#pragma mark - 监控网络

+ (NetworkStatus *)getInstance{
    static NetworkStatus *_sharedNetworkStatus = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedNetworkStatus = [[NetworkStatus alloc] init];
    });
    return _sharedNetworkStatus;
}

- (void)netWorkMonitor
{
    /*知识点1:
     通过AFNetworkReachabilityManager 可以用来检测网络状态的变化 */
    AFNetworkReachabilityManager *reachManager = [AFNetworkReachabilityManager sharedManager];
    [reachManager startMonitoring];//必须得启动监听
    
    [reachManager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        switch (status) {
            case AFNetworkReachabilityStatusUnknown: {
                UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"网络状态"
                                                                    message:@"网络异常"
                                                                   delegate:nil
                                                          cancelButtonTitle:@"确定"
                                                          otherButtonTitles:nil];
                [alertView show];
                break;
            }
            case AFNetworkReachabilityStatusNotReachable: {
                UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"网络状态"
                                                                    message:@"网络未连接"
                                                                   delegate:nil
                                                          cancelButtonTitle:@"确定"
                                                          otherButtonTitles:nil];
                [alertView show];
                break;
            }
            case AFNetworkReachabilityStatusReachableViaWWAN: {
                NSLog(@"WWAN连接");
                break;
            }
            case AFNetworkReachabilityStatusReachableViaWiFi: {
                NSLog(@"WIFI连接");
                break;
            }
            default: {
                break;
            }
        }
    }];
}

- (BOOL)isReachableViaWiFi{
    if ([[AFNetworkReachabilityManager sharedManager] isReachableViaWiFi]) {
        return YES;
    }else if ([[AFNetworkReachabilityManager sharedManager] isReachableViaWWAN]){
        return NO;
    }
    
    return NO;
}

+ (BOOL)isReachableViaNetwork{
    if ([[AFNetworkReachabilityManager sharedManager] isReachableViaWiFi] || [[AFNetworkReachabilityManager sharedManager] isReachableViaWWAN]) {
        return YES;
    }
    return NO;
}

@end
