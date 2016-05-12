//
//  NSArray+HJLog.m
//  freechange
//
//  Created by lkjy on 16/5/10.
//  Copyright © 2016年 何健. All rights reserved.
//

#import "NSArray+HJLog.h"

@implementation NSArray (HJLog)

-(NSString*)descriptionWithLocale:(id)locale
{
    NSMutableString* strM = [NSMutableString stringWithString:@"(\n"];
    
    [self enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [strM appendFormat:@"\t%@,\n",obj];
    }];
    [strM appendFormat:@")"];//字符串的拷贝
    return strM;
}

@end

@implementation NSArray (CompareWithOtherArray)

- (BOOL)compareWithOtherArray:(NSArray *)otherArray
{
    __block BOOL equal = YES;
    if (self.count != otherArray.count)
    {
        return NO;
    }
    else
    {
        [self enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop)
        {
            if (![self[idx] isEqual:otherArray[idx]])
            {
                equal = NO;
            }
        }];
    }
    return equal;
}

@end

@implementation NSDictionary (Log)

- (NSString *)descriptionWithLocale:(id)locale
{
    NSMutableString *strM = [NSMutableString stringWithString:@"{\n"];
    
    [self enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop)
    {
        [strM appendFormat:@"\t%@ = %@;\n", key, obj];
    }];
    
    [strM appendString:@"}\n"];
    
    return strM;
}

@end