//
//  nnnViewController.m
//  PinGu
//
//  Created by 张小东 on 2017/9/6.
//  Copyright © 2017年 张小东. All rights reserved.
//

#import "nnnViewController.h"
#import "Masonry.h"
#import "UIColor+Hex.h"
#import "ListFooterView.h"
#import "JustListTableViewCell.h"
#import "NetWorkingTool.h"
#import "nnlistModel.h"
#import "selfUIbutton.h"
#import "pgListHeaderView.h"
#import "DetialJudgeViewController.h"
#import "goTojudgeViewController.h"

@interface nnnViewController ()
@property(nonatomic,strong)NSMutableArray*alerdyPinguArray;
@property(nonatomic,strong)NSMutableArray*noPingGuuArray;
@property(nonatomic,strong)NSMutableArray*MainNsdataArray;

@end

@implementation nnnViewController
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
    labTitle.text=@"评估列表";
   
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
    NSLog(@"%@",self.institutionSiteId);
    _alerdyPinguArray=[[NSMutableArray alloc]init];
    _noPingGuuArray=[[NSMutableArray alloc]init];
    _MainNsdataArray=[[NSMutableArray alloc]init];
    
     [self loadNsdata];
    // Do any additional setup after loading the view.
    //YES ,I DO !
    
    //左侧菜单tableview
    [self loadJudgeTableView];
    //搜索框view
    [self loadUItextFiled];
    //右侧评估人list
    [self loadUIlisttableView];
}
-(void)loadNsdata{
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    NSString *tokenid = [ user objectForKey:@"userPassWord"];
    NSDictionary *pardic=@{
                           @"method":@"api.pias.find.institution.tree",
                           @"tokenId":tokenid,
                           @"institutionSiteId":_institutionSiteId,
                           @"pageNumber":@"1",
                           @"pageSize":@"0"
                        };
    
    [NetWorkingTool postWithURL:@"http://119.23.203.111/api/api.do" parameters:pardic LX:@"1" success:^(id json) {
        //NSLog(@"已经评估和未评估的数据：%@",json);
        NSMutableArray*firstAlerdyArray=json[@"institutionList"];
        NSMutableArray*SecondNoArray=json[@"institutionListNot"];
        if (firstAlerdyArray.count>0||SecondNoArray.count>0) {
            for (NSDictionary*dic in firstAlerdyArray ) {
                nnlistModel*model=[[nnlistModel alloc]init];
                model.mID=dic[@"id"];
                model.postcode=dic[@"postcode"];
                model.type=dic[@"type"];
                model.rowVersion=dic[@"rowVersion"];
                model.address=dic[@"address"];
                model.contacts=dic[@"contacts"];
                model.contactsPhone=dic[@"contactsPhone"];
                model.name=dic[@"name"];
                model.contactsPhone=dic[@"institutionSiteName"];
                model.evaluated=dic[@"evaluated"];
                model.institutionSiteId=dic[@"institutionSiteId"];
                [_alerdyPinguArray addObject:model];
            }
            for (NSDictionary *dic in SecondNoArray) {
                nnlistModel*model=[[nnlistModel alloc]init];
                model.mID=dic[@"id"];
                model.postcode=dic[@"postcode"];
                model.type=dic[@"type"];
                model.rowVersion=dic[@"rowVersion"];
                model.address=dic[@"address"];
                model.contacts=dic[@"contacts"];
                model.contactsPhone=dic[@"contactsPhone"];
                model.name=dic[@"name"];
                model.evaluated=dic[@"evaluated"];
                model.evaluationId = dic[@"evaluationId"];
                model.contactsPhone=dic[@"institutionSiteName"];
                model.institutionSiteId=dic[@"institutionSiteId"];

                [_noPingGuuArray addObject:model];
            }
            _MainNsdataArray=_alerdyPinguArray;
            [self.UIlistTableView reloadData];
            
        }else{
        
        
        }

        
        
    } failure:^(NSError *error) {
        
    }];

}
-(void)loadJudgeTableView{
    /*
    self.judgeOrglistTableView=[[UITableView alloc]init];
    self.judgeOrglistTableView.dataSource=self;
    self.judgeOrglistTableView.delegate=self;
    self.judgeOrglistTableView.backgroundColor=[UIColor colorWithHexString:@"#f1f1f1"];
    [self.view addSubview:self.judgeOrglistTableView];
    [self.judgeOrglistTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view.mas_top).offset(15.0f);
        make.left.mas_equalTo(self.view.mas_left).offset(0.0f);
        make.bottom.mas_equalTo(self.view.mas_bottom).offset(0.0f);
        make.width.mas_equalTo(@150);
    }];
    
    ListFooterView*footerView=[[ListFooterView alloc]init];
   // footerView.backgroundColor=[UIColor purpleColor];
    self.judgeOrglistTableView.tableFooterView=footerView;*/
    
    self.leftBgView=[[UIView alloc]init];
    self.leftBgView.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:self.leftBgView];
    [self.leftBgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view.mas_top).offset(80.0f);
        make.left.mas_equalTo(self.view.mas_left).offset(0.0f);
        make.bottom.mas_equalTo(self.view.mas_bottom).offset(0.0f);
        make.width.mas_equalTo(@150);
    }];
    
    
    
    selfUIbutton*alertyButton=[[selfUIbutton alloc]init];
    alertyButton.uilaTitle.text=@"已评估";
    alertyButton.tag=1;
    [alertyButton addTarget:self action:@selector(CLICKPINGGU:) forControlEvents:UIControlEventTouchUpInside];
    [alertyButton.layer setBorderColor:[UIColor colorWithHexString:@"#5ddcd3"].CGColor];
    [alertyButton.layer setBorderWidth:0.6];
    //alertyButton.backgroundColor=[UIColor redColor];
    [self.leftBgView addSubview:alertyButton];
    
    [alertyButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.leftBgView.mas_left).offset(0.0f);
        make.top.mas_equalTo(self.leftBgView.mas_top).offset(0.0f);
        make.size.mas_equalTo(CGSizeMake(150.0f, 60.0f));

    }];
    
    selfUIbutton*noPgButton=[[selfUIbutton alloc]init];
    noPgButton.uilaTitle.text=@"未评估";
    noPgButton.tag=2;
    [noPgButton addTarget:self action:@selector(CLICKPINGGU:) forControlEvents:UIControlEventTouchUpInside];
    noPgButton.uilaTitle.textColor=[UIColor colorWithHexString:@"#303030"];
    noPgButton.imageViewm.image=[UIImage imageNamed:@"专家评估no"];
    [noPgButton.layer setBorderColor:[UIColor colorWithHexString:@"#f1f1f1"].CGColor];
    [noPgButton.layer setBorderWidth:0.6];
    [self.leftBgView addSubview:noPgButton];
    [noPgButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.leftBgView.mas_left).offset(0.0f);
        make.top.mas_equalTo(alertyButton.mas_bottom).offset(0.0f);
        make.size.mas_equalTo(CGSizeMake(150.0f, 60.0f));
        
    }];
    
    UIImageView*imageBottomView=[[UIImageView alloc]init];
    //imageBottomView.backgroundColor=[UIColor redColor];
    imageBottomView.image=[UIImage imageNamed:@"oldmen"];
    [self.leftBgView addSubview:imageBottomView];
    [imageBottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(_leftBgView.mas_bottom).offset(0.0f);
        make.left.mas_equalTo(_leftBgView.mas_left).offset(0.0f);
        make.right.mas_equalTo(_leftBgView.mas_right).offset(0.0f);
        make.height.mas_equalTo(100.0f);
       // make.width.mas_equalTo(100.0f);
    }];
   
    
    
}
-(void)loadUIlisttableView{
    
    self.UIlistTableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, 0, 0) style:UITableViewStylePlain];
    self.UIlistTableView.indicatorStyle=UIScrollViewIndicatorStyleWhite;
   // self.leftMenuTableView.separatorStyle = UITableViewCellEditingStyleNone;
    //self.UIlistTableView=[[UITableView alloc]init];
    self.UIlistTableView.dataSource=self;
    self.UIlistTableView.delegate=self;
    self.UIlistTableView.tag=10086;
   // [self.UIlistTableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];

    self.UIlistTableView.backgroundColor=[UIColor colorWithHexString:@"#f1f1f1"];
    [self.view addSubview:self.UIlistTableView];
    [self.UIlistTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.searchTextfiled.mas_bottom).offset(20.0f);
        make.left.mas_equalTo(self.self.leftBgView .mas_right).offset(25.0f);
        make.right.mas_equalTo(self.view).offset(0.0f);
        make.bottom.mas_equalTo(self.view.mas_bottom).offset(0.0f);
      //  make.width.mas_equalTo(@150);
    }];

}
//返回区的数量
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
   
    return 1;
    
}
//返回cell的个数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
  
    return _MainNsdataArray.count;
    
    
    
    
}
//重用cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static  NSString *indexpathcell=@"cell";
    
    nnlistModel*model=[_MainNsdataArray objectAtIndex:indexPath.row];
    
    
    JustListTableViewCell*cell=[tableView cellForRowAtIndexPath:indexPath];
    if (!cell) {
        cell=[[JustListTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:indexpathcell];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;

    cell.jigouLableName.text=model.name;
    return cell;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return 60;
}

-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    pgListHeaderView*views=[[pgListHeaderView alloc]init];
    return views;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 60.0f;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    nnlistModel*model=[_MainNsdataArray objectAtIndex:indexPath.row];
    //判断是否评价，以此来跳转不同的页面
    if ([model.evaluated isEqualToString:@"1"]) {
        DetialJudgeViewController*detialVC=[[DetialJudgeViewController alloc]init];
        detialVC.mId=model.mID;
        [self.navigationController pushViewController:detialVC animated:YES];
        
    }else{
        
        goTojudgeViewController*gotoJudgeVC=[[goTojudgeViewController alloc]init];
        gotoJudgeVC.listID=model.evaluationId;
        gotoJudgeVC.jiGouModelB = model;
        [self.navigationController pushViewController:gotoJudgeVC animated:YES];
    }
}
//补全cell分割线
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPat{
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]){
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
    if([cell respondsToSelector:@selector(setPreservesSuperviewLayoutMargins:)]){
        [cell setPreservesSuperviewLayoutMargins:NO];
    }
    
}
/*
-(UIView*)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    ListFooterView*viewfooter=[[ListFooterView alloc]init];
    //viewfooter.backgroundColor=[UIColor purpleColor];
    viewfooter.backgroundColor=[UIColor whiteColor];
   return viewfooter;
   // [viewfooter mas_makeConstraints:^(MASConstraintMaker *make) {
       //make
   // }];
    
}*/

