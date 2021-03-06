//
//  Case4DataEntity.h
//  UtilitiesCode
//
//  Created by Eddy on 15/7/31.
//  Copyright (c) 2015年 wb. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Case4DataEntity : NSObject
@property (copy, nonatomic) NSString *title;
@property (copy, nonatomic) NSString *content;
@property (strong, nonatomic) UIImage *avatar;

// Cache
@property (assign, nonatomic) CGFloat cellHeight;
@end
