//
//  HJDropDownMenu.h
//  换家
//
//  Created by lkjy on 16/5/23.
//  Copyright © 2016年 何健. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HJIndexPath : NSObject

@property (nonatomic, assign) NSInteger column;
@property (nonatomic, assign) NSInteger row;

- (instancetype)initWithColumn:(NSInteger)column row:(NSInteger)row;
+ (instancetype)indexPathWithColumn:(NSInteger)col row:(NSInteger)row;

@end

@class HJDropDownMenu;

@protocol HJDropMenuDataSource <NSObject>
@required
- (NSInteger)numberOfColumnsInMenu:(HJDropDownMenu *)menu;
-(NSInteger)menu:(HJDropDownMenu*)menu numberOfRowsInColumns:(NSInteger)column;
-(NSString*)menu:(HJDropDownMenu*)menu titleForColumn:(NSInteger)column;

@optional
-(NSString*)menu:(HJDropDownMenu *)menu titleForRowAtIndexPath:(HJIndexPath*)indexPath;

@end

@protocol HJDropMenuDelegate <NSObject>

@optional
-(void)menu:(HJDropDownMenu*)menu didSelectRowAtIndexPath:(HJIndexPath*)indexPath;

@end

@interface HJDropDownMenu : UIView

@property(nonatomic,weak)id<HJDropMenuDataSource>dataSource;
@property(nonatomic,weak)id<HJDropMenuDelegate>delegate;

@end
