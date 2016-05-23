//
//  YanZhengViewController.h
//  freechange
//
//  Created by lk on 16/5/16.
//  Copyright © 2016年 何健. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YanZhengViewController : UIViewController<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *phoneSendLabel;

@property (weak, nonatomic) IBOutlet UITextField *verifyCodeTextField;
@property (weak, nonatomic) IBOutlet UIButton *resendButton;
- (IBAction)resendButton:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *nextButton;
- (IBAction)nextButton:(id)sender;

+(instancetype)shareInstance;

@end
