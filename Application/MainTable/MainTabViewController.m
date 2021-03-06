//
//  MainTabViewController.m
//  PinBan
//
//  Created by centling on 15/8/12.
//  Copyright (c) 2015年 centling. All rights reserved.
//
//zhangcheng
#import "MainTabViewController.h"

@interface MainTabViewController ()

@property (nonatomic, strong) NSArray *array;
@property(nonatomic,weak) UITabBarController* tabBarController;

@end

@implementation MainTabViewController

+(MainTabViewController *)instance{
    MainTabViewController *mainTabViewController;
//    __weak dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
    if (mainTabViewController == nil) {
        
        mainTabViewController = [[MainTabViewController alloc] init];
            UIStoryboard *EarningStoryBoard = [UIStoryboard storyboardWithName:@"EarningStoryboard" bundle:nil];
            UINavigationController *EarningNV = [EarningStoryBoard instantiateViewControllerWithIdentifier:@"EarningNV"];
            
            UIStoryboard *AdvertisementStoryBoard = [UIStoryboard storyboardWithName:@"AdvertisementStoryboard" bundle:nil];
            UINavigationController *AdvertisementNV = [AdvertisementStoryBoard instantiateViewControllerWithIdentifier:@"AdvertisementNV"];
            
            UIStoryboard *InviteStoryBoard = [UIStoryboard storyboardWithName:@"InviteStoryboard" bundle:nil];
            UINavigationController *InviteNV = [InviteStoryBoard instantiateViewControllerWithIdentifier:@"InviteNV"];
            
            UIStoryboard *InfoStoryBoard = [UIStoryboard storyboardWithName:@"InfoStoryboard" bundle:nil];
            UINavigationController *InfoNV = [InfoStoryBoard instantiateViewControllerWithIdentifier:@"InfoNV"];
            
//            UIStoryboard *infoStoryBoard = [UIStoryboard storyboardWithName:@"InfoStoryboard" bundle:nil];
//            UIViewController *infoNV=[infoStoryBoard instantiateViewControllerWithIdentifier:@"infoNV"];
        
            
            mainTabViewController.viewControllers=[[NSArray alloc] initWithObjects:EarningNV, AdvertisementNV, InviteNV, InfoNV,nil];
            UITabBar *tabBar = mainTabViewController.tabBar;
            
            UITabBarItem *earningItem = [tabBar.items objectAtIndex:0];
            earningItem.title = @"收益";
            earningItem.selectedImage = [[UIImage imageNamed:@"sy-hov"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
            earningItem.image = [[UIImage imageNamed:@"sy"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
            
            UITabBarItem *advertisementItem = [tabBar.items objectAtIndex:1];
            advertisementItem.title = @"广告";
            advertisementItem.selectedImage = [[UIImage imageNamed:@"消息-蓝"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
            advertisementItem.image = [[UIImage imageNamed:@"消息-灰"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
            
            UITabBarItem *inviteItem = [tabBar.items objectAtIndex:2];
            inviteItem.title = @"邀请";
            inviteItem.selectedImage = [[UIImage imageNamed:@"拼搏-蓝"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
            inviteItem.image = [[UIImage imageNamed:@"拼搏-灰"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
            
            UITabBarItem *infoItem = [tabBar.items objectAtIndex:3];
            infoItem.title = @"个人";
            infoItem.selectedImage = [[UIImage imageNamed:@"our-hov"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
            infoItem.image = [[UIImage imageNamed:@"our"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
            
//            UITabBarItem *infoItem = [tabBar.items objectAtIndex:4];
//            infoItem.title = @"我";
//            infoItem.selectedImage = [[UIImage imageNamed:@"我-蓝"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//            infoItem.image = [[UIImage imageNamed:@"我-灰"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        
        }
//    });
    
    
    return mainTabViewController;
}
//-(void)appearBadge:(NSNotification *) notify
//{
//    self.array =  (NSArray*)notify.object;
//    if(self.array.count != 0)
//    {
//        UITabBarItem * item=[self.tabBarController.tabBar.items objectAtIndex:4];
//        item.badgeValue=[NSString stringWithFormat:@"%lu",self.array.count];
//    }
//    
//}


- (void)viewDidLoad {
    [super viewDidLoad];
    UIView *backView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 49)];
    backView.backgroundColor = [UIColor whiteColor];

    [self.tabBarController.tabBar insertSubview:backView atIndex:0];
    _array = [[NSMutableArray alloc]init];
    self.tabBarController.tabBar.opaque = YES;
    // Do any additional setup after loading the view.
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

