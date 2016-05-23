//
//  YanZhengViewController.m
//  freechange
//
//  Created by lk on 16/5/16.
//  Copyright © 2016年 何健. All rights reserved.
//

#import "YanZhengViewController.h"
#import <SMS_SDK/SMSSDK.h>
#import "HYPZhuceViewController.h"
#import "SetPasswordViewController.h"
#define kCountDownTime 59
@interface YanZhengViewController ()
{
    NSUInteger countDownTime;
    NSTimer* timer;
}
@end

@implementation YanZhengViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _phoneSendLabel.text=[NSString stringWithFormat:@"我们已经给你的手机号码%@发送了一条验证短信",[[HYPZhuceViewController shareInstance] transPhoneString]];
    _verifyCodeTextField.delegate=self;
    [self startCountDown];
    
    
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    [_verifyCodeTextField becomeFirstResponder];
}

-(void)startCountDown
{
    countDownTime=kCountDownTime;
    _timeLabel.text=[NSString stringWithFormat:@"%lu",countDownTime];
    _resendButton.hidden=YES;
    timer=[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(changeTime) userInfo:nil repeats:YES];
}

-(void)changeTime
{
    countDownTime--;
    _timeLabel.text=[NSString stringWithFormat:@"%lu",countDownTime];
    if (countDownTime<=0)
    {
        _timeLabel.text=@"";
        _resendButton.hidden=NO;
        
        //使计时无效
        [timer invalidate];
        //防止timer被释放掉后还继续访问
        timer=nil;
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//重新发送验证码按钮
- (IBAction)resendButton:(id)sender
{
    [self startCountDown];
    [[HYPZhuceViewController shareInstance]nextButton];
}

- (IBAction)nextButton:(id)sender
{
    [SMSSDK commitVerificationCode:_verifyCodeTextField.text phoneNumber:[[HYPZhuceViewController shareInstance] phoneNumber].text zone:@"86" result:^(NSError *error) {
        if (error)
        {
            //创建提示框
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"验证码错误" preferredStyle: UIAlertControllerStyleAlert];
            //创建操作按钮
            UIAlertAction *sureAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                NSLog(@"这是确认按钮");
            }];
            //将提示框动作添加到提示框上
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
    static YanZhengViewController* shareInstance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken,^{
        UIStoryboard* zhuceSB=[UIStoryboard storyboardWithName:@"ZhuCe" bundle:nil];
        shareInstance=[zhuceSB instantiateViewControllerWithIdentifier:@"YanZheng"];
    });
    return shareInstance;
}


@end
