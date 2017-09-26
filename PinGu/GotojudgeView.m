//
//  GotojudgeView.m
//  PinGu
//
//  Created by 张小东 on 2017/9/24.
//  Copyright © 2017年 张小东. All rights reserved.
//

#import "GotojudgeView.h"
#import "Masonry.h"
#import "UIColor+Hex.h"
#import "TIbgview.h"
@implementation GotojudgeView
@synthesize TimuScrollview;
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(void)initwithArrayData:(NSMutableArray*)dataArray{
    self.userInteractionEnabled=YES;

    self.backgroundColor=[UIColor colorWithHexString:@"#F1F1F1"];
    UIView*leftvIEW=[[UIView alloc]init];
    leftvIEW.backgroundColor=[UIColor whiteColor];
    [self addSubview:leftvIEW];
    [leftvIEW mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.mas_top).offset(0.0f);
        make.left.mas_equalTo(self.mas_left).offset(0.0f);
        make.bottom.mas_equalTo(self.mas_bottom).offset(0.0f);
        make.width.mas_equalTo(@160.0f);
    }];
    
    
    UIButton*zzbut=[UIButton buttonWithType:UIButtonTypeCustom];
    [zzbut setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [zzbut setTitle:@"组织建设" forState:UIControlStateNormal];
    [zzbut.layer setBorderColor:[UIColor colorWithHexString:@"#f1f1f1"].CGColor];
    [zzbut.layer setBorderWidth:1.0f];
    [self addSubview:zzbut];
    [zzbut mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(leftvIEW.mas_left).offset(0.0f);
        make.top.mas_equalTo(leftvIEW.mas_top).offset(0.0f);
        make.right.mas_equalTo(leftvIEW.mas_right).offset(0.0f);
        make.height.mas_equalTo(@55.0f);
        
    }];
    
    
    UIButton*dwbut=[UIButton buttonWithType:UIButtonTypeCustom];
    [dwbut setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [dwbut setTitle:@"队伍建设" forState:UIControlStateNormal];
    [dwbut.layer setBorderColor:[UIColor colorWithHexString:@"#f1f1f1"].CGColor];
    [dwbut.layer setBorderWidth:1.0f];
    [self addSubview:dwbut];
    [dwbut mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(leftvIEW.mas_left).offset(0.0f);
        make.top.mas_equalTo(zzbut.mas_bottom).offset(0.0f);
        make.right.mas_equalTo(leftvIEW.mas_right).offset(0.0f);
        make.height.mas_equalTo(@55.0f);
    }];
    
    UIButton*glbut=[UIButton buttonWithType:UIButtonTypeCustom];
    [glbut setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [glbut setTitle:@"管理制度" forState:UIControlStateNormal];
    [glbut.layer setBorderColor:[UIColor colorWithHexString:@"#f1f1f1"].CGColor];
    [glbut.layer setBorderWidth:1.0f];
    [self addSubview:glbut];
    
    [glbut mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(leftvIEW.mas_left).offset(0.0f);
        make.top.mas_equalTo(dwbut.mas_bottom).offset(0.0f);
        make.right.mas_equalTo(leftvIEW.mas_right).offset(0.0f);
        make.height.mas_equalTo(@55.0f);
        
    }];
    
    UIButton*zdmbut=[UIButton buttonWithType:UIButtonTypeCustom];
    [zdmbut setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [zdmbut setTitle:@"管理制度" forState:UIControlStateNormal];
    [zdmbut.layer setBorderColor:[UIColor colorWithHexString:@"#f1f1f1"].CGColor];
    [zdmbut.layer setBorderWidth:1.0f];
    [self addSubview:zdmbut];
    
    [zdmbut mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(leftvIEW.mas_left).offset(0.0f);
        make.top.mas_equalTo(glbut.mas_bottom).offset(0.0f);
        make.right.mas_equalTo(leftvIEW.mas_right).offset(0.0f);
        make.height.mas_equalTo(@55.0f);
    }];
    
    
    TimuScrollview=[[UIScrollView alloc]init];
    TimuScrollview.userInteractionEnabled=YES;
    TimuScrollview.backgroundColor=[UIColor whiteColor];
    
    [self addSubview:TimuScrollview];
    [TimuScrollview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.mas_top).offset(0.0f);
        make.left.mas_equalTo(leftvIEW.mas_right).offset(20.0f);
        make.bottom.mas_equalTo(self.mas_bottom).offset(-20.0f);
        make.right.mas_equalTo(self.mas_right).offset(-15.0f);
    }];
    /*
    NSArray*arrayss=[NSArray arrayWithObjects:@"1",@"2",@"3",@"4",@"5", nil];
    for (NSUInteger i =0; i<arrayss.count; i++) {
        TIbgview*Bgview=[[TIbgview alloc]init];
        Bgview.backgroundColor=[UIColor purpleColor];
        [TimuScrollview addSubview:Bgview];
        
    }*/
    
    TIbgview*Bgview=[[TIbgview alloc]init];
    
    Bgview.userInteractionEnabled=YES;
    Bgview.backgroundColor=[UIColor whiteColor];
    [Bgview initwithDAta:nil];
    [self addSubview:Bgview];
    [Bgview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.mas_equalTo(TimuScrollview).offset(0.0f);
    }];
    
    
    
    
    
    

}

@end
