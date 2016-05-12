//
//  ViewController.m
//  freechange
//
//  Created by lkjy on 16/5/10.
//  Copyright © 2016年 何健. All rights reserved.
//

#import "ViewController.h"
#import "HJNavTabBarController.h"
#import "HJCommonConst.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIViewController* one = [[UIViewController alloc]init];
    one.title = @"测试界面1";
    one.view.backgroundColor = [UIColor redColor];
    
    UIViewController* two = [[UIViewController alloc]init];
    two.title = @"测试界面2";
    two.view.backgroundColor = [UIColor brownColor];
    
    UIViewController* three = [[UIViewController alloc]init];
    three.title = @"测试界面3";
    three.view.backgroundColor = [UIColor redColor];
    
    UIViewController* four = [[UIViewController alloc]init];
    four.title = @"测试界面4";
    four.view.backgroundColor = [UIColor blueColor];
    
    UIViewController* five = [[UIViewController alloc]init];
    five.title = @"测试界面5";
    five.view.backgroundColor = [UIColor orangeColor];
    
    UIViewController* six = [[UIViewController alloc]init];
    six.title = @"测试界面6";
    six.view.backgroundColor = [UIColor greenColor];
    
    UIViewController* seven = [[UIViewController alloc]init];
    seven.title = @"测试界面7";
    seven.view.backgroundColor = [UIColor whiteColor];
    
    UIViewController* eight = [[UIViewController alloc]init];
    eight.title = @"测试界面8";
    eight.view.backgroundColor = [UIColor purpleColor];
    
    UIViewController* ninght = [[UIViewController alloc]init];
    ninght.title = @"测试界面8";
    ninght.view.backgroundColor = [UIColor purpleColor];
    
    HJNavTabBarController* navTabBarController = [[HJNavTabBarController alloc]init];
    navTabBarController.subViewControllers = @[one,two,three,four,five,six,seven,eight,ninght];
    navTabBarController.mainViewBounces = YES;
    navTabBarController.selectedToIndex = 5;//代表的是当前默认显示的界面
    navTabBarController.unchangedToIndex = 3;//隐藏的 未选中的界面
    navTabBarController.showArrayButton = YES;
    [navTabBarController addParentController:self];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
