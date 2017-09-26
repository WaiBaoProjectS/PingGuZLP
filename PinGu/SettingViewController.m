//
//  SettingViewController.m
//  PinGu
//
//  Created by 张小东 on 2017/9/9.
//  Copyright © 2017年 张小东. All rights reserved.
//

#import "SettingViewController.h"
#import "UIColor+Hex.h"
@interface SettingViewController ()

@end

@implementation SettingViewController
-(void)viewWillAppear:(BOOL)animated{
    self.view.backgroundColor=[UIColor whiteColor];
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithHexString:@"#5ddcd3"];
    [self.navigationController setNavigationBarHidden:NO animated:animated];
    self.title=@"设置";
    self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"back_top"] style:UIBarButtonItemStylePlain target:self action:@selector(backUpTop)];
    [self.navigationController.navigationBar setTintColor:[UIColor colorWithHexString:@"333333"]];
    NSDictionary *dict = [NSDictionary dictionaryWithObject:[UIColor colorWithHexString:@"333333 "] forKey:NSForegroundColorAttributeName];
    self.navigationController.navigationBar.titleTextAttributes = dict;

}
-(void)backUpTop{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)viewDidLoad {
    [super viewDidLoad];
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
