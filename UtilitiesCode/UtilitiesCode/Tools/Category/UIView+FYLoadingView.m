//
//  UIView+FYLoadingView.m
//  FYRrefresh
//
//  Created by FYWCQ on 16/3/23.
//  Copyright © 2016年 FYWCQ. All rights reserved.
//

#import "UIView+FYLoadingView.h"
#import "MBProgressHUD.h"
#import <objc/runtime.h>
static const void *kHttpRequestHUDKeyFY = @"kHttpRequestHUDKeyFY";

@interface UIView ()
@property(nonatomic,strong)MBProgressHUD *progressHUDFY;
@end

@implementation UIView (FYLoadingView)

-(MBProgressHUD *)progressHUDFY
{
    MBProgressHUD *HUD = objc_getAssociatedObject(self, &kHttpRequestHUDKeyFY);
    if (HUD == nil)
    {
         HUD = [[MBProgressHUD alloc] initWithView:self];
        [self addSubview:HUD];
        objc_setAssociatedObject(self, &kHttpRequestHUDKeyFY, HUD, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return HUD;
}

-(void)showLoadingViewWithMessage:(NSString*)message
{
    if (message) {
        self.progressHUDFY.labelText = message;
    }else
    {
        self.progressHUDFY.labelText = @"";
    }
    [self.progressHUDFY show:YES];
}

-(void)stopLoadingViewWithMessage:(NSString*)message
{
    if (message.length)
    {
        self.progressHUDFY.labelText = message;
        [self.progressHUDFY hide:YES afterDelay:.5];
    }
    else
    {
        [self.progressHUDFY hide:YES];
    }
}

@end
