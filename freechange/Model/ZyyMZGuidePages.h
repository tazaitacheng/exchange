//
//  ZyyMZGuidePages.h
//  freechange
//
//  Created by lk on 16/5/12.
//  Copyright © 2016年 何健. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZyyMZGuidePages : UIView
@property (nonatomic, strong) NSArray *imageDatas;
@property (nonatomic, copy) void (^buttonAction)();

- (instancetype)initWithImageDatas:(NSArray *)imageDatas completion:(void (^)(void))buttonAction;
@end
