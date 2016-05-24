//
//  NSString+StringSize.h
//  换家
//
//  Created by lkjy on 16/5/23.
//  Copyright © 2016年 何健. All rights reserved.
//

#import <Foundation/Foundation.h>
@import UIKit;

@interface NSString (StringSize)

-(CGSize)stringSizeWithFont:(UIFont*)font maxWidth:(CGFloat)maxWidth maxHeight:(CGFloat)maxHeight;

-(CGSize)stringSizeWithFont:(UIFont *)font maxWidth:(CGFloat)maxWidth;

-(CGSize)stringSizeWithFont:(UIFont*)font;


@end
