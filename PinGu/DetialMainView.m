//
//  DetialMainView.m
//  PinGu
//
//  Created by 张小东 on 2017/9/24.
//  Copyright © 2017年 张小东. All rights reserved.
//

#import "DetialMainView.h"
#import "UIColor+Hex.h"
#import "Masonry.h"
#import "detialtabHeaderView.h"
#import "detialNeirongTableViewCell.h"
@implementation DetialMainView
@synthesize tabMainTableView;
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(void)loadViewWith:(NSMutableArray*)DataArray{

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
    
    tabMainTableView=[[UITableView alloc]init];
    tabMainTableView.delegate=self;
    tabMainTableView.dataSource=self;
    [self addSubview:tabMainTableView];
    [tabMainTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.mas_top).offset(0.0f);
        make.left.mas_equalTo(leftvIEW.mas_right).offset(20.0f);
        make.right.mas_equalTo(self.mas_right).offset(0.0f);
        make.bottom.mas_equalTo(self.mas_bottom).offset(0.0f);
    }];
    
}
//返回区的数量
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}
//返回cell的个数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}
//重用cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static  NSString *indexpathcell=@"cell";
    detialNeirongTableViewCell*cell=[tableView cellForRowAtIndexPath:indexPath];
    if (!cell) {
        cell=[[detialNeirongTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:indexpathcell];
    }
    return cell;
    
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 130;
}

