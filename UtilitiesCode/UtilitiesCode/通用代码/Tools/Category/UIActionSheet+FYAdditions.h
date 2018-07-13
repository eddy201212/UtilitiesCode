//
//  UIActionSheet+FYAdditions.h
//  Jewelry
//
//  Created by FYWCQ on 16/1/11.
//  Copyright © 2016年 ___GY___. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^FYActionSViewCallBackBlock)(NSInteger buttonIndex);

@interface UIActionSheet (FYAdditions)

@property (nonatomic, copy) FYActionSViewCallBackBlock actionSheetCallBackBlock;

/**
 * buttonIndex 0 2 3 4
   1 === 取消
 */
+(void)actionSWithCallBackBlock:(FYActionSViewCallBackBlock)alertViewCallBackBlock title:(NSString *)title message:(NSString *)message  cancelButtonName:(NSString *)cancelButtonName otherButtonTitles:(NSString *)otherButtonTitles, ...;


@end
