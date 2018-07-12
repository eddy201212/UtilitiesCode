//
//  ADScrollView.h
//  基本框架封装
//
//  Created by lorin on 16/5/18.
//  Copyright © 2016年 lorin. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^scrollViewSelectBlock)(NSInteger index);
@interface ADScrollView : UIView
/**
 *  图片路径数组
 */
@property (nonatomic,strong) NSMutableArray *pics;
//pageControl 颜色
@property (nonatomic,strong) UIColor *pageColor;
@property (nonatomic,strong) UIColor *pageSelColor;
//图片点击事件
@property (nonatomic, copy)  scrollViewSelectBlock imgeViewSelectBlock;
//块回调方法
-(void)returnIndex:(scrollViewSelectBlock)block;
//赋值以后，调用此方法刷新视图
-(void)reloadView;
@end
