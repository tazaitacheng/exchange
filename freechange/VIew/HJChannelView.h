//
//  HJChannelView.h
//  freechange
//
//  Created by lkjy on 16/5/10.
//  Copyright © 2016年 何健. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol HJChannelViewDelegate <NSObject>//设置协议
@optional

-(void)selectedTitlesArray:(NSArray*)selectedArray;

@end

@interface HJChannelView : UIView

@property(nonatomic,assign,readonly)CGFloat viewHeight;/**<视图高度*/
@property(nonatomic,assign)NSInteger selectedToIndex;/**<被选中的标签*/
@property(nonatomic,weak)id<HJChannelViewDelegate>delegate;/**<设置代理*/
@property(nonatomic,strong)NSArray* titleNames;/**<标签名称*/


@end
