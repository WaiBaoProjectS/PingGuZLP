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
#import "RollViewZL.h"
#import "TypePOModel.h"

typedef void(^LeftTableSelctIndexBlock)(NSInteger index);
typedef void(^RightItemSelctIndexBlock)(NSInteger index);

@interface GotojudgeView : UIView<UITableViewDataSource,UITableViewDelegate>


@property (nonatomic, strong) NSMutableArray *leftARR;
@property (nonatomic, strong) NSMutableArray *rightARR;

@property (nonatomic, strong) UIScrollView *TimuScrollview;
@property (nonatomic, strong) UITableView *leftTableView;
@property (nonatomic, strong) RollViewZL *rollView;
@property (nonatomic, strong) NSMutableDictionary * rollViewDIC;
@property (nonatomic, copy) LeftTableSelctIndexBlock leftIndexBlock;
@property (nonatomic, copy) RightItemSelctIndexBlock rigntIndexBlock;


- (void)initwithArrayData:(NSMutableArray*)dataArray;
- (void)loadRightViewWithItemPOModelARR:(NSMutableArray *)itemModelARR;
- (void)setLeftTableSelectIndexBlock:(LeftTableSelctIndexBlock)block withRightIndexBlock:(RightItemSelctIndexBlock) block2;

@end
