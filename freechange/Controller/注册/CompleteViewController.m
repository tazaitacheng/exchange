//
//  CompleteViewController.m
//  freechange
//
//  Created by lk on 16/5/17.
//  Copyright © 2016年 何健. All rights reserved.
//

#import "CompleteViewController.h"
#import "LoginViewController.h"
#import "SetPasswordViewController.h"
#import "ZyyTabBarViewController.h"
@interface CompleteViewController ()

@end

@implementation CompleteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _label.text=[NSString stringWithFormat:@"恭喜%@完成注册!",[[SetPasswordViewController shareInstance]sendNickName]];
    _label.font=[UIFont systemFontOfSize:15];
    
    UIButton* button=[[UIButton alloc]initWithFrame:CGRectMake(100, 300, 150, 30)];
    button.backgroundColor=[UIColor colorWithRed:0.374 green:0.712 blue:0.736 alpha:1.000];
    button.titleLabel.text=@"去首页吧";
    //button.titleLabel.textAlignment=
    [button addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview: button];
    
    


}
-(void)click
{
    //转到首页
    ZyyTabBarViewController* tabBar=[ZyyTabBarViewController new];
    [self.navigationController pushViewController:tabBar animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)GoTOLoginViewC:(id)sender
{
    
    
//    [self presentViewController:[LoginViewController shareInstance] animated:YES completion:^{
//        NSLog(@"转到登录界面");
//    }];
    
    //转到首页
    ZyyTabBarViewController* tabBar=[ZyyTabBarViewController new];
    [self.navigationController pushViewController:tabBar animated:YES];
    
    

}
@end
