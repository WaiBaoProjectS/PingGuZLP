//
//  ViewController.m
//  PinGu
//
//  Created by 张小东 on 2017/9/5.
//  Copyright © 2017年 张小东. All rights reserved.
//

#import "ViewController.h"
#import "loginView.h"
#import "generalListViewController.h"
@interface ViewController ()

@end

@implementation ViewController
-(void)viewWillAppear:(BOOL)animated{
    self.view.backgroundColor=[UIColor whiteColor];
    //隐藏导航栏
//    [self.navigationController setNavigationBarHidden:YES animated:animated];

}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //[self loadLoginView];
}
-(void)loadLoginView{

    loginView*loginVC=[[loginView alloc]initWithFrame:self.view.frame];
    [self.view addSubview:loginVC];
    
    [loginVC clickLogin:^(NSString *nameText, NSString *pswText) {
        NSLog(@"账号：%@密码：%@",nameText,pswText);
        generalListViewController*generalVC=[[generalListViewController alloc]init];
        [self.navigationController pushViewController:generalVC animated:YES];
        
    }];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
