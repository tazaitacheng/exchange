//
//  HJDropDownMenuUICalc.m
//  换家
//
//  Created by lkjy on 16/5/23.
//  Copyright © 2016年 何健. All rights reserved.
//

#import "HJDropDownMenuUICalc.h"

@implementation HJDropDownMenuUICalc

+(instancetype)sharedInstance
{
    static HJDropDownMenuUICalc* sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[HJDropDownMenuUICalc alloc]init];
    });
    return sharedInstance;
}

-(HJDROPDOWNMENU_MENU_UI_VALUE*)menuUIValue
{
    static HJDROPDOWNMENU_MENU_UI_VALUE menuUIValue;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        menuUIValue.ANIMATION_DURATION = 0.5f;
        _menuUIValue = &menuUIValue;
    });
    return  _menuUIValue;
}

-(HJDROPDOWNMENU_TITLEBUTTON_UI_VALUE*)titleButtonUIValue
{
    static HJDROPDOWNMENU_TITLEBUTTON_UI_VALUE titleButtonUIValue;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        titleButtonUIValue.MAINTITLELABEL_FONT = 13.f;
        titleButtonUIValue.SUBTITLELABEL_FONT = 12.f;
        titleButtonUIValue.SUBTITLELABEL_TOPMARGIN = 2.5f;
        titleButtonUIValue.ARROWVIEW_LEFTMARGIN = 3.f;
        titleButtonUIValue.ARROWVIEW_WIDTH = 6.f;
        titleButtonUIValue.ARROWVIEW_HEIGHT = 3.f;
        titleButtonUIValue.BOTTOMLINE_HEIGHT = 2.f;
        titleButtonUIValue.BOTTOMSEPERATOR_HEIGHT = 1.f;
        titleButtonUIValue.RIGHTSEPERATOR_WIDTH = 1.f;
        _titleButtonUIValue = &titleButtonUIValue;
    });
    return _titleButtonUIValue;
}

-(HJDROPDOWNMENU_COLLECTIONVIEW_UI_VALUE*)collectionViewUIValue
{
    static HJDROPDOWNMENU_COLLECTIONVIEW_UI_VALUE collectionViewUIValue;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        collectionViewUIValue.VIEW_COLUMNCOUNT = 4;
        
        collectionViewUIValue.CELL_HEIGHT = 27.f;
        collectionViewUIValue.LINESPACING = 14.f;
        collectionViewUIValue.INTERITEMSPACING = 10.f;
        collectionViewUIValue.VIEW_LEFT_RIGHT_MARGIN = 19.f;
        collectionViewUIValue.VIEW_TOP_BOTTOM_MARGIN = 26.f;
        
        collectionViewUIValue.CELL_LABEL_FONT = 13.f;
        collectionViewUIValue.CELL_LABEL_CORNERRADIUS = collectionViewUIValue.CELL_HEIGHT * 0.5;
        
        collectionViewUIValue.CELL_WIDTH = ([[UIScreen mainScreen] bounds].size.width - collectionViewUIValue.VIEW_LEFT_RIGHT_MARGIN * 2 - collectionViewUIValue.INTERITEMSPACING * (collectionViewUIValue.VIEW_COLUMNCOUNT - 1)) / (CGFloat)collectionViewUIValue.VIEW_COLUMNCOUNT;
        
        collectionViewUIValue.SECTIONINSETS = UIEdgeInsetsMake(collectionViewUIValue.VIEW_TOP_BOTTOM_MARGIN, collectionViewUIValue.VIEW_LEFT_RIGHT_MARGIN, collectionViewUIValue.VIEW_TOP_BOTTOM_MARGIN, collectionViewUIValue.VIEW_LEFT_RIGHT_MARGIN);
        
        collectionViewUIValue.ITEMSIZE = CGSizeMake(collectionViewUIValue.CELL_WIDTH, collectionViewUIValue.CELL_HEIGHT);
        
        _collectionViewUIValue = &collectionViewUIValue;

    });
    return _collectionViewUIValue;
}


@end

HJDROPDOWNMENU_MENU_UI_VALUE* dropDownMenuUIValue()
{
    return [[HJDropDownMenuUICalc sharedInstance]menuUIValue];
}

HJDROPDOWNMENU_TITLEBUTTON_UI_VALUE* dropDownMenuTitleButtonUIValue()
{
    return [[HJDropDownMenuUICalc sharedInstance]titleButtonUIValue];
}

HJDROPDOWNMENU_COLLECTIONVIEW_UI_VALUE* dropDownMenuCollectionViewUIValue()
{
    return [[HJDropDownMenuUICalc sharedInstance]collectionViewUIValue];
}

CGFloat deviceWidth()
{
    static CGFloat width;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        width = [[UIScreen mainScreen]bounds].size.width;
    });
    return width;
}

CGFloat deviceHeight()
{
    static CGFloat height;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        height = [[UIScreen mainScreen] bounds].size.height;
    });
    return height;
}


