//
//  HJNavTabBar.h
//  freechange
//
//  Created by lkjy on 16/5/12.
//  Copyright © 2016年 何健. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol HJNavTabBarDelegate <NSObject>

@optional

- (void)itemDidSelectedWithIndex:(NSInteger)index;
@end


@interface HJNavTabBar : UIView

@property (nonatomic, weak) id  <HJNavTabBarDelegate>delegate;
@property (nonatomic, assign) NSInteger currentIndex;

@property (nonatomic, strong) NSArray *totalItemTitles;/**<标题数组*/

@property (nonatomic, strong) NSArray *selectedItemTitles;/**<选中的标题*/

@property (nonatomic, assign) NSInteger selectedToIndex;/**<选中的标题的位置*/

@property (nonatomic, strong) UIColor *lineColor;/**<下划线颜色*/

-(instancetype)initWithFrame:(CGRect)frame showArrayButton:(BOOL)yesOrNo;


@end
