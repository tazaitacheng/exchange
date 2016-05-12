//
//  UIImage+HJImageEffcets.h
//  freechange
//
//  Created by lkjy on 16/5/10.
//  Copyright © 2016年 何健. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (HJImageEffcets)

- (UIImage *)applyLightEffect;
- (UIImage *)applyExtraLightEffect;
- (UIImage *)applyDarkEffect;
- (UIImage *)applyTintEffectWithColor:(UIColor *)tintColor;

- (UIImage *)applyBlurWithRadius:(CGFloat)blurRadius tintColor:(UIColor *)tintColor saturationDeltaFactor:(CGFloat)saturationDeltaFactor maskImage:(UIImage *)maskImage;
@end
