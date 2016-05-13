//
//  ZyyPageViewController.m
//  freechange
//
//  Created by lk on 16/5/13.
//  Copyright © 2016年 何健. All rights reserved.
//

#import "ZyyPageViewController.h"
#import "ZyyMZGuidePages.h"
@interface ZyyPageViewController ()

@end

@implementation ZyyPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self guidePages];

    
}
- (void)guidePages
{
    //数据源
    NSArray *imageArray = @[ @"1.jpg", @"2.jpg", @"3.jpg", @"4.jpg" ];
    
    //  初始化方法1
    ZyyMZGuidePages *mzgpc = [[ZyyMZGuidePages alloc] init];
    mzgpc.imageDatas = imageArray;
    __weak typeof(ZyyMZGuidePages) *weakMZ = mzgpc;
    mzgpc.buttonAction = ^{
        [UIView animateWithDuration:2.0f
                         animations:^{
                             weakMZ.alpha = 0.0;
                         }
                         completion:^(BOOL finished) {
                             [weakMZ removeFromSuperview];
                         }];
    };
    
    //  初始化方法2
    //    MZGuidePagesController *mzgpc = [[MZGuidePagesController alloc]
    //    initWithImageDatas:imageArray
    //                                                                            completion:^{
    //                                                                              NSLog(@"click!");
    //
    
    //要在makeKeyAndVisible之后调用才有效
    [self.view addSubview:mzgpc];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
