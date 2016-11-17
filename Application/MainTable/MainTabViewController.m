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
            UIStoryboard *barStoryBoard = [UIStoryboard storyboardWithName:@"Bar" bundle:nil];
            UINavigationController *barNV = [barStoryBoard instantiateViewControllerWithIdentifier:@"barNV"];
            
            UIStoryboard *messageStoryBoard = [UIStoryboard storyboardWithName:@"Message" bundle:nil];
            UINavigationController *messageNV = [messageStoryBoard instantiateViewControllerWithIdentifier:@"messageNV"];
            
            UIStoryboard *blogStoryBoard = [UIStoryboard storyboardWithName:@"Blog" bundle:nil];
            UINavigationController *blogNV = [blogStoryBoard instantiateViewControllerWithIdentifier:@"blogNV"];
            
            UIStoryboard *chatStoryBoard = [UIStoryboard storyboardWithName:@"Chat" bundle:nil];
            UINavigationController *chatNV = [chatStoryBoard instantiateViewControllerWithIdentifier:@"chatNV"];
            
            UIStoryboard *infoStoryBoard = [UIStoryboard storyboardWithName:@"Info" bundle:nil];
            UIViewController *infoNV=[infoStoryBoard instantiateViewControllerWithIdentifier:@"infoNV"];
            
            
            mainTabViewController.viewControllers=[[NSArray alloc] initWithObjects:barNV, messageNV, blogNV, chatNV, infoNV,nil];
            UITabBar *tabBar = mainTabViewController.tabBar;
            tabBar.tintColor = PAGECOLOR;
            
            UITabBarItem *barItem = [tabBar.items objectAtIndex:0];
            barItem.title = @"拼吧";
            barItem.selectedImage = [[UIImage imageNamed:@"拼吧-蓝"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
            barItem.image = [[UIImage imageNamed:@"拼吧-灰"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
            
            UITabBarItem *messageItem = [tabBar.items objectAtIndex:1];
            messageItem.title = @"消息";
            messageItem.selectedImage = [[UIImage imageNamed:@"消息-蓝"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
            messageItem.image = [[UIImage imageNamed:@"消息-灰"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
            
            UITabBarItem *blogItem = [tabBar.items objectAtIndex:2];
            blogItem.title = @"拼搏";
            blogItem.selectedImage = [[UIImage imageNamed:@"拼搏-蓝"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
            blogItem.image = [[UIImage imageNamed:@"拼搏-灰"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
            
            UITabBarItem *chatItem = [tabBar.items objectAtIndex:3];
            chatItem.title = @"聊天室";
            chatItem.selectedImage = [[UIImage imageNamed:@"聊天室-蓝"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
            chatItem.image = [[UIImage imageNamed:@"聊天室-灰"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
            
            UITabBarItem *infoItem = [tabBar.items objectAtIndex:4];
            infoItem.title = @"我";
            infoItem.selectedImage = [[UIImage imageNamed:@"我-蓝"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
            infoItem.image = [[UIImage imageNamed:@"我-灰"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
            
        }
//    });
    
    
    return mainTabViewController;
}
-(void)appearBadge:(NSNotification *) notify
{
    self.array =  (NSArray*)notify.object;
    if(self.array.count != 0)
    {
        UITabBarItem * item=[self.tabBarController.tabBar.items objectAtIndex:4];
        item.badgeValue=[NSString stringWithFormat:@"%lu",self.array.count];
    }
    
}
- (void) dealloc {
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:notifyNoticAllCount object:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    UIView *backView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 49)];
    backView.backgroundColor = [UIColor whiteColor];

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(appearBadge:) name:notifyNoticAllCount object:nil];

    
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

