//
//  ViewController.m
//  YCCycleImage
//
//  Created by 赵永闯 on 2018/4/23.
//  Copyright © 2018年 zhaoyongchuang. All rights reserved.
//

/**********************************************************************************

 实现是基于collection实现的轮播图，方便内存管理，能够实现多种功能的轮播
 
**********************************************************************************/


#import "ViewController.h"
#import "YCCycleScrollView.h"
#import "CustomCollectionViewCell.h"
#import "UIImageView+WebCache.h"

@interface ViewController () <YCCycleScrollViewDelegate>

@end

@implementation ViewController
{
    NSArray *_imagesURLStrings;
    YCCycleScrollView *_customCellScrollViewDemo;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"轮播图";
    
    self.view.backgroundColor = [UIColor lightGrayColor];
//    UIImageView *backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"005.jpg"]];
//    backgroundView.frame = self.view.bounds;
//    [self.view addSubview:backgroundView];

    UIScrollView *demoContainerView = [[UIScrollView alloc] initWithFrame:self.view.frame];
    demoContainerView.contentSize = CGSizeMake(self.view.frame.size.width, 800);
    [self.view addSubview:demoContainerView];
    
    //1.采用本地图片实现
    NSArray *imageNames = @[@"001.jpg",
                            @"002.jpg",
                            @"003.jpg",
                            @"004.jpg",
                            ];
    
    //2.采用网络图片实现
    NSArray *imagesURLStrings = @[
                                  @"https://ss2.baidu.com/-vo3dSag_xI4khGko9WTAnF6hhy/super/whfpf%3D425%2C260%2C50/sign=a4b3d7085dee3d6d2293d48b252b5910/0e2442a7d933c89524cd5cd4d51373f0830200ea.jpg",
                                  @"https://ss0.baidu.com/-Po3dSag_xI4khGko9WTAnF6hhy/super/whfpf%3D425%2C260%2C50/sign=a41eb338dd33c895a62bcb3bb72e47c2/5fdf8db1cb134954a2192ccb524e9258d1094a1e.jpg",
                                  @"http://c.hiphotos.baidu.com/image/w%3D400/sign=c2318ff84334970a4773112fa5c8d1c0/b7fd5266d0160924c1fae5ccd60735fae7cd340d.jpg"
                                  ];
    _imagesURLStrings = imagesURLStrings;
    
    //3.图片配文字
    NSArray *titles = @[@"文字轮播器",
                        @"可设置滚动方向",
                        @"自定义数据源",
                        @"方便使用",
                        ];
    
    CGFloat w = self.view.bounds.size.width;
    
    //1. 本地加载 --- 创建不带标题的图片轮播器
    YCCycleScrollView *cycleScrollView = [YCCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, w, 180) shouldInfiniteLoop:YES imageNamesGroup:imageNames];
    cycleScrollView.delegate = self;
    cycleScrollView.pageControlStyle = YCCycleScrollViewPageContolStyleAnimated;
    [demoContainerView addSubview:cycleScrollView];
    cycleScrollView.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    //2. 网络加载 --- 创建带标题的图片轮播器
    YCCycleScrollView *cycleScrollView2 = [YCCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 200, w, 180) delegate:self placeholderImage:[UIImage imageNamed:@"placeholder"]];
    cycleScrollView2.pageControlAliment = YCCycleScrollViewPageContolAlimentRight;
    cycleScrollView2.titlesGroup = titles;
    cycleScrollView2.currentPageDotColor = [UIColor whiteColor]; // 自定义分页控件小圆标颜色
    [demoContainerView addSubview:cycleScrollView2];

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        //延迟模拟网络请求
        cycleScrollView2.imageURLStringsGroup = imagesURLStrings;
    });
    

    //3. 网络加载 --- 创建自定义图片的pageControlDot的图片轮播器
    YCCycleScrollView *cycleScrollView3 = [YCCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 400, w, 180) delegate:self placeholderImage:[UIImage imageNamed:@"placeholder"]];
    cycleScrollView3.currentPageDotImage = [UIImage imageNamed:@"pageControlCurrentDot"];
    cycleScrollView3.pageDotImage = [UIImage imageNamed:@"pageControlDot"];
    cycleScrollView3.imageURLStringsGroup = imagesURLStrings;
    [demoContainerView addSubview:cycleScrollView3];

    //4. 网络加载 --- 创建只上下滚动展示文字的轮播器
    YCCycleScrollView *cycleScrollView4 = [YCCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 600, w, 40) delegate:self placeholderImage:nil];
    cycleScrollView4.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    cycleScrollView4.onlyDisplayText = YES;

    NSMutableArray *titlesArray = [NSMutableArray new];
    [titlesArray addObjectsFromArray:titles];
    cycleScrollView4.titlesGroup = [titlesArray copy];
    [cycleScrollView4 disableScrollGesture];
    [demoContainerView addSubview:cycleScrollView4];

    //5 如果要实现自定义cell的轮播图，必须先实现customCollectionViewCellClassForCycleScrollView:和setupCustomCell:forIndex:代理方法
    _customCellScrollViewDemo = [YCCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 660, w, 120) delegate:self placeholderImage:[UIImage imageNamed:@"placeholder"]];
    _customCellScrollViewDemo.currentPageDotImage = [UIImage imageNamed:@"pageControlCurrentDot"];
    _customCellScrollViewDemo.pageDotImage = [UIImage imageNamed:@"pageControlDot"];
    _customCellScrollViewDemo.imageURLStringsGroup = imagesURLStrings;

    [demoContainerView addSubview:_customCellScrollViewDemo];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    // 如果你发现你的CycleScrollview会在viewWillAppear时图片卡在中间位置，你可以调用此方法调整图片位置
    // [你的CycleScrollview adjustWhenControllerViewWillAppera];
}

#pragma mark -- YCCycleScrollViewDelegate
- (void)cycleScrollView:(YCCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index {
    NSLog(@"---点击了第%ld张图片", (long)index);
    
    [self.navigationController pushViewController:[NSClassFromString(@"YCPushViewController") new] animated:YES];
}

//// 滚动到第几张图回调
//- (void)cycleScrollView:(YCCycleScrollView *)cycleScrollView didScrollToIndex:(NSInteger)index
//{
//    NSLog(@">>>>>> 滚动到第%ld张图", (long)index);
//}



@end
