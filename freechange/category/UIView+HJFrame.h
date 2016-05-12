//
//  UIView+HJFrame.h
//  freechange
//
//  Created by lkjy on 16/5/10.
//  Copyright © 2016年 何健. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (HJFrame)

@property (assign, nonatomic) CGFloat rectX;/**  控件的x轴坐标*/

@property (assign, nonatomic) CGFloat rectY;/**  控件的y轴坐标*/

@property (assign, nonatomic) CGFloat rectWidth;/**  控件的宽度width*/

@property (assign, nonatomic) CGFloat rectHeight;/**  控件的高度height*/

@property (assign, nonatomic) CGFloat centerX;/**  控件中心点的x轴坐标*/

@property (assign, nonatomic) CGFloat centerY;/**  控件中心点的y轴坐标*/

@property (assign, nonatomic) CGPoint origin;/**  控件的坐标origin*/

@property (assign, nonatomic) CGSize size;/**  控件的大小size*/



@end
