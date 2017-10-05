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
    ADDPhoneView * _addPhoneView;
    
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
    

}


-(void)loadUIViewWithTopButtonARR:(NSMutableArray *)buttonARR{
    self.BGheaderView=[[UIView alloc]init];
    self.BGheaderView.backgroundColor=[UIColor colorWithHexString:@"#f1f1f1"];
    [self.view addSubview:self.BGheaderView];
    [self.BGheaderView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view.mas_top).offset(66.0f);
        make.left.right.mas_equalTo(self.view).offset(0.0f);
        make.height.mas_equalTo(@100.0f);
    }];
    
//    NSMutableArray * arr = [[NSMutableArray alloc]initWithObjects:@"1",@"2",@"3" ,nil];
//    _buttonStateARR = [[NSMutableArray alloc]initWithObjects:START_STATE,FINISHED_STATE,START_STATE,FINISHED_STATE, nil];
    _currentLiuNum = buttonARR.count;
    [self createLiuButtonWithArray:buttonARR];

    NSMutableArray *arr = [NSMutableArray new];
    // Do any additional setup after loading the view.
    
    //[self loadUIView];
    self.viewss=[[GotojudgeView alloc]init];
    [self.viewss initwithArrayData:arr];
    self.viewss.userInteractionEnabled=YES;
    self.viewss.backgroundColor=[UIColor colorWithHexString:@"#f1f1f1"];
    [self.view addSubview:self.viewss];
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
        [weak_self(self) openPhoneCameraAction];
        
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
        NSLog(@"屏幕宽度和高度，屏幕宽度高度：%g-------%g-----%g------%g",self.view.frame.size.width,self.view.frame.size.height,SCREENWIDTH,SCREENHEIGTH);
        

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
    NSString *tokenid = [user objectForKey:@"userPassWord"];
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

                subModel.evaluationId = subDic[@"evaluationId"];
                subModel.evaluationSubjectId = subDic[@"evaluationSubjectId"];
                
                subModel.evaluationTypePOList = subDic[@"evaluationTypePOList"];

                subModel.id = subDic[@"id"];
                subModel.name = subDic[@"name"];
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
    NSArray * typeARR = subModel.evaluationTypePOList;
    NSMutableArray * leftARR = [NSMutableArray new];
    for (int i =0; i<typeARR.count; i++) {
        NSDictionary * tyDic = typeARR[i];
        TypePOModel * tyModel = [TypePOModel new];
        
        tyModel.name = tyDic[@"name"];
        tyModel.evaluationItemPOList = tyDic[@"evaluationItemPOList"];
        [leftARR addObject:tyModel];
    }
    
    
    self.viewss.leftARR = leftARR;
    [self.viewss.leftTableView reloadData];
    if (leftARR.count > 0) {
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
    NSLog(@"点击了：第几个：%ld,----顶部标题个数为：%ld",sender.tag,self.leftSubjectARR.count);
    if (sender.tag == self.leftSubjectARR.count-1) {
        _addPhoneView.hidden = NO;
        self.viewss.hidden = YES;
        
        
    }
    else{
        _addPhoneView.hidden = YES;
        self.viewss.hidden = NO;
         [self creatLeftViewWithIndex:sender.tag];
    }
   
    
}
-(void)submit{

    NSLog(@"我是提交按钮");
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
                           @"data":@"dfasdgadsg"
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
    } failure:^(NSError *error) {
        NSLog(@"上传图片错误：%@",error);
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

@end
