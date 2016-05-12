//
//  UIView+HJFrame.m
//  freechange
//
//  Created by lkjy on 16/5/10.
//  Copyright © 2016年 何健. All rights reserved.
//

#import "UIView+HJFrame.h"

@implementation UIView (HJFrame)



-(void)setRectX:(CGFloat)rectX
{
    CGRect frame = self.frame;
    frame.origin.x = rectX;
    self.frame = frame;
}
-(CGFloat)rectX
{
    return self.frame.origin.x;
}

-(void)setRectY:(CGFloat)rectY
{
    CGRect frame = self.frame;
    frame.origin.y = rectY;
    self.frame = frame;
}
-(CGFloat)rectY
{
    return self.frame.origin.y;
}

-(void)setRectWidth:(CGFloat)rectWidth
{
    CGRect frame = self.frame;
    frame.size.width= rectWidth;
    self.frame = frame;
}
-(CGFloat)rectWidth
{
    return self.frame.size.width;
}

-(void)setRectHeight:(CGFloat)rectHeight
{
    CGRect frame = self.frame;
    frame.size.height= rectHeight;
    self.frame = frame;
}
-(CGFloat)rectHeight
{
    return self.frame.size.height;
}

-(void)setCenterX:(CGFloat)centerX
{
    CGPoint center = self.center;
    center.x = centerX;
    self.center = center;
}
-(CGFloat)centerX
{
    return self.center.x;
}

-(void)setCenterY:(CGFloat)centerY
{
    CGPoint center = self.center;
    center.y = centerY;
    self.center = center;
}
-(CGFloat)centerY
{
    return self.center.y;
}

-(void)setSize:(CGSize)size
{
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}
-(CGSize)size
{
    return self.frame.size;
}

-(void)setOrigin:(CGPoint)origin
{
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}
-(CGPoint)origin
{
    return self.frame.origin;
}




@end
