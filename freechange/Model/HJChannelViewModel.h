//
//  HJChannelViewModel.h
//  freechange
//
//  Created by lkjy on 16/5/10.
//  Copyright © 2016年 何健. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HJChannelViewModel : NSObject<NSCoding>

@property(nonatomic,strong)NSArray* totalArray;

-(instancetype)initWithTotalArray:(NSArray*)totalArray;
@end
