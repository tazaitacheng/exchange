//
//  HJDropDownMenuCollectionViewCell.m
//  换家
//
//  Created by lkjy on 16/5/23.
//  Copyright © 2016年 何健. All rights reserved.
//

#import "HJDropDownMenuCollectionViewCell.h"
#import "Masonry.h"
#import "HJDropDownMenuUICalc.h"

@implementation HJDropDownMenuCollectionViewCell

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        [self viewConfig];
    }
    
    return self;
}

-(void)viewConfig
{
    WS(weakSelf);
    _label = [[UILabel alloc] init];
    _label.layer.cornerRadius = dropDownMenuCollectionViewUIValue()->CELL_LABEL_CORNERRADIUS;
    _label.layer.masksToBounds = YES;
    _label.textAlignment = NSTextAlignmentCenter;
    _label.font = [UIFont systemFontOfSize:dropDownMenuCollectionViewUIValue()->CELL_LABEL_FONT];
    [self addSubview:_label];
    [_label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(weakSelf);
    }];

}

- (void)setContentString:(NSString *)contentString
{
    _contentString = [contentString copy];
    _label.text = _contentString;
}

- (void)setSelected:(BOOL)selected
{
    [super setSelected:selected];
    _label.backgroundColor = selected ? kDropdownMenuSelectedCellColor : [UIColor clearColor];
    _label.textColor = selected ? [UIColor whiteColor] : kDropdownMenuUnselectedCellTextColor;
}


@end
