//
//  UserMessageManager.h
//  PinGu
//
//  Created by 张小东 on 2017/9/22.
//  Copyright © 2017年 张小东. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserInfo.h"
@interface UserMessageManager : NSObject


+(UserMessageManager *)sharedManager;



@property(nonatomic,retain)UserInfo *userInfo;
@property(nonatomic,assign)BOOL isLogin;
@property(nonatomic,strong)NSArray *RepairConditionSelectArray;
@property (nonatomic,copy)NSString *LCAccessToken;
-(void)login;
-(void)logOut;
-(NSString *)userPhone;

-(NSString *)userID;
@end
