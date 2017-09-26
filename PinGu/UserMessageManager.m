//
//  UserMessageManager.m
//  PinGu
//
//  Created by 张小东 on 2017/9/22.
//  Copyright © 2017年 张小东. All rights reserved.
//

#import "UserMessageManager.h"

@implementation UserMessageManager
/*
+(UserMessageManager *)sharedManager
{
    static UserMessageManager *sharedUserInfoManagerInstance = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        sharedUserInfoManagerInstance = [[self alloc]init];
        NSUserDefaults *de = [NSUserDefaults standardUserDefaults];
        NSDictionary *dic = [de objectForKey:USERMSG];
        sharedUserInfoManagerInstance.userInfo = [UserMessageManager mj_objectWithKeyValues:dic];
        if ([sharedUserInfoManagerInstance.userInfo.userid length]>0) {
            sharedUserInfoManagerInstance.isLogin = YES;
        }
   // });
   // return sharedUserInfoManagerInstance;
//}
-(NSString *)userPhone{


}

-(NSString *)userID{

}*/
@end
