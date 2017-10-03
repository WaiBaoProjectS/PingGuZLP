//
//  GotojudgeView.h
//  PinGu
//
//  Created by 张小东 on 2017/9/24.
//  Copyright © 2017年 张小东. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TiJiaoTableViewCell.h"
#import "SubjectModel.h"
#import "ItemPOModel.h"

@interface GotojudgeView : UIView<UITableViewDataSource,UITableViewDelegate>


@property (nonatomic, strong) NSMutableArray *leftARR;
@property (nonatomic, strong) NSMutableArray *rightARR;

@property (nonatomic, strong) UIScrollView *TimuScrollview;
@property (nonatomic, strong) UITableView *leftTableView;


-(void)initwithArrayData:(NSMutableArray*)dataArray;

@end
