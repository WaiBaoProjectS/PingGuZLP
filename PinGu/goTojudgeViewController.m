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
    NSInteger _maxLiuNum;
    NSInteger _currentSubjectIndex;
    NSInteger _currentTypeIndex;
    NSInteger _currentItemIndex;
    ADDPhoneView * _addPhoneView;
    BOOL _singleSubIsFinished;
    NSMutableArray * _imageURLArr;
    

    NSString * _evaID;
    NSString * _evaName;
    BOOL _isUpPhoneFinished;
    
}

#define TOPBUTTON_WIDTH 130.0
#define TOPBUTTON_HEIGHT 80.0

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
    //加载数据
    [self LloadNsdata];
    _currentTypeIndex = 0;
    _currentItemIndex = 0;
    _currentSubjectIndex = 0;
    
    self.finishedPingItemsDic = [[NSMutableDictionary alloc]init];
    self.allFinishedItemARR = [[NSMutableArray alloc]init];
    _imageURLArr = [NSMutableArray new];
    
    [self xw_addNotificationForName:TextViewChangeNotifications block:^(NSNotification * _Nonnull notification) {
        NSString * textString = notification.userInfo[@"text"];
        [weak_self(self) addPingGuToArrayWith:textString];
    }];
}
/**
 *==========ZL注释start===========
 *1.添加评估记录
 *
 *2.
 *3.
 *4.
 ===========ZL注释end==========*/
- (void)addPingGuToArrayWith:(NSString *)string{
    NSLog(@"传入的参数：%@",string);
//    for (int i = 0 ; i<self.leftSubjectARR.count-1; i++) {
//        SubjectModel * s = self.leftSubjectARR[i];
//        for (int j = 0; j< s.evaluationTypePOList.count; j++) {
//            TypePOModel * m = s.evaluationTypePOList[j];
//            //NSLog(@"====S = %d,T = %d,itemArr.count = %ld",i,j,m.evaluationItemPOList.count);
//        }
//        
//    }
    if (_currentSubjectIndex < self.leftSubjectARR.count-1) {
        SubjectModel *subjectModel = self.leftSubjectARR[_currentSubjectIndex];
        if (_currentTypeIndex < subjectModel.evaluationTypePOList.count) {
            TypePOModel * typeModelDic = subjectModel.evaluationTypePOList[_currentTypeIndex];
//            NSArray * itemARR = typeModelDic.evaluationItemPOList;
            // NSLog(@"当前题目所在Subject：%ld,所在Type：%ld,该Type的题目数为：%ld,所在Item：%ld",_currentSubjectIndex,_currentTypeIndex,typeModelDic.evaluationItemPOList.count,_currentItemIndex);
            if (_currentItemIndex < typeModelDic.evaluationItemPOList.count) {
                ItemPOModel * itemModel = typeModelDic.evaluationItemPOList[_currentItemIndex];
//                NSLog(@"当前题目所在Subject：%ld,所在Type：%ld,所在Item：%ld,题目id：%@",_currentSubjectIndex,_currentTypeIndex,_currentItemIndex,itemModel.id);
                if ([string isEqualToString:@"delete"]) {
                    [self.finishedPingItemsDic removeObjectForKey:itemModel.id];
                    
                    itemModel.isItemFinished = NO;
                    [UIView addMJNotifierWithText:@"扣分原因不可以为空！" dismissAutomatically:YES];
                }
                else{
//                    [self.finishedPingItemsDic setObject:string forKey:itemDic[@"id"]];
                    [self.finishedPingItemsDic setValue:string forKey:itemModel.id];
                    
                    itemModel.isItemFinished = YES;
//                    [UIView addMJNotifierWithText:@"保存成功" dismissAutomatically:YES];
                    
                    
                }
                //检测该 Subject 是否评分完成
                
                [self jianCeIsFinished];
            }
        }
    }
}

/**
 *==========ZL注释start===========
 *1.检测该Subject是否 评分完成
 *
 *2.
 *3.
 *4.
 ===========ZL注释end==========*/

