//
//  loginView.m
//  PinGu
//
//  Created by 张小东 on 2017/9/6.
//  Copyright © 2017年 张小东. All rights reserved.
//

#import "loginView.h"
#import "Masonry.h"
#import "UIColor+Hex.h"
@implementation loginView
@synthesize NameTextFiled,PhoneTextFiled;
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(instancetype)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    if (self) {
        UIImageView*IMAGEBG=[[UIImageView alloc]initWithFrame:self.frame];
        IMAGEBG.userInteractionEnabled=YES;
        IMAGEBG.image=[UIImage imageNamed:@"底图"];
        [self addSubview:IMAGEBG];
        UIImageView*viewlogo=[[UIImageView alloc]init];
        viewlogo.image=[UIImage imageNamed:@"logo"];
        [IMAGEBG addSubview:viewlogo];
        [viewlogo mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(IMAGEBG.mas_top).offset(200.0f);
            make.size.mas_equalTo(CGSizeMake(255.0f, 64.0f));
            make.centerX.mas_equalTo(IMAGEBG.mas_centerX);

        }];
        UIView*viewloginTextbg=[[UIView alloc]init];
        viewloginTextbg.backgroundColor=[UIColor whiteColor];
        [IMAGEBG addSubview:viewloginTextbg];
        [viewloginTextbg mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(viewlogo.mas_bottom).offset(20.0f);
            make.size.mas_equalTo(CGSizeMake(338.0f, 213.0f));
            make.centerX.mas_equalTo(IMAGEBG.mas_centerX);

        }];
        
        //设置
        UIButton*setingbut=[UIButton buttonWithType:UIButtonTypeCustom];
        [setingbut setImage:[UIImage imageNamed:@"设置-"] forState:UIControlStateNormal];
        //setingbut.backgroundColor=[UIColor redColor];
        [setingbut addTarget:self action:@selector(setingbut:) forControlEvents:UIControlEventTouchUpInside];
        [IMAGEBG addSubview:setingbut];
        [setingbut mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(IMAGEBG.mas_top).offset(30.0f);
            make.right.mas_equalTo(IMAGEBG.mas_right).offset(-30.0f);
            make.size.mas_equalTo(CGSizeMake(50.0f, 50.0f));
            //make.centerX.mas_equalTo(self.mas_centerX);
        }];
        
        //账户
        NameTextFiled = [[UITextField alloc] init];
        NameTextFiled.borderStyle = UITextBorderStyleRoundedRect;
        NameTextFiled.placeholder = @"请输入手机号";
        NameTextFiled.layer.shadowColor=[UIColor colorWithHexString:@"#5ddcd3"].CGColor;
        NameTextFiled.layer.shadowOpacity = 0.8f;
        NameTextFiled.layer.shadowOffset = CGSizeMake(1,1);
        NameTextFiled.layer.borderWidth = 0.6;//边框宽度

        NameTextFiled.layer.borderColor=[UIColor colorWithHexString:@"#5ddcd3"].CGColor;

        [NameTextFiled setValue:[UIColor colorWithHexString:@"#999999"] forKeyPath:@"_placeholderLabel.textColor"];
        [NameTextFiled setValue:[UIFont systemFontOfSize:13] forKeyPath:@"_placeholderLabel.font"];
        NameTextFiled.font = [UIFont systemFontOfSize:13];
        [viewloginTextbg addSubview:NameTextFiled];
        
        UIImage *im = [UIImage imageNamed:@"用户名-"];
        UIImageView *iv = [[UIImageView alloc] initWithImage:im];
        UIView *lv = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
        //lv.backgroundColor = [UIColor blueColor];
        iv.center = lv.center;
        [lv addSubview:iv];
        NameTextFiled.leftViewMode = UITextFieldViewModeAlways;
        NameTextFiled.leftView = lv;
        [NameTextFiled sizeToFit];
        
        [NameTextFiled mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(viewloginTextbg).offset(30.0f);
            make.size.mas_equalTo(CGSizeMake(260.0f, 38.0f));
            make.centerX.mas_equalTo(viewloginTextbg.mas_centerX);
        }];
        
        
        //密码
        PhoneTextFiled = [[UITextField alloc] init];
        PhoneTextFiled.borderStyle = UITextBorderStyleRoundedRect;
        PhoneTextFiled.placeholder = @"请输入密码";
        PhoneTextFiled.secureTextEntry=YES;
        [PhoneTextFiled setValue:[UIColor colorWithHexString:@"#999999"] forKeyPath:@"_placeholderLabel.textColor"];
        [PhoneTextFiled setValue:[UIFont systemFontOfSize:13] forKeyPath:@"_placeholderLabel.font"];
        PhoneTextFiled.font = [UIFont systemFontOfSize:13];
        [viewloginTextbg addSubview:PhoneTextFiled];
        
        UIImage *im1 = [UIImage imageNamed:@"密码"];
        UIImageView *iv1 = [[UIImageView alloc] initWithImage:im1];
        UIView *lv1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
        //lv.backgroundColor = [UIColor blueColor];
        iv1.center = lv1.center;
        [lv1 addSubview:iv1];
        PhoneTextFiled.leftViewMode = UITextFieldViewModeAlways;
        PhoneTextFiled.leftView = lv1;
        [PhoneTextFiled sizeToFit];
        
        
        
        
        
//        UIView*phoneView=[[UIView alloc]init];
//        phoneView.backgroundColor=[UIColor redColor];
//        [IMAGEBG addSubview:phoneView];
        [PhoneTextFiled mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(NameTextFiled.mas_bottom).offset(18.0f);
            make.size.mas_equalTo(CGSizeMake(260.0f, 38.0f));
            make.centerX.mas_equalTo(viewloginTextbg.mas_centerX);
        }];
        
        UIButton*clickLoginbut=[UIButton buttonWithType:UIButtonTypeCustom];
        [clickLoginbut setTitle:@"登录" forState:UIControlStateNormal];
        clickLoginbut.backgroundColor=[UIColor colorWithHexString:@"#009688"];
        [clickLoginbut addTarget:self action:@selector(clickbutton:) forControlEvents:UIControlEventTouchUpInside];
        [viewloginTextbg addSubview:clickLoginbut];
        [clickLoginbut mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(PhoneTextFiled.mas_bottom).offset(18.0f);
            make.size.mas_equalTo(CGSizeMake(260.0f, 38.0f));
            make.centerX.mas_equalTo(viewloginTextbg.mas_centerX);
        }];
        
    }
    return self;
}
//登录按钮触发方法
-(void)clickbutton:(UIButton*)sender{
    self.loginblock(NameTextFiled.text, PhoneTextFiled.text);
}
//block 登录回调
-(void)clickLogin:(loginInBlock)block{
    self.loginblock=block;
}
-(void)setingbut:(UIButton*)sender{
    self.settingblock(YES);

}
-(void)clickSetting:(settingBlock)block{
    self.settingblock=block;

}

@end
