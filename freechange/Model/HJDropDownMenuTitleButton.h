//
//  HDropDownMenuTitleButton.h
//  换家
//
//  Created by lkjy on 16/5/23.
//  Copyright © 2016年 何健. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HJDropDownMenuTitleButton : UIButton

@property (nonatomic, strong) UIColor *arrowColor;
@property (nonatomic, strong) UIColor *mainTitleColor;
@property (nonatomic, strong) UIColor *subTitleColor;
@property (nonatomic, copy) NSString *subTitle;

@property (nonatomic, assign) NSInteger index;

- (instancetype)initWithMainTitle:(NSString *)mainTitle
                         subTitle:(NSString *)subTitle;

- (instancetype)initWithTitle:(NSString *)title;

@end