- (void)jianCeIsFinished{

    int singleSubjectAllItem = 0;
    int finishedItemNum = 0;
    SubjectModel *subjectModel = self.leftSubjectARR[_currentSubjectIndex];
    NSArray * typeARR = subjectModel.evaluationTypePOList;
    for (int i = 0; i< typeARR.count; i++) {
        
        TypePOModel * typeModelDic = subjectModel.evaluationTypePOList[i];
        NSArray * itemARR = typeModelDic.evaluationItemPOList;
        for (int j=0; j<itemARR.count; j++) {
            singleSubjectAllItem ++;
            
            ItemPOModel * itemModel = itemARR[j];
            if (itemModel.isItemFinished == YES) {
                finishedItemNum++;
            }
            
            
        }
    }
    NSLog(@"该Subject的总题目数为：%d,已经完成的题目数：%d",singleSubjectAllItem,finishedItemNum);
    if (singleSubjectAllItem == finishedItemNum) {
        NSLog(@"该项目Subject题目全部完成");
        [UIView addMJNotifierWithText:@"该项目评估已完成，可以进行下一项" dismissAutomatically:YES];
        _singleSubIsFinished = YES;
        subjectModel.isFinished = YES;
    }
    else{
        subjectModel.isFinished = NO;
        _singleSubIsFinished = NO;
        NSLog(@"该项目还没有完成");
    }
}



-(void)loadUIViewWithTopButtonARR:(NSMutableArray *)buttonARR{
    __weak typeof(self) weakSelf = self;
    self.BGheaderView=[[UIView alloc]init];
    self.BGheaderView.backgroundColor=[UIColor colorWithHexString:@"#f1f1f1"];
    [self.view addSubview:self.BGheaderView];
    [self.BGheaderView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view.mas_top).offset(66.0f);
        make.left.right.mas_equalTo(self.view).offset(0.0f);
        make.height.mas_equalTo(@100.0f);
    }];
    
    
    /**
     *==========ZL注释start===========
     *1.创建评估过程单例
     *
     *2.
     *3.
     *4.
     ===========ZL注释end==========*/
    PingProgressModel * pingPModel = [PingProgressModel sharePingProgressModel];
    pingPModel.allSubjectARR = buttonARR;
    
    
    _currentLiuNum = 0;
    [self createLiuButtonWithArray:buttonARR];
    
    NSMutableArray *arr = [NSMutableArray new];
    
    self.viewss=[[GotojudgeView alloc]init];
    [self.viewss initwithArrayData:arr];
    self.viewss.userInteractionEnabled=YES;
    self.viewss.backgroundColor=[UIColor colorWithHexString:@"#f1f1f1"];
    [self.view addSubview:self.viewss];
    [self.viewss setLeftTableSelectIndexBlock:^(NSInteger index) {
        
        _currentTypeIndex = index;
    } withRightIndexBlock:^(NSInteger index) {
        [weakSelf.view endEditing:YES];
        _currentItemIndex = index;
    }];
    [self.viewss mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.BGheaderView.mas_bottom).offset(0.0f);
        make.left.right.mas_equalTo(self.view).offset(0.0f);
        make.bottom.mas_equalTo(self.view.mas_bottom).offset(0.0f);
    }];
    
    _addPhoneView = [ADDPhoneView new];
    _addPhoneView.backgroundColor = [UIColor whiteColor];
    _addPhoneView.userInteractionEnabled = YES;
    [self.view addSubview:_addPhoneView];
    [_addPhoneView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.BGheaderView.mas_bottom).offset(0.0f);
        make.left.right.mas_equalTo(self.view).offset(0.0f);
        make.bottom.mas_equalTo(self.view.mas_bottom).offset(0.0f);
    }];
    _addPhoneView.phoneARR = [NSMutableArray new];
    [_addPhoneView createCollectionView];
    [_addPhoneView setClickAddPhoneBlockAction:^(NSInteger index) {
        //添加图片，打开控制器
        [weakSelf openPhoneCameraAction];
        
    }];
    
    _addPhoneView.hidden = YES;
    
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
        SubjectModel * model = [SubjectModel new];
        model.name = @"上传照片";
        [buttonArray addObject:model];
        
        float spaceWidth = (SCREENWIDTH - buttonArray.count * TOPBUTTON_WIDTH) / (buttonArray.count + 1);
