//
//  HYPZhuceViewController.h
//  freechange
//
//  Created by lk on 16/5/14.
//  Copyright © 2016年 何健. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HYPZhuceViewController : UIViewController<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UIButton *nextButton;
@property (weak, nonatomic) IBOutlet UITextField *phoneNumber;/**<手机号码输入框*/
- (IBAction)nextButton:(id)sender;

+(instancetype)shareInstance;

-(NSString*)transPhoneString;
@end
