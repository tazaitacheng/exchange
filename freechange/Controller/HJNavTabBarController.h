//
//  HJNavTabBarController.h
//  freechange
//
//  Created by lkjy on 16/5/12.
//  Copyright © 2016年 何健. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HJNavTabBar;

@interface HJNavTabBarController : UIViewController

@property (nonatomic, assign) BOOL scrollAnimation;

@property (nonatomic, assign) BOOL mainViewBounces;

@property (nonatomic, assign) BOOL showArrayButton;

@property (nonatomic, strong) NSArray *subViewControllers;        // 子控制器

@property (nonatomic, strong) UIColor *navTabBarColor;            // 不能设置为[UIColor clearColor]
@property (nonatomic, strong) UIColor *navTabBarLineColor;

@property (nonatomic, assign) NSInteger unchangedToIndex;

@property (nonatomic, assign) NSInteger selectedToIndex;


/**
 *  初始化（展示子控制器）
 *
 *  @param subViewControllers 子控制器数组
 *
 *  @return 实例
 */
- (instancetype)initWithSubViewControllers:(NSArray *)subViewControllers;

/**
 *  初始化（并指明父控制器）
 *
 *  @param viewController 父控制器
 *
 *  @return Instance
 */
- (instancetype)initWithParentViewController:(UIViewController *)viewController;

/**
 *  初始化（指明父控制器，并给子控制器赋值）
 *
 *  @param subControllers 子控制器数组
 *  @param viewController 父控制器
 *
 *  @return 实例
 */
- (instancetype)initWithSubViewControllers:(NSArray *)subControllers andParentViewController:(UIViewController *)viewController;

/**
 *  添加父控制器
 *
 *  @param viewController 父控制器
 */
- (void)addParentController:(UIViewController *)viewController;

@end
