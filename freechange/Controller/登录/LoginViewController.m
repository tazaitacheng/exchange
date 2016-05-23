//
//  LoginViewController.m
//  freechange
//
//  Created by lk on 16/5/10.
//  Copyright © 2016年 何健. All rights reserved.
//

#import "LoginViewController.h"
#import "HYPZhuceViewController.h"

#import <AFNetworking/AFNetworking.h>
#import <AFNetworking/AFHTTPSessionManager.h>
#import "ZyyTabBarViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
  
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)LoginButton:(id)sender
{
    AFHTTPSessionManager* manager=[AFHTTPSessionManager manager];
    manager.responseSerializer=[AFJSONResponseSerializer serializerWithReadingOptions:NSJSONReadingAllowFragments];
    [manager.responseSerializer.acceptableContentTypes setByAddingObject:@"text/html"];
    [manager.responseSerializer.acceptableContentTypes setByAddingObject:@"text/plain"];
    NSString* url=@"http://127.0.0.1/freechange/loginIn.php";
    NSDictionary* dic=@{@"phoneNumber":_phoneNumberTextField.text,@"password":_paswordTextField.text};
    
    [manager POST:url parameters:dic progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"访问成功");
        NSLog(@"json:%@",responseObject);
        //页面跳转语句
        ZyyTabBarViewController* tabBar=[[ZyyTabBarViewController alloc]init];
        [self.navigationController pushViewController:tabBar animated:YES];
        
        
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"error:%@",error);
        NSLog(@"访问数据库失败");
        UIAlertController* alert=[UIAlertController alertControllerWithTitle:@"提示" message:@"用户名和密码不匹配，请重新输入！" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction* ensure=[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            NSLog(@"点击了确定按钮");
        }];
        UIAlertAction* cancel=[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            NSLog(@"点击了确定取消");
        }];
        [alert addAction:ensure];
        [alert addAction:cancel];
        
        [self presentViewController:alert animated:YES completion:^{
            NSLog(@"哈哈");
        }];
        

    }];

}

- (IBAction)FastZhuCeButton:(id)sender
{

        [self presentViewController:[HYPZhuceViewController shareInstance] animated:YES completion:^{
            NSLog(@"转到登录界面");
//            LoginViewController* login=[LoginViewController shareInstance];
//            [self.navigationController pushViewController:login animated:YES];
            
           
        }];

    
    
    
}

+(instancetype)shareInstance
{
    static LoginViewController* shareInstance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken,^{
        UIStoryboard* login=[UIStoryboard storyboardWithName:@"Login" bundle:nil];
        shareInstance=[login instantiateViewControllerWithIdentifier:@"LoginViewController"];
    });
    return shareInstance;
}


@end
