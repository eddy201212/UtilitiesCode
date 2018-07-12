//
//  UIAlertView+FYAdditions.h
//  Jewelry
//
//  Created by FYWCQ on 15/12/3.
//  Copyright © 2015年 ___GY___. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^FYAlertViewCallBackBlock)(NSInteger buttonIndex);


@interface UIAlertView (FYAdditions)

@property (nonatomic, copy) FYAlertViewCallBackBlock alertViewCallBackBlock;


+(instancetype)alertWithCallBackBlock:(FYAlertViewCallBackBlock)alertViewCallBackBlock title:(NSString *)title message:(NSString *)message  cancelButtonName:(NSString *)cancelButtonName otherButtonTitles:(NSString *)otherButtonTitles, ...;

@end

