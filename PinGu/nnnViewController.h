//
//  nnnViewController.h
//  PinGu
//
//  Created by 张小东 on 2017/9/6.
//  Copyright © 2017年 张小东. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface nnnViewController : UIViewController<UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate>
@property(nonatomic,strong)UITableView*judgeOrglistTableView;//菜单
@property(nonatomic,strong)UITableView*UIlistTableView;//菜单

@property(nonatomic,strong)UITextField*searchTextfiled;//搜索框
@property(nonatomic,strong)UITextField*firstDateTextfiled;//搜索框
@property(nonatomic,strong)UITextField*secondDateTextfiled;//搜索框

@property(nonatomic,copy)NSString*searchStr;//搜索框


@property(nonatomic,strong)UIView*leftBgView;

@end