-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    detialtabHeaderView*views=[[detialtabHeaderView alloc]init];
    UILabel*labtitle=[[UILabel alloc]init];
    labtitle.font=[UIFont systemFontOfSize:17.0];
    labtitle.text=@"考评详情";
    [views addSubview:labtitle];
    [labtitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(views.mas_top).offset(20.0f);
        make.centerX.mas_equalTo(views);
        make.size.mas_equalTo(CGSizeMake(150.0f, 30.0f));
    }];
    
    UIView*lineview=[[UIView alloc]init];
    lineview.backgroundColor=[UIColor colorWithHexString:@"#999999"];
    [views addSubview:lineview];
    [lineview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(labtitle.mas_bottom).offset(10.0f);
        make.left.mas_equalTo(views.mas_left).offset(40.0f);
        make.right.mas_equalTo(views.mas_right).offset(-40.0f);
        make.height.mas_equalTo(@1.5f);
    }];
    UIView*leftline=[[UIView alloc]init];
   // leftline.backgroundColor=[UIColor redColor];
    leftline.backgroundColor=[UIColor colorWithHexString:@"#999999"];

    [views addSubview:leftline];
    
    [leftline mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(labtitle.mas_bottom).offset(10.0f);
        make.left.mas_equalTo(views.mas_left).offset(40.0f);
        make.size.mas_equalTo(CGSizeMake(1.5f, 50.0f));
    }];
    
    //UIView*diview=[[UIView alloc]init];
    
    UILabel*lablexuhao=[[UILabel alloc]init];
    lablexuhao.text=@"序号";
    lablexuhao.font=[UIFont fontWithName:@"Helvetica-Bold" size:17.0f];
    lablexuhao.textAlignment=NSTextAlignmentCenter;
    [views addSubview:lablexuhao];
    
    [lablexuhao mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(leftline.mas_right).offset(5.0f);
        make.top.mas_equalTo(lineview.mas_bottom).offset(7.0f);
        make.size.mas_equalTo(CGSizeMake(60, 35));
    }];
    
    UIView*shuview=[[UIView alloc]init];
   // shuview.backgroundColor=[UIColor redColor];
    shuview.backgroundColor=[UIColor colorWithHexString:@"#999999"];

    [views addSubview:shuview];
    [shuview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(labtitle.mas_bottom).offset(10.0f);
        make.left.mas_equalTo(lablexuhao.mas_right).offset(5.0f);
        make.size.mas_equalTo(CGSizeMake(1.5f, 50.0f));
    }];
    
    UILabel*lablekpnr=[[UILabel alloc]init];
    lablekpnr.text=@"考评内容";
    lablekpnr.font=[UIFont fontWithName:@"Helvetica-Bold" size:17.0f];
   // lablekpnr.backgroundColor=[UIColor purpleColor];
    lablekpnr.textAlignment=NSTextAlignmentCenter;
    [views addSubview:lablekpnr];
    
    [lablekpnr mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(lineview.mas_bottom).offset(7.0f);
        make.left.mas_equalTo(shuview.mas_right).offset(5.0f);
        make.size.mas_equalTo(CGSizeMake(340, 35));
    }];
    
    
    UIView*shuviewsec=[[UIView alloc]init];
   // shuviewsec.backgroundColor=[UIColor redColor];
    shuviewsec.backgroundColor=[UIColor colorWithHexString:@"#999999"];

    [views addSubview:shuviewsec];
    [shuviewsec mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(labtitle.mas_bottom).offset(10.0f);
        make.left.mas_equalTo(lablekpnr.mas_right).offset(5.0f);
        make.size.mas_equalTo(CGSizeMake(1.5f, 50.0f));
        
    }];
    
    UILabel*lablekfqk=[[UILabel alloc]init];
    lablekfqk.text=@"得分情况";
    lablekfqk.font=[UIFont fontWithName:@"Helvetica-Bold" size:17.0f];

   // lablekfqk.backgroundColor=[UIColor purpleColor];
    lablekfqk.textAlignment=NSTextAlignmentCenter;
    [views addSubview:lablekfqk];
    
    [lablekfqk mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(lineview.mas_bottom).offset(7.0f);
        make.left.mas_equalTo(shuviewsec.mas_right).offset(5.0f);
        make.size.mas_equalTo(CGSizeMake(160, 35));
    }];
    
    UIView*shuviewthid=[[UIView alloc]init];
    shuviewthid.backgroundColor=[UIColor colorWithHexString:@"#999999"];
    [views addSubview:shuviewthid];
    [shuviewthid mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(labtitle.mas_bottom).offset(10.0f);
        make.left.mas_equalTo(lablekfqk.mas_right).offset(5.0f);
        make.size.mas_equalTo(CGSizeMake(1.5f, 50.0f));
        
    }];
    
    UILabel*lablekfyy=[[UILabel alloc]init];
    lablekfyy.text=@"扣分原因";
    lablekfyy.font=[UIFont fontWithName:@"Helvetica-Bold" size:17.0f];
    lablekfyy.textAlignment=NSTextAlignmentCenter;
    [views addSubview:lablekfyy];
    [lablekfyy mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(lineview.mas_bottom).offset(7.0f);
        make.left.mas_equalTo(shuviewthid.mas_right).offset(5.0f);
        make.size.mas_equalTo(CGSizeMake(160, 35));
    }];
    
    
    UIView*shuviewFOUR=[[UIView alloc]init];
    shuviewFOUR.backgroundColor=[UIColor colorWithHexString:@"#999999"];
    [views addSubview:shuviewFOUR];
    [shuviewFOUR mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(labtitle.mas_bottom).offset(10.0f);
        make.right.mas_equalTo(views.mas_right).offset(-40.0f);
        make.size.mas_equalTo(CGSizeMake(1.5f, 50.0f));
    }];
    
    UIView*lineviewDIDI=[[UIView alloc]init];
    lineviewDIDI.backgroundColor=[UIColor colorWithHexString:@"#999999"];
    [views addSubview:lineviewDIDI];
    [lineviewDIDI mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(shuviewFOUR.mas_bottom).offset(0.0f);
        make.left.mas_equalTo(views.mas_left).offset(40.0f);
        make.right.mas_equalTo(views.mas_right).offset(-40.0f);
        make.height.mas_equalTo(@1.5f);
    }];
    
    return views;
    
    
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 110.0f;
}
@end