//        NSLog(@"屏幕宽度和高度，屏幕宽度高度：%g-------%g-----%g------%g",self.view.frame.size.width,self.view.frame.size.height,SCREENWIDTH,SCREENHEIGTH);
        
        
        for (int i = 0; i < buttonArray.count; i++) {
            
            
            SubjectModel * subModel = buttonArray[i];
            LiuCUIbutton*liucehng = [[LiuCUIbutton alloc]init];
            liucehng.Numlable.text = [NSString stringWithFormat:@"%d",i+1];
            liucehng.titleLable.text = subModel.name;
            liucehng.tag = i;
            [liucehng addTarget:self action:@selector(clickmk:) forControlEvents:UIControlEventTouchUpInside];
            
            [self.BGheaderView addSubview:liucehng];
            [liucehng mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.mas_equalTo(self.BGheaderView.mas_top).offset(10.0f);
                make.left.mas_equalTo(self.BGheaderView.mas_left).offset(spaceWidth * (i+1) + TOPBUTTON_WIDTH * (i));
                make.size.mas_equalTo(CGSizeMake(TOPBUTTON_WIDTH,TOPBUTTON_HEIGHT));
            }];
            
            if (i <= _currentLiuNum ) {
                [liucehng setButtonStateType:FINISHED_STATE];
            }
            else{
                
                [liucehng setButtonStateType:START_STATE];
            }
            
            
            
        }
        
    }
}

-(void)LloadNsdata{
    
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    NSString *tokenid = [user objectForKey:@"userPassWord"];
    NSDictionary *pardic=@{@"method":TiJiaoFunction_NAME,
                           @"tokenId":tokenid,
                           @"id":self.listID};
    //NSLog(@"未评估请求参数：%@",pardic);
    
    __weak typeof(self) weakSelf = self;
    [NetWorkingTool postWithURL:CommonURL_ZL parameters:pardic LX:@"1" success:^(id json) {
//        NSLog(@"未评估评估表：%@",json);
        /**
         *==========ZL注释start===========
         *1.为评估的数据解析
         *
         *2.
         *3.
         *4.
         ===========ZL注释end==========*/
        NSDictionary * evaluationPODic = json[@"evaluationPO"];
        _evaID = evaluationPODic[@"id"];
        _evaName = evaluationPODic[@"name"];
        
        NSArray * evaSubjectPOListArr = evaluationPODic[@"evaluationSubjectPOList"];
        
        if (evaSubjectPOListArr.count > 0) {
            //NSArray * typePOListArr = evaSubjectPOListArr[0][@"evaluationTypePOList"];
            
            for (int i = 0; i < evaSubjectPOListArr.count; i++) {
                
                SubjectModel * subModel = [SubjectModel new];
                NSDictionary * subDic = evaSubjectPOListArr[i];
                
                subModel.evaluationId = subDic[@"evaluationId"];
                subModel.evaluationSubjectId = subDic[@"evaluationSubjectId"];
                subModel.id = subDic[@"id"];
                subModel.name = subDic[@"name"];
//                subModel.evaluationTypePOList = subDic[@"evaluationTypePOList"];
                
                NSArray * typeARR = subDic[@"evaluationTypePOList"];
                NSMutableArray * marr = [[NSMutableArray alloc]init];
                for (int j = 0; j < typeARR.count; j++) {
                    
                        NSDictionary * tyDic = typeARR[j];
                        TypePOModel * tyModel = [TypePOModel new];
                        tyModel.id = tyDic[@"id"];
                        tyModel.name = tyDic[@"name"];
                        
                        NSArray * itemARR = tyDic[@"evaluationItemPOList"];
                        
                        NSMutableArray * arr = [NSMutableArray new];
                        for (int k = 0; k< itemARR.count; k++) {
                            NSDictionary * dic = itemARR[k];
                            ItemPOModel * model = [ItemPOModel new];
                            
                            model.content = dic[@"content"];
                            model.remark = dic[@"remark"];
                            model.score = dic[@"score"];
                            model.id = dic[@"id"];
                            
                            model.evaId = dic[@"evaluationId"];
                            model.evaSubjectId = dic[@"evaluationSubjectId"];
                            model.evaluationTypeId = dic[@"evaluationTypeId"];
                            model.evaSubjectName = subModel.name;
                            model.evaTypeName = tyModel.name;
                            
                            
                            [arr addObject:model];
                        }

                        tyModel.evaluationItemPOList = arr;
                        //NSLog(@"SubjectIndex=:%d,TypeIndex=%d,ItemARR.count=%ld",i,j,tyModel.evaluationItemPOList.count);
                        [marr addObject:tyModel];
                    
                    
                    
                }
                
                subModel.evaluationTypePOList = marr;

                [self.leftSubjectARR addObject:subModel];
            }
            
            dispatch_async(dispatch_get_main_queue(), ^{
                [weakSelf loadUIViewWithTopButtonARR:self.leftSubjectARR];
                [weakSelf creatLeftViewWithIndex:0];
            });
            
        }
        
        
        NSLog(@"evaSubjectPOListArr的个数为：%ld",evaSubjectPOListArr.count);
        
    } failure:^(NSError *error) {
        
    }];
    
}

