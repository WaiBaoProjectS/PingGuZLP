//
//  generalListViewController.m
//  PinGu
//
//  Created by 张小东 on 2017/9/6.
//  Copyright © 2017年 张小东. All rights reserved.
//

#import "generalListViewController.h"
#import "Masonry.h"
#import "UIColor+Hex.h"
#import "nnnViewController.h"
#import "genListTableViewCell.h"
#import "HeaderView.h"
#import "NetWorkingTool.h"
#import "genListModel.h"
#import "UIImageView+WebCache.h"
@interface generalListViewController ()
@property(nonatomic,strong)NSMutableArray*mainDataArray;
@end

@implementation generalListViewController
-(void)viewWillAppear:(BOOL)animated{
    
    
    self.view.backgroundColor=[UIColor whiteColor];
    [self.navigationController setNavigationBarHidden:NO animated:animated];
   // self.title=@"机构总部列表";
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithHexString:@"#5ddcd3"];

    UIView*viewNav=[[UIView alloc]init];
    //viewNav.backgroundColor=[UIColor whiteColor];
    self.navigationItem.titleView=viewNav;
    [viewNav mas_makeConstraints:^(MASConstraintMaker *make) {
     make.size.mas_equalTo(CGSizeMake(160.0f, 40.0f));
    make.center.mas_equalTo(self.navigationItem.titleView);
    }];
    UIImageView*jiGouImg=[[UIImageView alloc]init];
    jiGouImg.image=[UIImage imageNamed:@"机构icon"];
    [viewNav addSubview:jiGouImg];
    [jiGouImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(viewNav.mas_top).offset(7.0f);
        make.left.mas_equalTo(viewNav.mas_left).offset(10.0f);
        make.size.mas_equalTo(CGSizeMake(20.0f, 20.0f));
        //make.bottom.mas_equalTo(viewNav.mas_bottom).offset(-7.5f);
        //make.centerY.mas_equalTo(viewNav);
    }];
    UILabel*labTitle=[[UILabel alloc]init];
    labTitle.text=@"机构总部展示";
    labTitle.font=[UIFont systemFontOfSize:17];
    labTitle.textColor=[UIColor colorWithHexString:@"#ffffff"];
    [viewNav addSubview:labTitle];
    [labTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(viewNav.mas_top).offset(6.0f);
        make.left.mas_equalTo(jiGouImg.mas_right).offset(10.0f);
        make.size.mas_equalTo(CGSizeMake(150.0f, 25.0f));
        //make.centerY.mas_equalTo(viewNav);
    }];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    _mainDataArray=[[NSMutableArray alloc]init];
    // Do any additional setup after loading the view.
    /*
    UIButton*clickLoginbut=[UIButton buttonWithType:UIButtonTypeCustom];
    clickLoginbut.backgroundColor=[UIColor redColor];
    [clickLoginbut addTarget:self action:@selector(clickbutton) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:clickLoginbut];
    [clickLoginbut mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view.mas_top).offset(80.0f);
        make.size.mas_equalTo(CGSizeMake(260.0f, 65.0f));
        make.centerX.mas_equalTo(self.view.mas_centerX);
    }];*/
    
    [self loadNsdata];
    [self loadleftMenuTab];
}
-(void)loadNsdata{
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    NSString *tokenid = [ user objectForKey:@"userPassWord"];
    NSDictionary *pardic=@{@"type":@"MAIN",@"method":@"api.pias.find.institution",@"tokenId":tokenid};
    [NetWorkingTool postWithURL:@"http://119.23.203.111/api/api.do" parameters:pardic LX:@"1" success:^(id json) {
        
        NSMutableArray*dataARRAY=json[@"result"];
        if (dataARRAY.count>0) {
            for (NSDictionary*dic in dataARRAY) {
                genListModel*model=[[genListModel alloc]init];
                model.mID=dic[@"id"];
                model.address=dic[@"address"];
                model.name=dic[@"name"];
                model.institutionSiteName=dic[@"institutionSiteName"];
                model.contacts=dic[@"contacts"];
                model.institutionSiteId=dic[@"institutionSiteId"];
                NSArray*picArray=dic[@"institutionAttachmentPOList"];
                NSDictionary*picUrlDic=picArray[0];
                model.picurl=picUrlDic[@"url"];
                [_mainDataArray addObject:model];
            }
            [self.leftMenuTableView reloadData];
            genListModel*models=[_mainDataArray objectAtIndex:0];
            [self.IMageView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",models.picurl]]];
            self.institutionSiteId=models.institutionSiteId;
            
        }
        
    } failure:^(NSError *error) {
        //NSLog(@"%@",error);
        
    
        
    }];


}
-(void)loadleftMenuTab{
    self.leftMenuTableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, 0, 0) style:UITableViewStylePlain];
   // self.leftMenuTableView.style=UITableViewStylePlain;
    self.leftMenuTableView.dataSource=self;
    self.leftMenuTableView.delegate=self;
    //self.leftMenuTableView.backgroundColor=[UIColor colorWithHexString:@"#f1f1f1"];

    self.leftMenuTableView.indicatorStyle=UIScrollViewIndicatorStyleWhite;
    self.leftMenuTableView.separatorStyle = UITableViewCellEditingStyleNone;
    [self.view addSubview:self.leftMenuTableView];
    [self.leftMenuTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view.mas_top).offset(0.0f);
        make.left.mas_equalTo(self.view.mas_left).offset(15.0f);
        make.bottom.mas_equalTo(self.view.mas_bottom).offset(0.0f);
        make.width.mas_equalTo(@125);
    }];
    
    self.IMageView=[[UIImageView alloc]init];
    //self.IMageView.backgroundColor=[UIColor redColor];
    self.IMageView.image=[UIImage imageNamed:@"0222.jpg"];
    self.IMageView.userInteractionEnabled=YES;
    [self.view addSubview:self.IMageView];
    [self.IMageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view.mas_top).offset(80.0f);
        make.left.mas_equalTo(self.leftMenuTableView.mas_right).offset(20.0f);
        make.right.mas_equalTo(self.view.mas_right).offset(-20.0f);
        make.bottom.mas_equalTo(self.view.mas_bottom).offset(-150.0);
    }];
    UITapGestureRecognizer *tapClick = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clickbuttonM)];
    tapClick.numberOfTapsRequired = 1;
    [self.IMageView addGestureRecognizer:tapClick];
   
    


}
//返回区的数量
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}
//返回cell的个数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _mainDataArray.count;
}
//重用cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static  NSString *indexpathcell=@"cell";
    genListModel*model=[_mainDataArray objectAtIndex:indexPath.row];
    genListTableViewCell*cell=[tableView cellForRowAtIndexPath:indexPath];
    if (!cell) {
        cell=[[genListTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:indexpathcell];
    }
    cell.cellTitle.text=model.name;
    [cell.imageBg sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",model.picurl]]];
    cell.selectionStyle =UITableViewCellSelectionStyleNone;
    cell.backgroundColor=[UIColor colorWithHexString:@"#f1f1f1"];
    return cell;
    
}
//cell的高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return 115.0f ;
}
-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    HeaderView*views=[[HeaderView alloc]init];
    //views.backgroundColor=[UIColor colorWithHexString:@"#f1f1f1"];
   // tableView.tableHeaderView=views;

//    [views mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.mas_equalTo(tableView.tableHeaderView.mas_top).offset(0.0f);
////        make.left.mas_equalTo(tableView.tableHeaderView.mas_left).offset(0.0f);
////        make.right.mas_equalTo(tableView.tableHeaderView.mas_right).offset(0.0f);
//        make.width.mas_equalTo(@140);
//        make.height.mas_equalTo(@110.0f);
//    }];
    
    
    return views;
    
    
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (_mainDataArray.count>0) {
        genListModel*model=[_mainDataArray objectAtIndex:indexPath.row];
        [self.IMageView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",model.picurl]]];
        self.institutionSiteId=model.institutionSiteId;
        
    }else{
    
    }
    
  
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 115.0f;
}

-(void)clickbuttonM{
    nnnViewController*nnVC=[[nnnViewController alloc]init];
    nnVC.institutionSiteId=self.institutionSiteId;
    [self.navigationController pushViewController:nnVC animated:nil];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)LOADHEADERVIEW{

    }


@end
