//
//  AppDelegate.m
//  PinGu
//
//  Created by 张小东 on 2017/9/5.
//  Copyright © 2017年 张小东. All rights reserved.
//

#import "AppDelegate.h"
#import "loginViewController.h"
#import "generalListViewController.h"
#import "IQKeyboardManager.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    IQKeyboardManager *manager = [IQKeyboardManager sharedManager];
    manager.enable = YES;
    manager.shouldResignOnTouchOutside = YES;//这个是点击空白区域键盘收缩的开关
    manager.enableAutoToolbar = NO;//这个是它自带键盘工具条开关

    //判断用户是否登录
    //BOOL isLogin = NO;
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    NSString *passWord = [ user objectForKey:@"userPassWord"];
    
    if (passWord.length>0) {
        generalListViewController*genterVC=[[generalListViewController alloc]init];
        
        UINavigationController*nav=[[UINavigationController alloc]initWithRootViewController:genterVC];
        
        //[nav.navigationBar set]
        self.window.rootViewController=nav;

        
    }else{
        loginViewController*loginVC=[[loginViewController alloc]init];
        
        UINavigationController*nav=[[UINavigationController alloc]initWithRootViewController:loginVC];
        
        //[nav.navigationBar set]
        self.window.rootViewController=nav;
//        generalListViewController*genterVC=[[generalListViewController alloc]init];
//        
//        UINavigationController*nav=[[UINavigationController alloc]initWithRootViewController:genterVC];
//        
//        //[nav.navigationBar set]
//        self.window.rootViewController=nav;
    
    }
    
    
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
