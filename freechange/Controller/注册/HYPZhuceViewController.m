//
//  HYPZhuceViewController.m
//  freechange
//
//  Created by lk on 16/5/14.
//  Copyright © 2016年 何健. All rights reserved.
//

#import "HYPZhuceViewController.h"
//短信验证
#import <SMS_SDK/SMSSDK.h>


@interface HYPZhuceViewController ()

@end

static NSString* phoneString;/**<保存手机号*/

@implementation HYPZhuceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [_phoneNumber becomeFirstResponder];
    _phoneNumber.clearButtonMode=UITextFieldViewModeAlways;
    _phoneNumber.delegate=self;
}

-(NSString*)transPhoneString
{
    return phoneString;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)nextButton:(id)sender
{
    phoneString=_phoneNumber.text;
    if ([_phoneNumber.text length] == 0)
    {
        UIAlertController *alert1 = [UIAlertController alertControllerWithTitle:@"提示" message:@"请输入手机号" preferredStyle:UIAlertControllerStyleAlert];
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
    
    [SMSSDK getVerificationCodeByMethod:SMSGetCodeMethodSMS phoneNumber:_phoneNumber.text zone:@"86" customIdentifier:nil result:^(NSError *error) {
        if (error)
        {
            NSLog(@"%@",error);
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"请输入正确的手机号" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *sureAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                NSLog(@"你点击了确认按钮");
            }];
            //提示框动作添加到提示框上
            [alert addAction:sureAction];
            //将提示框展示出来
            [self presentViewController:alert animated:YES completion:^{
                NSLog(@"结束对话框");
            }];
        }
    }];

}

+(instancetype)shareInstance
{
    static HYPZhuceViewController* shareInstance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken,^{
        UIStoryboard* zhuceSB=[UIStoryboard storyboardWithName:@"ZhuCe" bundle:nil];
        shareInstance=[zhuceSB instantiateViewControllerWithIdentifier:@"Zhuce"];
    });
    return shareInstance;
}
@end
