//
//  RoundedCornerDemoViewController.m
//  UtilitiesCode
//
//  Created by Eddy on 2018/3/21.
//  Copyright © 2018年 tutuge. All rights reserved.
//

#import "RoundedCornerDemoViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface RoundedCornerDemoViewController ()
{
    UIImageView *imageView22;
}
@end

@implementation RoundedCornerDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)deRRoundedCorner {
    
    //直接设置
    imageView22.layer.cornerRadius = 10;
    imageView22.layer.masksToBounds = YES;
    
    //优化方案1：使用CAShapeLayer和UIBezierPath设置圆角使用贝塞尔曲线UIBezierPath和Core Graphics框架画出一个圆角
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    imageView.image = [UIImage imageNamed:@"myImg"];
    //开始对imageView进行画图
    UIGraphicsBeginImageContextWithOptions(imageView.bounds.size, NO, 1.0);
    //使用贝塞尔曲线画出一个圆形图
    [[UIBezierPath bezierPathWithRoundedRect:imageView.bounds cornerRadius:imageView.frame.size.width] addClip];
    [imageView drawRect:imageView.bounds];
    imageView.image = UIGraphicsGetImageFromCurrentImageContext();
    //结束画图
    UIGraphicsEndImageContext();
    [self.view addSubview:imageView];
    
    
    //优化方案2：使用CAShapeLayer和UIBezierPath设置圆角
    imageView = [[UIImageView alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    imageView.image = [UIImage imageNamed:@"myImg"];
    
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:imageView.bounds byRoundingCorners:UIRectCornerAllCorners cornerRadii:imageView.bounds.size];
    
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc]init];
    //设置大小
    maskLayer.frame = imageView.bounds;
    //设置图形样子
    maskLayer.path = maskPath.CGPath;
    imageView.layer.mask = maskLayer;
    [self.view addSubview:imageView];
}

@end
