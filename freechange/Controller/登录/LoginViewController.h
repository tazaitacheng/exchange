//
//  LoginViewController.h
//  freechange
//
//  Created by lk on 16/5/10.
//  Copyright © 2016年 何健. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *phoneNumberTextField;
@property (weak, nonatomic) IBOutlet UITextField *paswordTextField;

- (IBAction)LoginButton:(id)sender;
- (IBAction)FastZhuCeButton:(id)sender;

+(instancetype)shareInstance;

@end