#pragma mark ===================创建列表视图==================
- (void)creatLeftViewWithIndex:(NSInteger)index{
    
    
    SubjectModel * subModel = [self.leftSubjectARR objectAtIndex:index];
    self.viewss.leftARR = subModel.evaluationTypePOList;
    [self.viewss.leftTableView reloadData];
    if (self.viewss.leftARR.count > 0) {
        NSIndexPath * indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
        
        [self.viewss.leftTableView selectRowAtIndexPath:indexPath animated:NO scrollPosition:UITableViewScrollPositionNone];
        
        [self xw_postNotificationWithName:@"SELECT_FIRST" userInfo:@{@"isHave":@"yes"}];
    }
    else{
        
        [self xw_postNotificationWithName:@"SELECT_FIRST" userInfo:@{@"isHave":@"no"}];
    }
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)clickmk:(LiuCUIbutton*)sender{
    
    if (sender.tag == _currentLiuNum) {
        return;
    }
//    [sender setButtonStateType:FINISHED_STATE];
//    NSLog(@"点击了：第几个：%ld,----顶部标题个数为：%ld",sender.tag,self.leftSubjectARR.count);
//    _currentLiuNum = sender.tag;
//    _currentSubjectIndex = sender.tag;
//    if (sender.tag == self.leftSubjectARR.count-1) {
//        _addPhoneView.hidden = NO;
//        self.viewss.hidden = YES;
//    }
//    else{
//        _addPhoneView.hidden = YES;
//        self.viewss.hidden = NO;
//        _currentTypeIndex = 0;
//        [self creatLeftViewWithIndex:sender.tag];
//        _singleSubIsFinished = NO;
//    }
    
    SubjectModel * subModel = self.leftSubjectARR[sender.tag];
    if (subModel.isFinished == YES) {
        _currentLiuNum = sender.tag;
        _currentSubjectIndex = sender.tag;
        _currentTypeIndex = 0;
        [self creatLeftViewWithIndex:sender.tag];
        _singleSubIsFinished = YES;
        
    }
    else{
        BOOL isCanOpen = YES;
        for (int i = 0; i < sender.tag ; i++) {
            SubjectModel * model = self.leftSubjectARR[i];
            
            if (model.isFinished == NO) {
                isCanOpen = NO;
            }
            
        }
        if (isCanOpen == YES) {
            if (_singleSubIsFinished == YES) {
                
                [sender setButtonStateType:FINISHED_STATE];
                //NSLog(@"点击了：第几个：%ld,----顶部标题个数为：%ld",sender.tag,self.leftSubjectARR.count);
                _currentLiuNum = sender.tag;
                _currentSubjectIndex = sender.tag;
                if (sender.tag == self.leftSubjectARR.count-1) {
                    _addPhoneView.hidden = NO;
                    self.viewss.hidden = YES;
                }
                else{
                    _addPhoneView.hidden = YES;
                    self.viewss.hidden = NO;
                    _currentTypeIndex = 0;
                    [self creatLeftViewWithIndex:sender.tag];
                    _singleSubIsFinished = NO;
                }
            }
            else{
                
                [UIView addMJNotifierWithText:@"该项目未完成评估，不能进行下一项" dismissAutomatically:YES];
            }
        }
        else{
                [UIView addMJNotifierWithText:@"有未完成评估的项目，还不能进行此项评估" dismissAutomatically:YES];
        }

    }
   
}
-(void)submit{
    NSLog(@"我是提交按钮");
    
    BOOL isCanSubmit = YES;
  //  NSLog(@"self.leftSubjectARR.count个数为：%ld",self.leftSubjectARR.count);
    for (int i = 0; i < self.leftSubjectARR.count-1 ; i++) {
        SubjectModel * model = self.leftSubjectARR[i];
        for (int j = 0; j < model.evaluationTypePOList.count; j++) {
            TypePOModel * tModel = model.evaluationTypePOList[j];
            
            for (int k = 0; k < tModel.evaluationItemPOList.count ; k++) {
                
                ItemPOModel * iModel = tModel.evaluationItemPOList[k];
                
                if (iModel.isItemFinished == NO) {
                    isCanSubmit = NO;
                }
                
            }
            
        }
        
    }

    
    
    if (isCanSubmit == YES && _isUpPhoneFinished == YES) {
        
        float allScore = 0.0;
        
        NSMutableArray * itemARRs = [NSMutableArray new];
        
        for (int i = 0; i < self.leftSubjectARR.count-1 ; i++) {
            SubjectModel * model = self.leftSubjectARR[i];
            for (int j = 0; j < model.evaluationTypePOList.count; j++) {
                TypePOModel * tModel = model.evaluationTypePOList[j];
                
                
                for (int k = 0; k < tModel.evaluationItemPOList.count ; k++) {
                    
                    ItemPOModel * iModel = tModel.evaluationItemPOList[k];
                    
                    if (iModel.isItemFinished == NO) {
                        isCanSubmit = NO;
                    }
                    float score = [iModel.pingFen floatValue];
                    allScore = allScore + score;
                    
                    NSDictionary * iDic = @{
                                            @"evaluationItemContent":iModel.content?:@"内容",
                                            @"evaluationItemId":iModel.id?:@"9876543210",
                                            @"reason":iModel.kouReason?:@"扣分原因",
                                            @"evaluationItemScore":iModel.score?:@"0",
                                            @"score":iModel.pingFen?:@"0",
                                            @"evaluationSubjectId":iModel.evaluationTypeId?:@"33333333",
                                            @"evaluationSubjectName":iModel.evaSubjectName?:@"团队建设",
                                            @"evaluationTypeId":iModel.evaluationTypeId?:@"44444444",
                                            @"evaluationTypeName":iModel.evaTypeName?:@"卫生环境"
                                            };
                    //NSLog(@"题目提交字典：%@",iDic);
                    [itemARRs addObject:iDic];
                    
                }
                
            }
            
        }
        //recordAttachmentCreateRequestList
        NSMutableArray * imageArrs = [NSMutableArray new];
        for (int i = 0; i < _imageURLArr.count; i++) {
            ImageURLModelUP * imageModel = _imageURLArr[i];
            NSDictionary *imDic = @{
                                    @"extension":@".jpg",
                                    @"fileId":imageModel.id?:@"123456789",
                                    @"type":@"IMAGE"
                                    };
            //NSLog(@"图片字典：%@",imDic);
            [imageArrs addObject:imDic];
        }
        
        
        
        //可以提交
        NSString *allScrString = [NSString stringWithFormat:@"%.1f",allScore];
        NSString * levelString = nil;
        if (allScore >= 85.0) {
            levelString = @"优秀";
        }else if(allScore >= 75.0){
        
            levelString = @"好";
        }else if (allScore >= 65.0){
            levelString = @"良好";
        }else {
            levelString = @"差";
        }
        
        __weak typeof(self) weakSelf = self;
        NSString * alertString = [NSString stringWithFormat:@"总分：%@,级别：%@",allScrString,levelString];
        UIAlertController *controller = [UIAlertController alertControllerWithTitle:alertString message:nil preferredStyle:UIAlertControllerStyleAlert];
        
        [controller addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil]];
        [controller addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
             [weakSelf submitALLScoreWith:allScrString withAttachmentCreat:imageArrs withLineCreatArr:itemARRs];
        }]];
        [self presentViewController:controller animated:true completion:nil];
        
        NSLog(@"总分数：%@",allScrString);
       
    }
    else{
    
        [UIView addMJNotifierWithText:@"评估未完成，不能提交" dismissAutomatically:YES];
    
    }

}
/**
 *==========ZL注释start===========
 *1.提交评估结果
 *
 *2.
 *3.
 *4.
 ===========ZL注释end==========*/
