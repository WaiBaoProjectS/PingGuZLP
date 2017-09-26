//
//  goTojudgeViewController.m
//  PinGu
//
//  Created by 张小东 on 2017/9/24.
//  Copyright © 2017年 张小东. All rights reserved.
//

#import "goTojudgeViewController.h"
#import "UIColor+Hex.h"
#import "Masonry.h"
#import "NetWorkingTool.h"
#import "LiuCUIbutton.h"
#import "GotojudgeView.h"
@interface goTojudgeViewController ()

@end

@implementation goTojudgeViewController
-(void)viewWillAppear:(BOOL)animated{
    self.view.backgroundColor=[UIColor colorWithHexString:@"#f1f1f1"];
    [self.navigationController setNavigationBarHidden:NO animated:animated];
    [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
    NSDictionary *dict = [NSDictionary dictionaryWithObject:[UIColor colorWithHexString:@"333333 "] forKey:NSForegroundColorAttributeName];
    self.navigationController.navigationBar.titleTextAttributes = dict;
    self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"back_top"] style:UIBarButtonItemStylePlain target:self action:@selector(backUpTop)];
    self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc]initWithTitle:@"提交" style:UIBarButtonItemStylePlain target:self action:@selector(submit)];
    UIView*viewNav=[[UIView alloc]init];
    //viewNav.backgroundColor=[UIColor whiteColor];
    self.navigationItem.titleView=viewNav;
    [viewNav mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(160.0f, 40.0f));
        make.center.mas_equalTo(self.navigationItem.titleView);
    }];
    UIImageView*jiGouImg=[[UIImageView alloc]init];
    jiGouImg.image=[UIImage imageNamed:@"绩效评估-拷贝-2"];
    [viewNav addSubview:jiGouImg];
    [jiGouImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(viewNav.mas_top).offset(7.0f);
        make.left.mas_equalTo(viewNav.mas_left).offset(10.0f);
        make.size.mas_equalTo(CGSizeMake(20.0f, 20.0f));
    }];
    UILabel*labTitle=[[UILabel alloc]init];
    labTitle.text=@"评估指标体系";
    labTitle.font=[UIFont systemFontOfSize:17];
    labTitle.textColor=[UIColor colorWithHexString:@"#ffffff"];
    [viewNav addSubview:labTitle];
    [labTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(viewNav.mas_top).offset(6.0f);
        make.left.mas_equalTo(jiGouImg.mas_right).offset(10.0f);
        make.size.mas_equalTo(CGSizeMake(150.0f, 25.0f));
    }];
    
}
-(void)backUpTop{
    [self.navigationController popViewControllerAnimated:YES];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    // Do any additional setup after loading the view.
    [self LloadNsdata];
    [self loadUIView];
}


