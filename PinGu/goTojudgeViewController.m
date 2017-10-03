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
@interface goTojudgeViewController (){

    NSMutableArray * _buttonListARR;
    NSMutableArray * _buttonStateARR;
    NSInteger _currentLiuNum;
    
}

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
    
    NSMutableArray * arr = [[NSMutableArray alloc]initWithObjects:@"1",@"2",@"3" ,nil];
//    _buttonStateARR = [[NSMutableArray alloc]initWithObjects:START_STATE,FINISHED_STATE,START_STATE,FINISHED_STATE, nil];
    _currentLiuNum = 2;
    [self createLiuButtonWithArray:arr];


    
}
/**
 *==========ZL注释start===========
 *1.创建顶部 流程按钮
 *
 *2.动态创建
 *3.
 *4.
 ===========ZL注释end==========*/
- (void)createLiuButtonWithArray:(NSMutableArray *)buttonArray{

    if (buttonArray.count <1) {
        return;
    }
    else{
        [buttonArray addObject:@"上传照片"];
        
        float spaceWidth = (SCREENWIDTH - buttonArray.count * 200.0) / (buttonArray.count + 1);
        NSLog(@"屏幕宽度和高度，屏幕宽度高度：%g-------%g-----%g------%g",self.view.frame.size.width,self.view.frame.size.height,SCREENWIDTH,SCREENHEIGTH);
        

        for (int i = 0; i < buttonArray.count; i++) {
            
            
            
            LiuCUIbutton*liucehng=[[LiuCUIbutton alloc]init];
            liucehng.Numlable.text=@"1";
            liucehng.titleLable.text=@"组织管理";
            liucehng.tag=0;
            [liucehng addTarget:self action:@selector(clickmk:) forControlEvents:UIControlEventTouchUpInside];
            
            [self.BGheaderView addSubview:liucehng];
            [liucehng mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.mas_equalTo(self.BGheaderView.mas_top).offset(10.0f);
                make.left.mas_equalTo(self.BGheaderView.mas_left).offset(spaceWidth * (i+1) + 200.0 * (i));
                make.size.mas_equalTo(CGSizeMake(200.0f,80.0f));
            }];
            
            if (i <= _currentLiuNum ) {
                [liucehng setButtonStateType:START_STATE];
            }
            else{
                [liucehng setButtonStateType:FINISHED_STATE];
            }
            
            
            
        }
    
    }
}

-(void)LloadNsdata{
    
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    NSString *tokenid = [ user objectForKey:@"userPassWord"];
    NSDictionary *pardic=@{@"method":TiJiaoFunction_NAME,
                           @"tokenId":tokenid,
                           @"id":self.listID};
    //NSLog(@"未评估请求参数：%@",pardic);
    
    __weak typeof(self) weakSelf = self;
    [NetWorkingTool postWithURL:CommonURL_ZL parameters:pardic LX:@"1" success:^(id json) {
        NSLog(@"未评估评估表：%@",json);
        /**
         *==========ZL注释start===========
         *1.为评估的数据解析
         *
         *2.
         *3.
         *4.
         ===========ZL注释end==========*/
        NSDictionary * evaluationPODic = json[@"evaluationPO"];
        NSArray * evaSubjectPOListArr = evaluationPODic[@"evaluationSubjectPOList"];
        if (evaSubjectPOListArr.count > 0) {
            //NSArray * typePOListArr = evaSubjectPOListArr[0][@"evaluationTypePOList"];
            
            for (int i = 0; i < evaSubjectPOListArr.count; i++) {
              
                SubjectModel * subModel = [SubjectModel new];
                NSDictionary * subDic = evaSubjectPOListArr[i];
                /*
                 @property (nonatomic, copy) NSString *createBy;
                 @property (nonatomic, copy) NSString *createTime;
                 @property (nonatomic, copy) NSString *deleted;
                 @property (nonatomic, copy) NSString *evaluationId;
                 @property (nonatomic, copy) NSString *evaluationSubjectId;
                 @property (nonatomic, strong) NSArray *evaItemPOList;
                 @property (nonatomic, copy) NSString *id;
                 @property (nonatomic, copy) NSString *name;
                 @property (nonatomic, copy) NSString *rowVersion;
                 
                 */
                subModel.evaluationId = subDic[@"evaluationId"];
                subModel.evaluationSubjectId = subDic[@"evaluationSubjectId"];
                subModel.evaItemPOList = subDic[@"evaluationItemPOList"];
                subModel.id = subDic[@"id"];
                subModel.name = subDic[@"name"];
                [self.leftSubjectARR addObject:subModel];
            }
            
            dispatch_async(dispatch_get_main_queue(), ^{
                [weakSelf creatLeftView];
            });
            
        }
        
        
        NSLog(@"evaSubjectPOListArr的个数为：%ld",evaSubjectPOListArr.count);

    } failure:^(NSError *error) {
        
    }];

}

#pragma mark ===================创建列表视图==================
- (void)creatLeftView{

    self.viewss=[[GotojudgeView alloc]init];
    [self.viewss initwithArrayData:self.leftSubjectARR];
    self.viewss.userInteractionEnabled=YES;
    self.viewss.backgroundColor=[UIColor colorWithHexString:@"#f1f1f1"];
    [self.view addSubview:self.viewss];
    [self.viewss mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.BGheaderView.mas_bottom).offset(20.0f);
        make.left.right.mas_equalTo(self.view).offset(0.0f);
        make.bottom.mas_equalTo(self.view.mas_bottom).offset(0.0f);
    }];

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

#pragma mark ===================懒加载==================
- (NSMutableArray *)leftSubjectARR{

    if (!_leftSubjectARR) {
        _leftSubjectARR = [[NSMutableArray alloc]init];
    }
    return _leftSubjectARR;
    
}

@end