- (void)submitALLScoreWith:(NSString *)allScores withAttachmentCreat:(NSMutableArray *)imagesARRs withLineCreatArr:(NSMutableArray *)itemsARRs{
    
    __weak typeof(self) weakSelf = self;
    
    
    NSDictionary * deDic = @{
                             @"score":allScores?:@"0",
                             @"evaluationId":_evaID?:@"00000000",
                             @"evaluationName":_evaName?:@"园区",
                             @"institutionId":self.jiGouModelB.mID?:@"11111111",
                             @"institutionName":self.jiGouModelB.name?:@"新区",
                             @"recordAttachmentCreateRequestList":imagesARRs,
                             @"recordLineCreateRequestList":itemsARRs
                             };
    
    NSData * data = [NSJSONSerialization dataWithJSONObject:deDic options:NSJSONWritingPrettyPrinted error:nil];
    NSString * string = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
    
    NSString *tokenID = [kUserDefaults objectForKey:@"userPassWord"];
    NSDictionary * paraDic = @{@"method":@"api.pias.create.record",
                                      @"tokenId":tokenID,
                                      @"target":string
                                      };
    
    NSLog(@"TokenID为：%@",tokenID);
    //NSLog(@"提交的评估信息：%@",paraDic);
    [NetWorkingTool postWithURL:CommonURL_ZL parameters:paraDic LX:@"1" success:^(id json) {
        
        NSLog(@"提交评估信息：%@",json);
        NSString * id = json[@"id"];
        if (id != nil) {
            [UIView addMJNotifierWithText:@"提交成功！" dismissAutomatically:YES];
            [weakSelf.navigationController popViewControllerAnimated:YES];
        }
        
    } failure:^(NSError *error) {
        
        [UIView addMJNotifierWithText:@"提交失败" dismissAutomatically:YES];
    }];
}


