//
//  HJChannelViewModel.m
//  freechange
//
//  Created by lkjy on 16/5/10.
//  Copyright © 2016年 何健. All rights reserved.
//

#import "HJChannelViewModel.h"

@implementation HJChannelViewModel

-(instancetype)initWithTotalArray:(NSArray *)totalArray
{
    if (self = [super init])
    {
        self.totalArray = totalArray;
    }
    return self;
}

-(void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.totalArray forKey:@"totalArray"];
}

-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (self)
    {
        self.totalArray = [aDecoder decodeObjectForKey:@"totalArray"];
    }
    return self;
}

@end
