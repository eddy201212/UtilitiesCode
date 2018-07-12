//
//  PicModel.m
//  UtilitiesCode
//
//  Created by Eddy on 16/5/31.
//  Copyright © 2016年 tutuge. All rights reserved.
//

#import "PicModel.h"

@implementation PicModel

- (NSMutableArray *)picArrays{
    if (_picArrays == nil) {
        _picArrays = [[NSMutableArray alloc] initWithCapacity:0];
    }
    return _picArrays;
}

@end