/**
 *==========ZL注释start===========
 *1.多图添加
 *
 *2.
 *3.
 *4.
 ===========ZL注释end==========*/
- (void)openPhoneCameraAction{
    
    RITLPhotoNavigationViewModel * viewModel = [RITLPhotoNavigationViewModel new];
    
    __weak typeof(self) weakSelf = self;
    viewModel.maxNumberOfSelectedPhoto = 1;
    //    设置需要图片剪切的大小，不设置为图片的原比例大小
    //    viewModel.imageSize = _assetSize;
    
    viewModel.RITLBridgeGetImageBlock = ^(NSArray <UIImage *> * images){
        
        NSLog(@"获取几张图片：%ld",images.count);
        //获得图片
        __strong typeof(weakSelf) strongSelf = weakSelf;
        
        strongSelf.imageARR = images;
        
        //        strongSelf.assets = images;
        //
        //        [strongSelf.collectionView reloadData];
        [_addPhoneView reloadCollectionWith:images];
    };
    
    viewModel.RITLBridgeGetImageDataBlock = ^(NSArray <NSData *> * datas){
        //可以进行数据上传操作..
        NSLog(@"获取图片资源：%ld",datas.count);
        [weak_self(self) upLoadImageWith:datas];
        
    };
    
    RITLPhotoNavigationViewController * viewController = [RITLPhotoNavigationViewController photosViewModelInstance:viewModel];
    
    [self presentViewController:viewController animated:true completion:^{}];
    
    
}
/**
 *==========ZL注释start===========
 *1.多图上传到服务器
 *
 *2.
 *3.
 *4.
 ===========ZL注释end==========*/
