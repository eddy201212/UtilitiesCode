//
//  AutolayoutWithPureLayout.m
//  Utilities
//
//  Created by Eddy on 15/12/10.
//  Copyright © 2015年 Zx. All rights reserved.
//

#import "AutolayoutWithPureLayout.h"
#import "PureLayout.h"


@interface AutolayoutWithPureLayout ()

@property (nonatomic, strong) UIView *containerView;

@property (nonatomic, strong) UIView *blueView;
@property (nonatomic, strong) UIView *redView;
@property (nonatomic, strong) UIView *yellowView;
@property (nonatomic, strong) UIView *greenView;
@property (nonatomic, strong) UILabel *orangeView;

@end


@implementation AutolayoutWithPureLayout

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self testScrollView];

    
    //[self textUIView];
}

#pragma mark -
#pragma mark normal view

- (void)textUIView
{
    [self.view addSubview:self.redView];
    [self.view addSubview:self.orangeView];
    
    [self.redView autoCenterInSuperview];
    [self.redView autoSetDimensionsToSize:CGSizeMake(100.0f, 250.0f)];
    
    [self.orangeView autoSetDimensionsToSize:CGSizeMake(50.0f, 50.0f)];
    [self.orangeView autoConstrainAttribute:ALAttributeHorizontal toAttribute:ALAttributeTop ofView:self.redView];
}

- (UIView *)redView
{
    if (!_redView) {
        _redView = [[UIView alloc] initForAutoLayout];
        _redView.backgroundColor = [UIColor redColor];
    }
    return _redView;
}

- (UIView *)yellowView
{
    if (!_yellowView) {
        _yellowView = [[UIView alloc] initForAutoLayout];
        _yellowView.backgroundColor = [UIColor yellowColor];
    }
    return _yellowView;
}

- (UIView *)greenView
{
    if (!_greenView) {
        _greenView = [[UIView alloc] initForAutoLayout];
        _greenView.backgroundColor = [UIColor greenColor];
    }
    return _greenView;
}

- (UILabel *)orangeView
{
    if (!_orangeView) {
        _orangeView = [[UILabel alloc] initForAutoLayout];
        _orangeView.backgroundColor = [UIColor orangeColor];
        _orangeView.numberOfLines = 0;
        _orangeView.font = [UIFont systemFontOfSize:10.0f];
        _orangeView.textColor = [UIColor whiteColor];
        _orangeView.textAlignment = NSTextAlignmentCenter;
        _orangeView.text = NSLocalizedString(@"Lorem ipsum", nil);
    }
    return _orangeView;
}

#pragma mark-
#pragma mark ScrollView

- (void)testScrollView
{
    UIScrollView *scrollView = [UIScrollView newAutoLayoutView];
    scrollView.backgroundColor = [UIColor redColor];
    scrollView.tag = 1990;
    [self.view addSubview:scrollView];
    [scrollView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero];
    
    
    NSInteger count = 10;
    
    UIView *lastView = nil;
    
    for (int i = 1; i <= count; i ++) {
        UILabel *subv = [UILabel newAutoLayoutView];
        subv.numberOfLines = 0;
        [scrollView addSubview:subv];
        
        
        subv.backgroundColor = [UIColor colorWithHue:( arc4random() % 256 / 256.0 )
                                          saturation:( arc4random() % 128 / 256.0 ) + 0.5
                                          brightness:( arc4random() % 128 / 256.0 ) + 0.5
                                               alpha:1];
        
        subv.text = @"mas_makeConstraints就是Masonry的autolayout添加函数 将所需的约束添加到block中行了mas_makeConstraints就是Masonry的autolayout添加函数 将所需的约束添加到block中行了88899999";
        
        
        [subv autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:scrollView];
        [subv autoPinEdge:ALEdgeRight toEdge:ALEdgeRight ofView:scrollView];
        [subv autoSetDimension:ALDimensionWidth toSize:self.view.bounds.size.width];
        
        if (lastView) {
            [subv autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:lastView];
        }else{
            [subv autoPinEdge:ALEdgeTop toEdge:ALEdgeTop ofView:scrollView];
        }
        
        lastView = subv;
    }

    [scrollView autoPinEdge:ALEdgeBottom toEdge:ALEdgeBottom ofView:lastView withOffset:40];
    
    [scrollView addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionNew context:nil];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context{
    
    //NSLog(@"object = %@", object);
    
    UIScrollView *scrollView = (UIScrollView *)[self.view viewWithTag:1990];
    
    if ([keyPath isEqualToString:@"contentOffset"] && object == scrollView) {
        
        CGFloat offset = scrollView.contentOffset.y;
        CGFloat delta = offset/64.f + 1.f;
        delta = MAX(0, delta);
        self.navigationController.navigationBar.alpha = MIN(1, delta);
        
        //NSLog(@"scrollView = %@", scrollView);
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)dealloc{
    
#warning 不执行移除操作的，有可能会引起crash
    UIScrollView *scrollView = (UIScrollView *)[self.view viewWithTag:1990];
    if (scrollView) {
        [scrollView removeObserver:self forKeyPath:@"contentOffset" context:nil];
    }
    
    NSLog(@"AutolayoutWithPureLayout dealloc..");
}

@end
