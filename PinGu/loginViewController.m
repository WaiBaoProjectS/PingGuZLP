//
//  loginViewController.m
//  PinGu
//
//  Created by 张小东 on 2017/9/6.
//  Copyright © 2017年 张小东. All rights reserved.
//

#import "loginViewController.h"
#import "loginView.h"
#import "generalListViewController.h"
#import "SettingViewController.h"
#import "NetWorkingTool.h"
@interface loginViewController ()

@end

@implementation loginViewController
-(void)viewWillAppear:(BOOL)animated{
    self.view.backgroundColor=[UIColor whiteColor];
    [self.navigationController setNavigationBarHidden:YES animated:animated];

}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self loadLoginView];
}
-(void)loadLoginView{
    
    loginView*loginVC=[[loginView alloc]initWithFrame:self.view.frame];
    [self.view addSubview:loginVC];
    
    [loginVC clickLogin:^(NSString *nameText, NSString *pswText) {
        //NSLog(@"账号：%@密码：%@",nameText,pswText);
        
        if (nameText.length==0||pswText.length==0) {
            UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"提示" message:@"账号或密码不能为空" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
            }];
            
            UIAlertAction *otherAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
                
            }];
            
            [alertController addAction:cancelAction];
            [alertController addAction:otherAction];
            [self presentViewController:alertController animated:YES completion:nil];
            
        }else{
            NSDictionary *pardic=@{@"name":nameText,@"password":pswText,@"method":@"api.auth.user.login"};
           
            [NetWorkingTool postWithURL:@"http://119.23.203.111/api/api.do" parameters:pardic LX:@"1" success:^(id json) {
               // NSArray*errorarray=json[@"errors"];
                    NSString*userDic=json[@"tokenId"];
                if (userDic.length>0) {
                    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
                    [user setObject:userDic forKey:@"userPassWord"];
                    generalListViewController*genterVC=[[generalListViewController alloc]init];
                    UINavigationController*nav=[[UINavigationController alloc]initWithRootViewController:genterVC];
                    UIWindow*winDow=[UIApplication sharedApplication].keyWindow;
                    winDow.rootViewController=nav;
                    
                }
                
                
                
            } failure:^(NSError *error) {
                NSLog(@"%@",error);
                
            }];
            
        /*
            generalListViewController*genterVC=[[generalListViewController alloc]init];
            UINavigationController*nav=[[UINavigationController alloc]initWithRootViewController:genterVC];
            UIWindow*winDow=[UIApplication sharedApplication].keyWindow;
            //[nav.navigationBar set]
            winDow.rootViewController=nav;*/
        }
          }];
    [loginVC clickSetting:^(BOOL success) {
        SettingViewController*setVC=[[SettingViewController alloc]init];
        [self.navigationController pushViewController:setVC animated:YES];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];

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
