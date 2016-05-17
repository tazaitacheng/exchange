//
//  ZyyHomeViewController.m
//  freechange
//
//  Created by lk on 16/5/17.
//  Copyright © 2016年 何健. All rights reserved.
//

#import "ZyyHomeViewController.h"
#import "SearchTableViewController.h"
@interface ZyyHomeViewController ()

@end

@implementation ZyyHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     [self setNav];
    // Do any additional setup after loading the view from its nib.
}
//添加搜索按钮
-(void)setNav
{
    UIBarButtonItem* rightItem = [[UIBarButtonItem alloc] initWithTitle:@"搜索" style:UIBarButtonItemStylePlain target:self action:@selector(goSearch)];
    
    self.navigationItem.rightBarButtonItem = rightItem;
    
}
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
