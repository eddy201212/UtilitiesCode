//
//  UIActionSheet+FYAdditions.m
//  Jewelry
//
//  Created by FYWCQ on 16/1/11.
//  Copyright © 2016年 ___GY___. All rights reserved.
//

#import "UIActionSheet+FYAdditions.h"

#import <objc/runtime.h>

static void* FYActionSheetKey = @"FYActionSheetKey_FY";


@interface UIActionSheet ()<UIActionSheetDelegate>

@end

@implementation UIActionSheet (FYAdditions)

+(void)actionSWithCallBackBlock:(FYActionSViewCallBackBlock)alertViewCallBackBlock title:(NSString *)title message:(NSString *)message cancelButtonName:(NSString *)cancelButtonName otherButtonTitles:(NSString *)otherButtonTitles, ...
{
    
    UIActionSheet *sheet  = [[UIActionSheet alloc] initWithTitle:title delegate:nil cancelButtonTitle:cancelButtonName   destructiveButtonTitle:nil otherButtonTitles:otherButtonTitles, nil];
    NSString *other = nil;
    va_list args;
    if (otherButtonTitles) {
        va_start(args, otherButtonTitles);
        while ((other = va_arg(args, NSString*))) {
            [sheet addButtonWithTitle:other];
        }
        va_end(args);
    }
    sheet.actionSheetCallBackBlock = alertViewCallBackBlock;
    sheet.delegate = sheet;
    
    [sheet showInView:[[[UIApplication sharedApplication] delegate] window]];
}

-(void)setActionSheetCallBackBlock:(FYActionSViewCallBackBlock)actionSheetCallBackBlock
{
    [self willChangeValueForKey:@"callbackBlock"];
    objc_setAssociatedObject(self, &FYActionSheetKey, actionSheetCallBackBlock, OBJC_ASSOCIATION_COPY);
    [self didChangeValueForKey:@"callbackBlock"];

}

-(FYActionSViewCallBackBlock)actionSheetCallBackBlock
{
    return objc_getAssociatedObject(self, &FYActionSheetKey);
}

-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (self.actionSheetCallBackBlock) {
        self.actionSheetCallBackBlock(buttonIndex);
    }
}


@end
