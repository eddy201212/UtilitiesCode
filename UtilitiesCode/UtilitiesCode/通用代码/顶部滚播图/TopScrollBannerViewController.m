//
//  TopScrollBannerViewController.m
//  UtilitiesCode
//
//  Created by Eddy on 16/5/19.
//  Copyright © 2016年 wb. All rights reserved.
//

#import "TopScrollBannerViewController.h"
#import "ADScrollView.h"

@interface TopScrollBannerViewController ()<UIScrollViewDelegate>
//实例化scrollview
- (void)createScrollView;
//scrollView添加子视图
- (void)addChildViewAboutMyScroll;
//展示
@property (nonatomic,strong) UIScrollView *myScroll;
@end

@implementation TopScrollBannerViewController
{
    /**总页数*/
    NSInteger _wholePages;
    /**当前页*/
    NSInteger _currentPage;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor=[UIColor whiteColor];
 
    //[self demo1];//方式1
    [self demo2];//方式2
}

#pragma mark - 方式2

- (void)demo2
{
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    /**实例化scrollview*/
    [self createScrollView];
    
    /**scrollview添加子视图*/
    [self addChildViewAboutMyScroll];
}

//实例化scrollview
- (void)createScrollView {
    self.myScroll = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, MainScreenFrame_Width, 300)];
    /**打开按页滚动*/
    self.myScroll.pagingEnabled = YES;
    /**设置代理*/
    self.myScroll.delegate = self;
    /**初始化总页数与当前显示页*/
    _wholePages = 6;
    _currentPage = 0;
    /**设置起始显示点*/
    self.myScroll.contentOffset = CGPointMake(_currentPage * MainScreenFrame_Width, 0);
    /**设置可滚动的最大大小*/
    self.myScroll.contentSize = CGSizeMake(3 * MainScreenFrame_Width, 0);
    /**添加到view上*/
    [self.view addSubview:self.myScroll];
}

//scrollView添加子视图
- (void)addChildViewAboutMyScroll
{
    for (int i = 0; i < 3; i++)
    {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(i*MainScreenFrame_Width, 0, MainScreenFrame_Width, 300)];
        
        /**初始化显示三张图片*/
        imageView.image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"img%d",i+9] ofType:@"jpg"]];
        
        [self.myScroll addSubview:imageView];
    }
}

//数据刷新
- (void)refreshData
{
    [self updateSubImageView:(_currentPage - 1) with:0];
    [self updateSubImageView:_currentPage with:1];
    [self updateSubImageView:(_currentPage + 1) with:2];
}

/**
 abstact：根据传入数据修改相对应子视图
 imageName：拼接图片名字
 index：子视图下标
 */
- (void)updateSubImageView:(NSInteger)imageName with:(NSInteger)index
{
    UIImage *image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"img%ld", imageName%3+9] ofType:@"jpg"]];
    
    UIImageView *imageView = self.myScroll.subviews[index];
    /**修改子视图显示图片*/
    imageView.image = image;
}

#pragma mark ------------scrollview协议相关-----------
//滚动视图停止滚动
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    /**计算当前显示的是第几页*/
    NSInteger subViewIndex = scrollView.contentOffset.x / MainScreenFrame_Width;
    switch (subViewIndex) {
        case 0:
        {
            _currentPage = ((_currentPage - 1) % _wholePages);
            [self refreshData];
        }
            break;
            
        case 2:
        {
            _currentPage = ((_currentPage + 1) % _wholePages);
            [self refreshData];
        }
            break;
            
        default:
            break;
    }
    /**刷新ContentOffSet*/
    [self.myScroll setContentOffset:CGPointMake(MainScreenFrame_Width, 0) animated:NO];
}

#pragma mark - 方式1

- (void)demo1
{
    ADScrollView *AdView=[[ADScrollView alloc]initWithFrame:CGRectMake(0, 64,self.view.bounds.size.width, 200)];
    [self.view addSubview:AdView];
    AdView.pics=[NSMutableArray arrayWithObjects:@"http://img.taopic.com/uploads/allimg/130215/240511-13021510291714.jpg",@"http://s.tang-mao.com/Uploads/Editor/2015-05-29/1432892469570136.jpg",@"http://img.taopic.com/uploads/allimg/130807/240451-130PFI24945.jpg",@"http://image.tianjimedia.com/uploadImages/2012/236/2H2TR02NKWAA.jpg",nil];
    //点击事件
    [AdView returnIndex:^(NSInteger index) {
        switch (index) {
            case 0:
            {
                UIViewController *view=[[UIViewController alloc]init];
                [self.navigationController pushViewController:view animated:YES];
            }
                break;
                
            default:
                break;
        }
    }];
    //刷新（必需的步骤）
    [AdView reloadView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
