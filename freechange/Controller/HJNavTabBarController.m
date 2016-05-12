//
//  HJNavTabBarController.m
//  freechange
//
//  Created by lkjy on 16/5/12.
//  Copyright © 2016年 何健. All rights reserved.
//

#import "HJNavTabBarController.h"
#import "HJNavTabBar.h"
#import "ZLCommonConst.h"
#import "HJChannelViewModel.h"
#import <objc/message.h>



@interface HJNavTabBarController ()<UIScrollViewDelegate, UITabBarDelegate>
@property (nonatomic, strong) NSMutableArray *titles;
@property (nonatomic, strong) NSMutableArray *selectedVCArray;
@property (nonatomic, strong) UIScrollView *mainView;
@property (nonatomic, strong) HJNavTabBar *navTabBar;
@property (nonatomic, assign) NSInteger currentIndex;
@property (nonatomic, strong) NSMutableArray *totalTitles;
@property (nonatomic, assign) NSString *recordLastClickTitle;

@end

static void *RecordLastClickKey = @"RecordLastClickKey";

@implementation HJNavTabBarController

#pragma mark - Life Cycle

- (instancetype)init
{
    if (self = [super init])
    {
        _selectedToIndex = 5;
        _showArrayButton = YES;
    }
    return self;
}

- (instancetype)initWithSubViewControllers:(NSArray *)subViewControllers
{
    if (self = [self init]) {
        subViewControllers = subViewControllers;
    }
    return self;
}

- (instancetype)initWithParentViewController:(UIViewController *)viewController
{
    if (self = [self init]) {
        [self addParentController:viewController];
    }
    return self;
}

- (instancetype)initWithSubViewControllers:(NSArray *)subControllers andParentViewController:(UIViewController *)viewController
{
    if (self = [self initWithSubViewControllers:subControllers]) {
        [self addParentController:viewController];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.navigationBarHidden = YES;
    [self viewConfig];
    [self initConfig];
    [NS_NOTIFICATION_CENTER addObserver:self selector:@selector(selectedChannelChangedNotification:) name:SelectedChannelChangedNotification object:nil];
    
}

- (void)selectedChannelChangedNotification:(NSNotification *)notification
{
    NSArray* titles = notification.userInfo[SelectedChannelChangedKey];
    _navTabBar.selectedItemTitles = titles;
    [self cleanData];
    [self addChildViewControllerWithTitlesArray:titles];
    NSString *lastTitle = objc_getAssociatedObject(self.recordLastClickTitle, RecordLastClickKey);
    if (titles.count > 0) {
        if ([titles containsObject:lastTitle]) {
            [_mainView setContentOffset:CGPointMake([titles indexOfObject:lastTitle] * SCREEN_WIDTH, ZERO_COORDINATE) animated:_scrollAnimation];
            _navTabBar.currentIndex = [titles indexOfObject:lastTitle];
        } else {
            [_mainView setContentOffset:CGPointMake(ZERO_COORDINATE, ZERO_COORDINATE) animated:_scrollAnimation];
            _navTabBar.currentIndex = 0;
        }
    }

    
}

- (void)dealloc
{
    [NS_NOTIFICATION_CENTER removeObserver:self];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    self.navigationController.navigationBarHidden = NO;
}

- (void)viewConfig
{
    [self viewInit];
    
}

- (void)viewInit
{
    _navTabBarColor = _navTabBarColor ? _navTabBarColor : NavTabbarColor;
    UIView *statusView = [[UIView alloc] initWithFrame:CGRectMake(ZERO_COORDINATE, ZERO_COORDINATE, SCREEN_WIDTH, STATUS_BAR_HEIGHT)];
    statusView.backgroundColor = NavTabbarColor;
    [self.view addSubview:statusView];
    
    _navTabBar = [[HJNavTabBar alloc] initWithFrame:CGRectMake(ZERO_COORDINATE, STATUS_BAR_HEIGHT, SCREEN_WIDTH, NAV_TAB_BAR_HEIGHT) showArrayButton:self.showArrayButton];
    
    _navTabBar.selectedToIndex = _selectedToIndex;
    
    _navTabBar.delegate = self;
    _navTabBar.backgroundColor = _navTabBarColor;
    _navTabBar.lineColor = _navTabBarLineColor;
    
    _mainView = [[UIScrollView alloc] initWithFrame:CGRectMake(ZERO_COORDINATE, _navTabBar.frame.origin.y + _navTabBar.frame.size.height, SCREEN_WIDTH, SCREEN_HEIGHT - _navTabBar.frame.origin.y - _navTabBar.frame.size.height)];
    _mainView.delegate = self;
    _mainView.pagingEnabled = YES;
    _mainView.bounces = _mainViewBounces;
    _mainView.showsHorizontalScrollIndicator = NO;
    [self.view addSubview:_mainView];
    [self.view addSubview:_navTabBar];
}

- (void)initConfig
{
    [self setupTotalTitles];
    [self setupViewControllerDict];
    
    if ([NSUD objectForKey:SELECTED_CHANNEL_NAMES] == nil) {
        for (int index = 0; index < _selectedToIndex; index++) {
            UIViewController *viewController = (UIViewController *)_subViewControllers[index];
            viewController.view.frame = CGRectMake(index * SCREEN_WIDTH, ZERO_COORDINATE, SCREEN_WIDTH, _mainView.frame.size.height);
            [_mainView addSubview:viewController.view];
            [self addChildViewController:viewController];
            [self.titles addObject:[_subViewControllers[index] title]];
        }
        _mainView.contentSize = CGSizeMake(SCREEN_WIDTH * _selectedToIndex, ZERO_COORDINATE);
    } else {
        self.titles = [NSUD objectForKey:SELECTED_CHANNEL_NAMES];
        [self addChildViewControllerWithTitlesArray:self.titles];
    }
    _navTabBar.totalItemTitles = _totalTitles;
    _navTabBar.selectedItemTitles = _titles;
}

- (void)setupTotalTitles
{
    _totalTitles = [NSMutableArray arrayWithCapacity:_subViewControllers.count];
    for (UIViewController *viewController in _subViewControllers)
    {
        [_totalTitles addObject:viewController.title];
    }
}

- (void)setupViewControllerDict
{
    NSMutableDictionary *viewControllerDict = [@{} mutableCopy];
    if (![NSUD objectForKey:VIEWCONTROLLER_INDEX_DICT]) {
        [_subViewControllers enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop){
            UIViewController *viewController = (UIViewController *)_subViewControllers[idx];
            [viewControllerDict setObject:[NSNumber numberWithInteger:idx] forKey:viewController.title];
        }];
        [NSUD setObject:viewControllerDict forKey:VIEWCONTROLLER_INDEX_DICT];
    }
}