- (void)upLoadImageWith:(NSArray<NSData *> *) dataARR{
    
    NSString * tokenID = [[NSUserDefaults standardUserDefaults] objectForKey:@"userPassWord"];
    
    NSMutableString * allDataString = [NSMutableString new];
    for (int i=0; i<dataARR.count; i++) {
        
        NSData * data = dataARR[i];
        UIImage *image = [UIImage imageWithData:data];
        NSData * data02 = UIImageJPEGRepresentation(image, 0.1);
        NSLog(@"图片的大小原始：%ld,压缩后：%ld",data.length/1000,data02.length/1000);
        //        NSData * base64Data = [data base64EncodedDataWithOptions:0];
        
        NSString * base64String = [data02 base64EncodedStringWithOptions:0];
        [allDataString appendString:base64String];
        
    }
    //NSLog(@"图片转64字符串：%@",allDataString);
    NSDictionary * dic = @{
                           @"tokenId":tokenID,
                           @"method":@"api.auth.upload.file",
                           @"extension":@".jpg",
                           @"fileType":@"IMAGE",
                           @"data":allDataString
                           };
    
    /*
     参数method (必填)	api.auth.upload.file
     参数tokenId(必填)
     参数 extension(必填)	.jpg | .png
     参数 fileType(必填)	IMAGE
     参数 data(必填)	Base64编码字符串
     */
    
    [NetWorkingTool postWithURL:CommonURL_ZL parameters:dic LX:@"1" success:^(id json) {
        NSLog(@"上传图片返回信息：%@",json);
        if (json[@"id"] != nil){
            ImageURLModelUP * model = [ImageURLModelUP new];
            if (json[@"downUrl"] != nil) {
                model.downUrl = json[@"downUrl"];
            }
            if (json[@"id"] != nil) {
                model.id = json[@"id"];
                [UIView addMJNotifierWithText:@"图片上传完成" dismissAutomatically:YES];
                _isUpPhoneFinished = YES;
            }
            else{
                [UIView addMJNotifierWithText:@"图片上传失败" dismissAutomatically:YES];
            }
            if (json[@"url"] != nil) {
                model.url = json[@"url"];
            }
            [_imageURLArr addObject:model];
        }
        else{
            _isUpPhoneFinished = NO;
        }

       
        
    } failure:^(NSError *error) {
        NSLog(@"上传图片错误：%@",error);
        _isUpPhoneFinished = NO;
        [UIView addMJNotifierWithText:@"图片上传失败" dismissAutomatically:YES];
    }];
    //    [UploadImageZL uploadImageWithPath:CommonURL_ZL_UPLOADIMAGE photos:dataARR params:dic success:^(id Json) {
    //
    //    } failure:^{
    //
    //    }];
    

    
}



#pragma mark ===================懒加载==================
- (NSMutableArray *)leftSubjectARR{
    
    if (!_leftSubjectARR) {
        _leftSubjectARR = [[NSMutableArray alloc]init];
    }
    return _leftSubjectARR;
    
}
- (NSArray<UIImage *> *)imageARR{
    if (!_imageARR) {
        _imageARR = [NSArray new];
    }
    return _imageARR;
}

//- (NSMutableDictionary *)finishedPingItemsARR{
//
//    if (!_finishedPingItemsDic) {
//        _finishedPingItemsDic = [[NSMutableDictionary alloc]init];
//    }
//    return _finishedPingItemsDic;
//    
//}

@end
