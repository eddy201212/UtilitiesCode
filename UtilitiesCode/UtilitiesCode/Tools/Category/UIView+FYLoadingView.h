//
//  UIView+FYLoadingView.h
//  FYRrefresh
//
//  Created by FYWCQ on 16/3/23.
//  Copyright © 2016年 FYWCQ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (FYLoadingView)

/**
 * message 可以 为 空
 */
-(void)showLoadingViewWithMessage:(NSString*)message;

/**
 * message 为空，会 马上 消失
   message 不为空，会 先显示 文字，延迟 消失
 */
-(void)stopLoadingViewWithMessage:(NSString*)message;

@end
