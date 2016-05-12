//
//  HJPopView.h
//  freechange
//
//  Created by lkjy on 16/5/12.
//  Copyright © 2016年 何健. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol HJPopViewDelegate <NSObject>

@optional

-(void)itemPressedWidthIndex:(NSInteger)index;

@end

@interface HJPopView : UIView
@property(nonatomic,weak)id<HJPopViewDelegate>delegate;

@property(nonatomic,assign)NSInteger selectedToIndex;

@property(nonatomic,strong)NSArray* titleNames;

-(instancetype)initWithTitleNames:(NSArray*)titleNames;

-(void)show;

@end
