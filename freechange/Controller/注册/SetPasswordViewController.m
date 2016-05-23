//
//  SetPasswordViewController.m
//  freechange
//
//  Created by lk on 16/5/16.
//  Copyright © 2016年 何健. All rights reserved.
//

#import "SetPasswordViewController.h"
#import "HYPZhuceViewController.h"
#import <AFNetworking/AFNetworking.h>
#import <AFNetworking/AFHTTPSessionManager.h>
@interface SetPasswordViewController ()

@property(nonatomic,copy)NSString* phoneNum;/**<手机号*/
@property(nonatomic,copy)NSString* password;/**<保存密码*/
@property(nonatomic,copy)NSString* nickName;/**<保存昵称*/

@end

static NSString* nickName;

@implementation SetPasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _passwordTextField.delegate=self;
    _nickNameTextField.delegate=self;
    //把注册页面的手机号传到设置页面，准备传入数据库
    _phoneNum=[[HYPZhuceViewController shareInstance] transPhoneString];
    NSLog(@"phone:%@",_phoneNum);
   
}
-(BOOL)textFieldShouldEndEditing:(UITextField *)textField
{
    if (textField==_passwordTextField)
    {
        [_passwordTextField resignFirstResponder];
//        _password=_passwordTextField.text;

    }
    else
    {
        [_nickNameTextField resignFirstResponder];
//        _nickName=_nickNameTextField.text;
    }
    return YES;

}


-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)completeButton:(id)sender
{
    nickName=_nickNameTextField.text;

    if (self.passwordTextField.text.length<6)
    {
        UIAlertController *alert1 = [UIAlertController alertControllerWithTitle:@"提示" message:@"密码不少于6位的字母、数字和字符组成，请重新设置密码" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *sureAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            NSLog(@"你点击了确认按钮");
        }];
        //提示框动作添加到提示框上
        [alert1 addAction:sureAction];
        //将提示框展示出来
        [self presentViewController:alert1 animated:YES completion:^{
            NSLog(@"结束对话框");
        }];
        
    }
    else{
    _password=_passwordTextField.text;
    _nickName=_nickNameTextField.text;
    NSLog(@"password:%@",_password);
    NSLog(@"nickName:%@",_nickName);
    AFHTTPSessionManager* manager=[AFHTTPSessionManager manager];
    manager.responseSerializer=[AFJSONResponseSerializer serializerWithReadingOptions:NSJSONReadingAllowFragments];
    [manager.responseSerializer.acceptableContentTypes setByAddingObject:@"text/html"];
    [manager.responseSerializer.acceptableContentTypes setByAddingObject:@"text/plain"];
    NSString* url=@"http://127.0.0.1/freechange/login.php";
    NSDictionary* dic=@{@"phoneNumber":_phoneNum,@"password":_password,@"nickName":_nickName};
    [manager POST:url parameters:dic progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject)
     {
        NSLog(@"数据存储成功");
         
    }
          failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error)
     {
        NSLog(@"访问失败");
        NSLog(@"error:%@",error);
    }];
    }
}

+(instancetype)shareInstance
{
    static SetPasswordViewController* shareInstance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken,^{
        UIStoryboard* zhuceSB=[UIStoryboard storyboardWithName:@"ZhuCe" bundle:nil];
        shareInstance=[zhuceSB instantiateViewControllerWithIdentifier:@"SetPasword"];
    });
    return shareInstance;
}

-(NSString*)sendNickName
{
    return nickName;
}


@end