-(void)loadUIView{
    self.BGheaderView=[[UIView alloc]init];
    self.BGheaderView.backgroundColor=[UIColor colorWithHexString:@"#f1f1f1"];
    [self.view addSubview:self.BGheaderView];
    [self.BGheaderView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view.mas_top).offset(66.0f);
        make.left.right.mas_equalTo(self.view).offset(0.0f);
        make.height.mas_equalTo(@100.0f);
    }];
    
    LiuCUIbutton*liucehng=[[LiuCUIbutton alloc]init];
    liucehng.Numlable.text=@"1";
    liucehng.titleLable.text=@"组织管理";
    liucehng.tag=0;
    [liucehng addTarget:self action:@selector(clickmk:) forControlEvents:UIControlEventTouchUpInside];
    [self.BGheaderView addSubview:liucehng];
    [liucehng mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.BGheaderView.mas_top).offset(10.0f);
        make.left.mas_equalTo(self.BGheaderView.mas_left).offset(100.0f);
        make.size.mas_equalTo(CGSizeMake(200.0f,80.0f));
    }];
    
    LiuCUIbutton*liucehng1=[[LiuCUIbutton alloc]init];
    liucehng1.Numlable.text=@"2";
    liucehng1.tag=1;
    liucehng1.titleLable.text=@"开展工作";
    [liucehng1 addTarget:self action:@selector(clickmk:) forControlEvents:UIControlEventTouchUpInside];
    [self.BGheaderView addSubview:liucehng1];
    [liucehng1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.BGheaderView.mas_top).offset(10.0f);
        make.left.mas_equalTo(liucehng.mas_right).offset(10.0f);
        make.size.mas_equalTo(CGSizeMake(200.0f,80.0f));
    }];
    
    LiuCUIbutton*liucehng2=[[LiuCUIbutton alloc]init];
    liucehng2.Numlable.text=@"3";
    liucehng2.tag=2;
    liucehng2.titleLable.text=@"供应商体系建立";
    [liucehng2 addTarget:self action:@selector(clickmk:) forControlEvents:UIControlEventTouchUpInside];
    [self.BGheaderView addSubview:liucehng2];
    [liucehng2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.BGheaderView.mas_top).offset(10.0f);
        make.left.mas_equalTo(liucehng1.mas_right).offset(10.0f);
        make.size.mas_equalTo(CGSizeMake(220.0f,80.0f));
    }];
    
    LiuCUIbutton*liucehng3=[[LiuCUIbutton alloc]init];
    liucehng3.Numlable.text=@"4";
    liucehng3.tag=3;
    liucehng3.titleLable.text=@"上传图片";
    [liucehng3 addTarget:self action:@selector(clickmk:) forControlEvents:UIControlEventTouchUpInside];
    [self.BGheaderView addSubview:liucehng3];
    [liucehng3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.BGheaderView.mas_top).offset(10.0f);
        make.left.mas_equalTo(liucehng2.mas_right).offset(10.0f);
        make.size.mas_equalTo(CGSizeMake(220.0f,80.0f));
    }];
    
    
    self.viewss=[[GotojudgeView alloc]init];
    self.viewss.userInteractionEnabled=YES;
    self.viewss.backgroundColor=[UIColor colorWithHexString:@"#f1f1f1"];
    [self.viewss initwithArrayData:nil];
    [self.view addSubview:self.viewss];
    [self.viewss mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.BGheaderView.mas_bottom).offset(20.0f);
        make.left.right.mas_equalTo(self.view).offset(0.0f);
        make.bottom.mas_equalTo(self.view.mas_bottom).offset(0.0f);
    }];
    
    
}

/**
 *==========ZL注释start===========
 *1.方法描述
 *
 *2.tokenid listID
 *3.返回评估项目
 *4.
 ===========ZL注释end==========*/
-(void)LloadNsdata{
    
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    NSString *tokenid = [ user objectForKey:@"userPassWord"];
    NSDictionary *pardic=@{@"method":@"api.pias.get.evaluation",
                           @"tokenId":tokenid,
                           @"id":self.listID};
    //ajax.pias.get.evaluation    api.pias.get.evaluation  6314363818462023680
    NSLog(@"用户ID：%@,机构ID：%@",tokenid,self.listID);

    NSString * url = @"http://119.23.203.111/api/api.do";
    NSString * urlString = [NSString stringWithFormat:@"%@?method=%@&tokenId=%@&id=%@",url,@"ajax.pias.get.evaluation",tokenid,self.listID];
    NSLog(@"提交评估URL：%@",urlString);
    [NetWorkingTool postWithURL:@"http://119.23.203.111/api/api.do" parameters:pardic LX:nil success:^(id json) {
         NSLog(@"提交评估页面的JSON:%@",json);
    } failure:^(NSError *error) {
        
    }];
    
//    [NetWorkingTool getWithURL:urlString parameters:nil success:^(id json) {
//         NSLog(@"提交评估页面的JSON:%@",json);
//    } failure:^(NSError *error) {
//        
//    }];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)clickmk:(LiuCUIbutton*)sender{
   
    [self.viewss initwithArrayData:nil];
    
    


}
-(void)submit{

    NSLog(@"我是提交按钮");
}

@end