- (void)addChildViewControllerWithTitlesArray:(NSArray *)titles
{
    for (int index = 0; index < titles.count; index++) {
        NSDictionary *viewControllerDict = [NSUD objectForKey:VIEWCONTROLLER_INDEX_DICT];
        int viewControllerIndex = [viewControllerDict[titles[index]] intValue];
        UIViewController *viewController = (UIViewController *)_subViewControllers[viewControllerIndex];
        viewController.view.frame = CGRectMake(index * SCREEN_WIDTH, ZERO_COORDINATE, SCREEN_WIDTH, _mainView.frame.size.height);
        [_mainView addSubview:viewController.view];
        [self addChildViewController:viewController];
    }
    _mainView.contentSize = CGSizeMake(SCREEN_WIDTH * titles.count, ZERO_COORDINATE);
}

- (void)setUnchangedToIndex:(NSInteger)unchangedToIndex
{
    _unchangedToIndex = unchangedToIndex;
    int lastValue = [[NSUD objectForKey:UNCHANGED_TO_INDEX] intValue];
    [NSUD setObject:@(_unchangedToIndex) forKey:UNCHANGED_TO_INDEX];
    [NSUD synchronize];
    int newValue = [[NSUD objectForKey:UNCHANGED_TO_INDEX] intValue];
    if (lastValue == newValue) {
        [NSUD setObject:@(NO) forKey:IS_UNCHANGED_TO_INDEX_CHANGED];
        [NSUD synchronize];
    } else {
        [NSUD setObject:@(YES) forKey:IS_UNCHANGED_TO_INDEX_CHANGED];
        [NSUD synchronize];
    }
    
}

- (void)cleanData
{
    [self.childViewControllers makeObjectsPerformSelector:@selector(removeFromParentViewController)];
}

#pragma mark - Public Methods
- (void)setNavTabbarColor:(UIColor *)navTabbarColor
{
    // prevent set [UIColor clear], because this set can take error display
    CGFloat red, green, blue, alpha;
    if ([navTabbarColor getRed:&red green:&green blue:&blue alpha:&alpha] && !red && !green && !blue && !alpha)
    {
        navTabbarColor = NavTabbarColor;
    }
    _navTabBarColor = navTabbarColor;
}

- (void)addParentController:(UIViewController *)viewController
{
    // Close UIScrollView characteristic on IOS7 and later
    if ([viewController respondsToSelector:@selector(edgesForExtendedLayout)])
    {
        viewController.edgesForExtendedLayout = UIRectEdgeNone;
    }
    
    [viewController addChildViewController:self];
    [viewController.view addSubview:self.view];
}

#pragma mark - UIScrollViewDelegate Methods
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    _currentIndex = round(scrollView.contentOffset.x / SCREEN_WIDTH);
    _navTabBar.currentIndex = _currentIndex;
}

#pragma mark - ZLNavTabBarDelegate Methods
- (void)itemDidSelectedWithIndex:(NSInteger)index
{
    [_mainView setContentOffset:CGPointMake(index * SCREEN_WIDTH, ZERO_COORDINATE) animated:_scrollAnimation];
    NSString *selectedChannel = [NSUD objectForKey:SELECTED_CHANNEL_NAMES][index];
    objc_setAssociatedObject(self.recordLastClickTitle, RecordLastClickKey, selectedChannel, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

#pragma mark - Lazy Load

- (NSString *)recordLastClickTitle
{
    if (_recordLastClickTitle == nil) {
        _recordLastClickTitle = [NSString string];
    }
    return _recordLastClickTitle;
}

- (NSMutableArray *)selectedVCArray
{
    if (_selectedVCArray == nil) {
        _selectedVCArray = [@[] mutableCopy];
    }
    return _selectedVCArray;
}

- (NSMutableArray *)titles
{
    if (_titles == nil) {
        _titles = [@[] mutableCopy];
    }
    return _titles;
}

@end
