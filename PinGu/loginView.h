//
//  loginView.h
//  PinGu
//
//  Created by 张小东 on 2017/9/6.
//  Copyright © 2017年 张小东. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^loginInBlock)(NSString*nameText,NSString*pswText);
typedef void (^settingBlock)(BOOL success);

@interface loginView : UIView
@property(nonatomic,strong)UITextField*NameTextFiled;
@property(nonatomic,strong)UITextField*PhoneTextFiled;
@property(nonatomic,copy)loginInBlock loginblock;
@property(nonatomic,copy)settingBlock settingblock;
-(void)clickLogin:(loginInBlock)block;//登录
-(void)clickSetting:(settingBlock)block;//设置
@end
