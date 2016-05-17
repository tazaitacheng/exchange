//
//  ZyyHomeViewController.m
//  freechange
//
//  Created by lk on 16/5/17.
//  Copyright © 2016年 何健. All rights reserved.
//

#import "ZyyHomeViewController.h"
#import "SearchTableViewController.h"
#import "Public.h"
#import "ZyyMapViewControlle.h"
@interface ZyyHomeViewController ()

@end

@implementation ZyyHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    self.navigationController.interactivePopGestureRecognizer.delegate = nil;
     [self setNav];
    // Do any additional setup after loading the view from its nib.
}
-(void)setNav
{
   // 背景View
    UIView *backView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, screen_width, 64)];
    backView.backgroundColor = navigationBarColor;
    [self.view addSubview:backView];
    
    //城市
    UIButton* cityBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    cityBtn.frame=CGRectMake(10, 30, 40, 25);
    cityBtn.titleLabel.font=[UIFont systemFontOfSize:15];
    [cityBtn setTitle:@"城市" forState:UIControlStateNormal];
    [backView addSubview:cityBtn];
    UIImageView *arrowImage = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(cityBtn.frame), 38, 13, 10)];
    [arrowImage setImage:[UIImage imageNamed:@"icon_homepage_downArrow"]];
    [backView addSubview:arrowImage];
    
    //地图
    UIButton *mapBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    mapBtn.frame = CGRectMake(screen_width-42, 25, 42, 30);
    [mapBtn setImage:[UIImage imageNamed:@"icon_homepage_map_old"] forState:UIControlStateNormal];
    [mapBtn addTarget:self action:@selector(OnMapBtnTap:) forControlEvents:UIControlEventTouchUpInside];
    [backView addSubview:mapBtn];
    
    //添加搜索按钮
//    UIBarButtonItem* rightItem = [[UIBarButtonItem alloc] initWithTitle:@"搜索" style:UIBarButtonItemStylePlain target:self action:@selector(goSearch)];
//    
//        self.navigationItem.rightBarButtonItem = rightItem;
    //[backView addSubview:rightItem];
    UIButton* searchBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    searchBtn.frame=CGRectMake(screen_width/2-20, 25, 40, 30);
    [searchBtn setTitle:@"搜索" forState:UIControlStateNormal];
    [searchBtn addTarget:self action:@selector(goSearch) forControlEvents:UIControlEventTouchUpInside];
    [backView addSubview:searchBtn];
    
    
}
-(void)OnMapBtnTap:(UIButton *)sender
{
    ZyyMapViewControlle* mapViewController=[[ZyyMapViewControlle alloc]init];
    
    [self.navigationController pushViewController:mapViewController animated:YES];
}

////添加搜索按钮
//-(void)setNav
//{
//    UIBarButtonItem* rightItem = [[UIBarButtonItem alloc] initWithTitle:@"搜索" style:UIBarButtonItemStylePlain target:self action:@selector(goSearch)];
//    
//    self.navigationItem.rightBarButtonItem = rightItem;
//    
//}
- (void)goSearch
{
    SearchTableViewController* searchVc = [SearchTableViewController new];
    [self.navigationController pushViewController:searchVc animated:YES];
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
