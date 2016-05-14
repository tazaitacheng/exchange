//
//  ZyyTabBarViewController.m
//  freechange
//
//  Created by lk on 16/5/13.
//  Copyright © 2016年 何健. All rights reserved.
//

#import "ZyyTabBarViewController.h"
#import "ZyyHomeViewController.h"
#import "ZyyChangeViewController.h"
#import "ZyyCommunityViewController.h"
#import "ZyyMineViewController.h"
@interface ZyyTabBarViewController ()

@end

@implementation ZyyTabBarViewController
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initRootVC];
    // Do any additional setup after loading the view.
}
-(void)initRootVC
{
    
    //    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.view.hidden = NO;
    //1.
    ZyyHomeViewController *VC1 = [[ZyyHomeViewController alloc] init];
    UINavigationController *nav1 = [[UINavigationController alloc] initWithRootViewController:VC1];
    
    //    InfoViewController *VC2 = [[InfoViewController alloc] init];
    //    JZOnSiteViewController *VC2 = [[JZOnSiteViewController alloc] init];
    //    UINavigationController *nav2 = [[UINavigationController alloc] initWithRootViewController:VC2];
    ZyyChangeViewController *VC2 = [[ZyyChangeViewController alloc] init];
    UINavigationController *nav2 = [[UINavigationController alloc] initWithRootViewController:VC2];    ZyyCommunityViewController *VC3 = [[ZyyCommunityViewController alloc] init];
    UINavigationController *nav3 = [[UINavigationController alloc] initWithRootViewController:VC3];
    ZyyMineViewController *VC4 = [[ZyyMineViewController alloc] init];
    UINavigationController *nav4 = [[UINavigationController alloc] initWithRootViewController:VC4];
    VC1.title = @"首页";
    VC2.title = @"换家";
    VC3.title = @"社区";
    VC4.title = @"我的";
    
    //2.
    NSArray *viewCtrs = @[nav1,nav2,nav3,nav4];
    //3.
    //    UITabBarController *tabbarCtr = [[UITabBarController alloc] init];rootTabbarCtr
    self.rootTabbarCtr  = [[UITabBarController alloc] init];
    //4.
    [self.rootTabbarCtr setViewControllers:viewCtrs animated:YES];
    //5.
    //  self.view.inputViewController = self.rootTabbarCtr;
    //[self.view ]
    [self addChildViewController:self.rootTabbarCtr];
    [self.view addSubview:self.rootTabbarCtr.view];
   
    // self.window.rootViewController = self.rootTabbarCtr;

    UITabBar *tabbar = self.rootTabbarCtr.tabBar;
    UITabBarItem *item1 = [tabbar.items objectAtIndex:0];
    UITabBarItem *item2 = [tabbar.items objectAtIndex:1];
    UITabBarItem *item3 = [tabbar.items objectAtIndex:2];
    UITabBarItem *item4 = [tabbar.items objectAtIndex:3];
    item1.selectedImage = [[UIImage imageNamed:@"icon_tabbar_homepage_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    item1.image = [[UIImage imageNamed:@"icon_tabbar_homepage"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    item2.selectedImage = [[UIImage imageNamed:@"icon_tabbar_merchant_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    item2.image = [[UIImage imageNamed:@"icon_tabbar_merchant_normal"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    //    item2.imageInsets = UIEdgeInsetsMake(6, 0, -6, 0);
    
    
    
    item3.selectedImage = [[UIImage imageNamed:@"icon_tabbar_onsite_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    item3.image = [[UIImage imageNamed:@"icon_tabbar_onsite"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    //    item3.imageInsets = UIEdgeInsetsMake(6, 0, -6, 0);
    item4.selectedImage = [[UIImage imageNamed:@"icon_tabbar_mine_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    item4.image = [[UIImage imageNamed:@"icon_tabbar_mine"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    //    item4.imageInsets = UIEdgeInsetsMake(6, 0, -6, 0);
    //    item5.imageInsets = UIEdgeInsetsMake(6, 0, -6, 0);
    
    //改变UITabBarItem字体颜色
    //    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:RGB(54, 185,175),UITextAttributeTextColor, nil] forState:UIControlStateSelected];
    
    //友盟统计
    //    [MobClick startWithAppkey:UMAPPKEY reportPolicy:BATCH   channelId:@"GitHub"];
    //
    //
    //    //友盟初始化
    //    [UMSocialData setAppKey:UMAPPKEY];
    //    [UMSocialWechatHandler setWXAppId:@"wx3b1ec5fee404cc3d" appSecret:@"e97199313f931035a765ee433e335dbb" url:@"http://www.fityun.cn/"];
    
    //友盟初始化，对未安装QQ，微信的平台进行隐藏
    //    [UMSocialConfig hiddenNotInstallPlatforms:@[UMShareToQQ,UMShareToQzone,UMShareToWechatSession,UMShareToWechatTimeline]];
    //    [UMSocialConfig hiddenNotInstallPlatforms:@[UMShareToWechatSession,UMShareToWechatTimeline]];
    
    
    
     [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    
    
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
