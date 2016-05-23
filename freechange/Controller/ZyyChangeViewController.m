//
//  ZyyChangeViewController.m
//  freechange
//
//  Created by lk on 16/5/13.
//  Copyright © 2016年 何健. All rights reserved.
//

#import "ZyyChangeViewController.h"
#import "Masonry.h"
#import "HJDropDownMenuUICalc.h"
#import "HJDropDownMenuCollectionViewCell.h"
#import "HJDropDownMenu.h"
#import "NSString+StringSize.h"

@interface ZyyChangeViewController ()<HJDropMenuDataSource,HJDropMenuDelegate>

@property (nonatomic, strong) NSArray *mainTitleArray;
@property (nonatomic, strong) NSArray *subTitleArray;
@end

@implementation ZyyChangeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    WS(weakSelf);
    _mainTitleArray = @[@"全部分类",@"热门推荐",@"离我最近"];
    _subTitleArray = @[@[@"衣",@"食",@"住",@"行"],@[@"衣",@"食",@"住",@"行"],@[@"衣",@"食",@"住",@"行"]];
    
    HJDropDownMenu* menu = [[HJDropDownMenu alloc]init];
    
    menu.delegate = self;
    menu.dataSource = self;
     [self.view addSubview:menu];
    
    [menu mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(70);
        make.left.right.equalTo(weakSelf.view);
        make.height.mas_equalTo(50);
    }];
   

}
- (NSInteger)numberOfColumnsInMenu:(HJDropDownMenu *)menu
{
    return self.mainTitleArray.count;
}

- (NSInteger)menu:(HJDropDownMenu *)menu numberOfRowsInColumns:(NSInteger)column
{
    return [self.subTitleArray[column] count];
}

- (NSString *)menu:(HJDropDownMenu *)menu titleForColumn:(NSInteger)column
{
    return self.mainTitleArray[column];
}

- (NSString *)menu:(HJDropDownMenu *)menu titleForRowAtIndexPath:(HJIndexPath *)indexPath
{
    NSArray *array = self.subTitleArray[indexPath.column];
    return array[indexPath.row];
}

- (void)menu:(HJDropDownMenu *)menu didSelectRowAtIndexPath:(HJIndexPath *)indexPath
{
    NSArray *array = self.subTitleArray[indexPath.column];
    switch (indexPath.row)
    {
        case 0:
            NSLog(@"0");
            break;
        case 1:
            NSLog(@"1");
            break;
        case 2:
            NSLog(@"2");
            break;
        case 3:
            NSLog(@"3");
            break;
        default:
            break;
    }
    NSLog(@"点击了%@", array[indexPath.row]);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