//-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
// 
//    if (section==0) {
//        return 0;
//    }else{
//        return 400;
//
//    
//    }
//
//}

-(void)CLICKPINGGU:(selfUIbutton*)sender{
    if (sender.tag==1) {
        _MainNsdataArray=_alerdyPinguArray;
        [self.UIlistTableView reloadData];
    }else{
    
        _MainNsdataArray=_noPingGuuArray;
        [self.UIlistTableView reloadData];
    }
    

    
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
-(void)loadUItextFiled{
    UIView*uitextFiledBgView=[[UIView alloc]init];
    uitextFiledBgView.backgroundColor=[UIColor colorWithHexString:@"#f1f1f1"];

    uitextFiledBgView.userInteractionEnabled=YES;
    [self.view addSubview:uitextFiledBgView];
    
    [uitextFiledBgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view.mas_top).offset(80.0f);
        make.left.mas_equalTo(self.leftBgView.mas_right).offset(25.0f);
        //make.size.mas_equalTo(CGSizeMake(520.0f, 40.0f));
        make.right.mas_equalTo(self.view.mas_right).offset(15.0f);
        make.height.mas_equalTo(@50.0f);
        //make.size.mas_equalTo(CGSizeMake(520.0f, 40.0f));

        
    }];
    
    UIView*viewwih=[[UIView alloc]init];
    viewwih.backgroundColor=[UIColor whiteColor];
    [uitextFiledBgView addSubview:viewwih];
    [viewwih mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(uitextFiledBgView.mas_left).offset(0.0f);
        make.top.mas_equalTo(uitextFiledBgView.mas_top).offset(0.0f);
        make.size.mas_equalTo(CGSizeMake(10.0f, 40.0f));
    }];
    self.searchTextfiled=[[UITextField alloc]init];
    self.searchTextfiled.placeholder=@"请输入您要搜索的机构名称";
    self.searchTextfiled.returnKeyType = UIReturnKeySearch;
    self.searchTextfiled.delegate=self;
    self.searchTextfiled.backgroundColor=[UIColor whiteColor];
    self.searchTextfiled.enablesReturnKeyAutomatically = YES;
    [uitextFiledBgView addSubview:self.searchTextfiled];
    [self.searchTextfiled mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(uitextFiledBgView.mas_top).offset(0.0f);
        make.left.mas_equalTo(uitextFiledBgView.mas_left).offset(10.0f);
        make.size.mas_equalTo(CGSizeMake(340, 40.0f));
    }];
    /*
    self.firstDateTextfiled.leftViewMode = UITextFieldViewModeAlways;
    [self.firstDateTextfiled sizeToFit];
    self.firstDateTextfiled=[[UITextField alloc]init];
    self.firstDateTextfiled.placeholder=@"请输入开始日期";
    self.firstDateTextfiled.returnKeyType = UIReturnKeySearch;
    self.firstDateTextfiled.delegate=self;
    self.firstDateTextfiled.backgroundColor=[UIColor whiteColor];
    self.firstDateTextfiled.enablesReturnKeyAutomatically = YES;
    [uitextFiledBgView addSubview:self.firstDateTextfiled];
    [self.firstDateTextfiled mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(uitextFiledBgView.mas_top).offset(0.0f);
        make.left.mas_equalTo(self.searchTextfiled.mas_right).offset(15.0f);
        make.size.mas_equalTo(CGSizeMake(150, 40.0f));
    }];
    
    
    self.secondDateTextfiled.leftViewMode = UITextFieldViewModeAlways;
    [self.secondDateTextfiled sizeToFit];
    self.secondDateTextfiled=[[UITextField alloc]init];
    self.secondDateTextfiled.placeholder=@"请输入开始日期";
    self.secondDateTextfiled.returnKeyType = UIReturnKeySearch;
    self.secondDateTextfiled.delegate=self;
    self.secondDateTextfiled.backgroundColor=[UIColor whiteColor];
    self.secondDateTextfiled.enablesReturnKeyAutomatically = YES;
    [uitextFiledBgView addSubview:self.secondDateTextfiled];
    [self.secondDateTextfiled mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(uitextFiledBgView.mas_top).offset(0.0f);
        make.left.mas_equalTo(self.firstDateTextfiled.mas_right).offset(20.0f);
        make.size.mas_equalTo(CGSizeMake(150, 40.0f));
    }];*/
 

}

-(void)textFiledEditChanged:(NSNotification *)obj
{
    
    UITextField *textField = (UITextField *)obj.object;
    NSString *str=textField.text;
   // NSLog(@"%@",str);
    
    
    //这样就很好的解决了走两遍的问题，不至于走两遍额模糊查询代码
    if ([self.searchStr isEqualToString:str])
    {
        //在这里写模糊查询的实现代码，
    }
    else
    {
        self.searchStr=textField.text;
        NSLog(@"走的是通知方法，内容%@",str);
    }
    

    
}

- (BOOL)textFieldShouldReturn:(UITextField*)theTextField {
    [theTextField resignFirstResponder];
   // UITextField *textField = (UITextField *)obj.object;
    NSLog(@"%@",theTextField.text);
    return YES;
}

- (void) textFieldDidChange:(UITextField*) TextField{
    NSLog(@"textFieldDidChange textFieldDidChange");
    
}
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if (textField == self.searchTextfiled) {
        if (string.length == 0) return YES;
        
        NSInteger existedLength = textField.text.length;
        NSInteger selectedLength = range.length;
        NSInteger replaceLength = string.length;
        if (existedLength - selectedLength + replaceLength > 15) {
            return NO;
        }
    }
    
    return YES;
}

@end
