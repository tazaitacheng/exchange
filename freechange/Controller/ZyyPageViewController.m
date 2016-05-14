//
//  ZyyPageViewController.m
//  freechange
//
//  Created by lk on 16/5/13.
//  Copyright © 2016年 何健. All rights reserved.
//

#import "ZyyPageViewController.h"
#import "LGSublimationView.h"
#import "ZyyTabBarViewController.h"

@interface ZyyPageViewController ()<LGSublimationViewDelegate,UIGestureRecognizerDelegate>

@end

@implementation ZyyPageViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
//    UIButton * button=[[UIButton alloc]initWithFrame:CGRectMake(100, 100, 200, 30)];
//    button.backgroundColor=[UIColor orangeColor];
//    [self.view addSubview:button];
    
}
- (void)loadView
{
    [super loadView];
    
    LGSublimationView *lgSublimer = [[LGSublimationView alloc]initWithFrame:self.view.bounds];
    
    NSMutableArray * views = [NSMutableArray new];
    
    for (int i  = 1; i<=4; i++)
    {
        UIImageView *view = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
        
        view.image = [UIImage imageNamed:[NSString stringWithFormat:@"%i.jpg",i]];
        
        view.contentMode = UIViewContentModeScaleAspectFill;
        
        [views addObject:view];
        
    }
    
    
    lgSublimer.titleLabelTextColor = [UIColor whiteColor];
    lgSublimer.descriptionLabelTextColor = [UIColor whiteColor];
    lgSublimer.delegate = self;
    lgSublimer.titleLabelFont = [UIFont fontWithName:@"HelveticaNeue-Light" size:20];
    lgSublimer.descriptionLabelFont = [UIFont fontWithName:@"HelveticaNeue-UltraLight" size:20];
    lgSublimer.titleStrings = @[@"布拉德",
                                @"赫本",
                                @"阿汤哥",
                                @"茱莉亚"];
    lgSublimer.descriptionStrings = @[@"大家好，我是布拉德皮特，欢迎收听小贤有约",
                                      @"大家好，我是赫本，欢迎收听小贤有约"
                                      ,@"大家好，我是阿汤哥，欢迎收听小贤有约",
                                      @"大家好，我是茱莉亚，欢迎收听小贤有约"];
    
    
    lgSublimer.viewsToSublime = views;
    
    UIView * shadeView = [[UIView alloc]initWithFrame:lgSublimer.frame];
    shadeView.backgroundColor = [UIColor blackColor];
    shadeView.alpha = .5;
    
    lgSublimer.inbetweenView = shadeView;
    
    [self.view addSubview:lgSublimer];
    
    
}

-(void)lgSublimationView:(LGSublimationView *)view didEndScrollingOnPage:(NSUInteger)page
{
    NSLog(@"当前页面:%i",(int)page);
    
    if(page == 4)
    {
        view.userInteractionEnabled = YES;
        //点击区分双击和单击
        UITapGestureRecognizer *doubleTap = [[UITapGestureRecognizer alloc]
                                             initWithTarget:self
                                             action:@selector(handleDoubleTap:)];
        
        [doubleTap setNumberOfTapsRequired:2];
        
        [view addGestureRecognizer:doubleTap];
        
        UITapGestureRecognizer* singleTap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(singletap:)];
        [singleTap setNumberOfTouchesRequired:1];
        [view addGestureRecognizer:singleTap];
        
        
        doubleTap.delegate = self;
        
    }
    
}
-(void)singletap:(UIGestureRecognizer*)gestureView
{
    NSLog(@"66567");
}

-(void)handleDoubleTap:(UIGestureRecognizer*)gestureView
{
    NSLog(@"在此执行跳转");
    
    
    //    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    //
    //    UIViewController* viewC = [storyBoard instantiateViewControllerWithIdentifier:@"MainViewC"];
    
    ZyyTabBarViewController* first=[[ZyyTabBarViewController alloc]init];
    
    //此处可以自定义转场动画，啦啦啦啦啦啦啦
    
    [self presentViewController:first animated:YES completion:^{
        NSLog(@"开始APP");
    }];
    
    
}

//- (void)didReceiveMemoryWarning
//    {
//    [super didReceiveMemoryWarning];
//    // Dispose of any resources that can be recreated.
//}



@end
