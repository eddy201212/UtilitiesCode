//
//  NetworkStatus.h
//  Utilities
//
//  Created by Eddy on 16/1/11.
//  Copyright © 2016年 Zx. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NetworkStatus : NSObject

+ (NetworkStatus *)getInstance;

- (void)netWorkMonitor;

+ (BOOL)isReachableViaNetwork;

@end
