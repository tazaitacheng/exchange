//
//  SetPasswordViewController.h
//  freechange
//
//  Created by lk on 16/5/16.
//  Copyright © 2016年 何健. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SetPasswordViewController : UIViewController<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *nickNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;

- (IBAction)completeButton:(id)sender;
-(NSString*)sendNickName;

+(instancetype)shareInstance;

@end
