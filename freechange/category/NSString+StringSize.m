//
//  NSString+StringSize.m
//  换家
//
//  Created by lkjy on 16/5/23.
//  Copyright © 2016年 何健. All rights reserved.
//

#import "NSString+StringSize.h"

@implementation NSString (StringSize)

-(CGSize)stringSizeWithFont:(UIFont *)font maxWidth:(CGFloat)maxWidth maxHeight:(CGFloat)maxHeight
{
    NSMutableDictionary* attr = [NSMutableDictionary dictionary];
    CGSize maxSize = CGSizeMake(maxWidth, maxHeight);
    attr[NSFontAttributeName] = font;
    
    return [self boundingRectWithSize:maxSize options:NSStringDrawingTruncatesLastVisibleLine|NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:attr context:nil].size;
}

-(CGSize)stringSizeWithFont:(UIFont *)font maxWidth:(CGFloat)maxWidth
{
    return [self stringSizeWithFont:font maxWidth:maxWidth maxHeight:MAXFLOAT];
}

-(CGSize)stringSizeWithFont:(UIFont *)font
{
    return [self stringSizeWithFont:font maxWidth:MAXFLOAT maxHeight:MAXFLOAT];
}

@end
