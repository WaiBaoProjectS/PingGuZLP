//
//  DetialJudgeViewController.m
//  PinGu
//
//  Created by 张小东 on 2017/9/24.
//  Copyright © 2017年 张小东. All rights reserved.
//

#import "DetialJudgeViewController.h"
#import "Masonry.h"
#import "UIColor+Hex.h"
#import "NetWorkingTool.h"
#import "LiuCUIbutton.h"
#import "DetialMainView.h"
@interface DetialJudgeViewController ()

@end

@implementation DetialJudgeViewController
-(void)viewWillAppear:(BOOL)animated{
    self.view.backgroundColor=[UIColor colorWithHexString:@"#f1f1f1"];
    [self.navigationController setNavigationBarHidden:NO animated:animated];
    [self.navigationController.navigationBar setTintColor:[UIColor colorWithHexString:@"333333"]];
    NSDictionary *dict = [NSDictionary dictionaryWithObject:[UIColor colorWithHexString:@"333333 "] forKey:NSForegroundColorAttributeName];
    self.navigationController.navigationBar.titleTextAttributes = dict;
    self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"back_top"] style:UIBarButtonItemStylePlain target:self action:@selector(backUpTop)];
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
        //make.bottom.mas_equalTo(viewNav.mas_bottom).offset(-7.5f);
        //make.centerY.mas_equalTo(viewNav);
    }];
    UILabel*labTitle=[[UILabel alloc]init];
    labTitle.text=@"评估详情";
    
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
    
    [self loadDetialData];
    
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
    
    self.viewsss=[[DetialMainView alloc]init];
    [self.viewsss loadViewWith:nil];
    
    self.viewsss.backgroundColor=[UIColor colorWithHexString:@"#f1f1f1"];
    [self.view addSubview:self.viewsss];
    
    [self.viewsss mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view.mas_left).offset(0.0f);
        make.top.mas_equalTo(self.BGheaderView.mas_bottom).offset(0.0f);
        make.right.mas_equalTo(self.view.mas_right).offset(0.0f);
        make.bottom.mas_equalTo(self.view.mas_bottom).offset(0.0f);
    }];
}
-(void)clickmk:(LiuCUIbutton*)sender{
    
    //self.viewsss=[[DetialMainView alloc]init];
    [self.viewsss loadViewWith:nil];
    
    


}
-(void)loadDetialData{
    
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    NSString *tokenid = [ user objectForKey:@"userPassWord"];
    NSDictionary *pardic=@{@"method":@"api.pias.find.institution",@"tokenId":tokenid,@"id":self.detialID};
    
    [NetWorkingTool postWithURL:@"http://119.23.203.111/api/api.do" parameters:pardic LX:@"1" success:^(id json) {
        NSLog(@"%@",json);
        
        
        
    } failure:^(NSError *error) {
        
    }];

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
