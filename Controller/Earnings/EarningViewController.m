//
//  EarningViewController.m
//  Advertisement
//
//  Created by Kimi.zhang on 2016/11/17.
//  Copyright © 2016年 Kimi.zhang. All rights reserved.
//

#import "EarningViewController.h"

@interface EarningViewController ()
@property (weak, nonatomic) IBOutlet UIView *leftView;
@property (weak, nonatomic) IBOutlet UIProgressView *progressView;
@property (weak, nonatomic) IBOutlet UIImageView *headerImageView;
@property (weak, nonatomic) IBOutlet UILabel *infoState;

@end

@implementation EarningViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _leftView.backgroundColor = [UIColor clearColor];
    [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithHexString:@"ea4745" alpha:1.0]];
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
