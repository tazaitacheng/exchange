//
//  ZyyMZGuidePages.m
//  freechange
//
//  Created by lk on 16/5/12.
//  Copyright © 2016年 何健. All rights reserved.
//

#import "ZyyMZGuidePages.h"
#import "ZyyTabBarViewController.h"
#define SCREEN_WIDTH [[UIScreen mainScreen] bounds].size.width
#define SCREEN_HEIGHT [[UIScreen mainScreen] bounds].size.height
@interface ZyyMZGuidePages () <UIScrollViewDelegate>

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIPageControl *pageControl;
@property (nonatomic, strong) UIButton *actionButton;

@end
@implementation ZyyMZGuidePages

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
// init
- (instancetype)init
{
return [self initWithImageDatas:nil completion:nil];
}

// init with imageDatas and completion
- (instancetype)initWithImageDatas:(NSArray *)imageDatas completion:(void (^)(void))buttonAction
{
self = [super init];
if (self)
{
    [self initView];
    //因为使用了懒加载，_imageDatas = imageDatas不会调用initContentView
    [self setImageDatas:imageDatas];
    _buttonAction = buttonAction;
}
    return self;
}

//懒加载，并初始化内容
- (void)setImageDatas:(NSArray *)imageDatas
{
    _imageDatas = imageDatas;
    [self initContentView];
}

//基础视图初始化
- (void)initView
{
    // init view
    self.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    
    // init scrollView
    _scrollView = [[UIScrollView alloc] init];
    _scrollView.delegate = self;
    _scrollView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    _scrollView.backgroundColor = [UIColor clearColor];
    _scrollView.bounces = NO;
    _scrollView.pagingEnabled = YES;
    _scrollView.showsHorizontalScrollIndicator = NO;
    [self addSubview:_scrollView];
    
    // init pageControl
    _pageControl =
    [[UIPageControl alloc] initWithFrame:CGRectMake(0, SCREEN_HEIGHT - 30, SCREEN_WIDTH, 10)];
    _pageControl.currentPage = 0;
    _pageControl.hidesForSinglePage = YES;
    _pageControl.pageIndicatorTintColor = [UIColor grayColor];
    _pageControl.currentPageIndicatorTintColor = [UIColor whiteColor];
    [self addSubview:_pageControl];
    
    // init button
    _actionButton = [UIButton buttonWithType:UIButtonTypeCustom];
}

//指定数据后，初始化显示内容
- (void)initContentView
{
    if (_imageDatas.count)
    {
        _pageControl.numberOfPages = _imageDatas.count;
        _scrollView.contentSize = CGSizeMake(SCREEN_WIDTH * _imageDatas.count, SCREEN_HEIGHT);
        for (int i = 0; i < _imageDatas.count; i++)
        {
            NSString *imageName = _imageDatas[i];
            UIImageView *imgView =
            [[UIImageView alloc] initWithImage:[UIImage imageNamed:imageName]];
            imgView.frame = CGRectMake(SCREEN_WIDTH * i, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
            [self.scrollView addSubview:imgView];
            
            if (i == _imageDatas.count - 1)
            {
                _actionButton.frame =
                CGRectMake(SCREEN_WIDTH / 2 - 70, SCREEN_HEIGHT - 70, 140, 35);
                _actionButton.layer.cornerRadius = 5;
                _actionButton.layer.masksToBounds = YES;
                [_actionButton setTitle:@"进  入" forState:UIControlStateNormal];
                _actionButton.tintColor = [UIColor whiteColor];
                _actionButton.backgroundColor = [UIColor colorWithRed:0.422 green:1.000 blue:0.949 alpha:1.000];
                [_actionButton addTarget:self
                                  action:@selector(enterButtonClick)
                        forControlEvents:UIControlEventTouchUpInside];
                [imgView addSubview:_actionButton];
                //设置可以响应交互，UIImageView的默认值为NO
                imgView.userInteractionEnabled = YES;
            }
        }
    }
}

#pragma mark
#pragma mark Action
- (void)enterButtonClick
{
    if (_buttonAction)
    {
        _buttonAction();
 
    }    
}

#pragma mark
#pragma mark UIScrollView delegate
//- (void)scrollViewDidScroll:(UIScrollView *)scrollView
//{
//    _pageControl.currentPage = (_scrollView.contentOffset.x + SCREEN_WIDTH / 2) / SCREEN_WIDTH;
//}

//在结束滚动时设置页面，比滚动中改变页面性能更好，因为滚动一次只调用一次
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView;
{
    _pageControl.currentPage = (_scrollView.contentOffset.x + SCREEN_WIDTH / 2) / SCREEN_WIDTH;
}
@end
