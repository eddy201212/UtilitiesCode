//
//  UIView+Masonry_YL.h
//  Utilities
//
//  Created by Eddy on 15/12/9.
//  Copyright © 2015年 ed. All rights reserved.
//

#import <UIKit/UIKit.h>

//横向或者纵向等间隙的排列一组view
@interface UIView (Masonry_YL)

- (void) distributeSpacingHorizontallyWith:(NSArray*)views;
- (void) distributeSpacingVerticallyWith:(NSArray*)views;

@end
