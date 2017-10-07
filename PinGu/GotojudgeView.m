//
//  GotojudgeView.m
//  PinGu
//
//  Created by 张小东 on 2017/9/24.
//  Copyright © 2017年 张小东. All rights reserved.
//

#import "GotojudgeView.h"
#import "Masonry.h"
#import "UIColor+Hex.h"
#import "TIbgview.h"
@implementation GotojudgeView

@synthesize TimuScrollview;
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(void)initwithArrayData:(NSMutableArray*)dataArray{
    self.userInteractionEnabled=YES;

    self.backgroundColor=[UIColor colorWithHexString:@"#F1F1F1"];
    self.leftARR = dataArray;
    NSLog(@"左边传入的数组的个数:%ld",self.leftARR.count);
    [self loadLeftTableView];
    
    
    [self xw_addNotificationForName:@"SELECT_FIRST" block:^(NSNotification * _Nonnull notification) {
        NSString * ishave = notification.userInfo[@"isHave"];
        
        if ([ishave isEqualToString:@"yes"]) {
            dispatch_async(dispatch_get_main_queue(), ^{
                [weak_self(self) selectFirstItemPO];
            });
        }
        else{
            dispatch_async(dispatch_get_main_queue(), ^{
                NSMutableArray * arr = [NSMutableArray new];
                [self loadRightViewWithItemPOModelARR:arr];
            });

        }
       
    }];
}
/**
 *==========ZL注释start===========
 *1.默认选择第一个
 *
 *2.
 *3.
 *4.
 ===========ZL注释end==========*/

- (void)convertModelBeforeSelect{

    

    
};

- (void)selectFirstItemPO{

    
    TypePOModel * model = [self.leftARR objectAtIndex:0];
    

    
    
    [self loadRightViewWithItemPOModelARR:model.evaluationItemPOList];
    
}

#pragma mark ===================UITableViewDelegate方法实现   START==================
- (void)loadLeftTableView{
    self.leftTableView = [[UITableView alloc]init];
    self.leftTableView.delegate = self;
    self.leftTableView.dataSource = self;
    
    //timuCellid  TiJiaoTableViewCell
//    [self.leftTableView registerClass:[TiJiaoTableViewCell class] forCellReuseIdentifier:@"timuCellid"];
    [self.leftTableView registerNib:[UINib nibWithNibName:@"TiJiaoTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"timuCellid"];
    [self addSubview:self.leftTableView];

    [self.leftTableView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.top.mas_equalTo(self.mas_top).offset(0.0f);
        make.left.mas_equalTo(self.mas_left).offset(0.0f);
        make.bottom.mas_equalTo(self.mas_bottom).offset(0.0f);
        make.width.mas_equalTo(@160.0f);
        
    }];
    
    
    /*
     *加载右边视图
     */
    self.rollView = [[RollViewZL alloc]initRoll];
    self.rollView.backgroundColor = [UIColor whiteColor];

    //    [rollview setCurrentIndexBlocksWith:^(NSInteger currentIndex) {
    //        NSLog(@"当前的位置：%ld",currentIndex);
    //    }];
    
    [self addSubview:self.rollView];
    [self.rollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.mas_top).offset(0.0f);
        make.left.mas_equalTo(self.leftTableView.mas_right).offset(20.0f);
        make.bottom.mas_equalTo(self.mas_bottom).offset(-20.0f);
        make.right.mas_equalTo(self.mas_right).offset(-15.0f);
    }];
    

    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    NSLog(@"在Sections方法中执行刷新方法");
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.leftARR.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60.0f;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"点击了cell");
    self.leftIndexBlock(indexPath.row);
     TypePOModel * model = [self.leftARR objectAtIndex:indexPath.row];

    
    [self loadRightViewWithItemPOModelARR:model.evaluationItemPOList];
}
- (TiJiaoTableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    static NSString *rid = @"timuCellid";
    
    TiJiaoTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:rid];
    
//    if(cell==nil){
//        
//        cell=[[TiJiaoTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault      reuseIdentifier:rid];
//        cell = [UINib nibWithNibName: bundle:<#(nullable NSBundle *)#>];
//        
//    }
    TypePOModel * model = [self.leftARR objectAtIndex:indexPath.row];
    cell.timuLabel.text = model.name ? model.name:@"团队建设";
    return cell;
}



#pragma mark =================== END ==================

#pragma mark ===================右边详情视图 START==================
/**
 *==========ZL注释start===========
 *1.创建右边视图
 *
 *2.传入 itemPOModel数组创建
 *3.
 *4.
 ===========ZL注释end==========*/
- (void)loadRightViewWithItemPOModelARR:(NSMutableArray *)itemModelARR{
    
    [self.rollView loadTopLunXianViewWithSuperView:self withImageARR:itemModelARR withRollType:LABEL_ROLL withTapViewAction:^(NSInteger index) {
        
        
    } withCurrentIndex:^(NSInteger currentIndex) {
        
        NSLog(@"当前位置：%ld",currentIndex);
        self.rigntIndexBlock(currentIndex);
    }];

    /*
     NSArray*arrayss=[NSArray arrayWithObjects:@"1",@"2",@"3",@"4",@"5", nil];
     for (NSUInteger i =0; i<arrayss.count; i++) {
     TIbgview*Bgview=[[TIbgview alloc]init];
     Bgview.backgroundColor=[UIColor purpleColor];
     [TimuScrollview addSubview:Bgview];
     
     }*/
//    [self bringSubviewToFront:rollview];
    

    
}
#pragma mark ===================右边详情视图 END ==================


- (NSMutableArray *)leftARR{
    if (!_leftARR) {
        _leftARR = [NSMutableArray new];
    }
    return _leftARR;
}

- (NSMutableDictionary *)rollViewDIC{
    if (!_rollViewDIC) {
        _rollViewDIC = [[NSMutableDictionary alloc]init];
    }
    return _rollViewDIC;
}

- (void)setLeftTableSelectIndexBlock:(LeftTableSelctIndexBlock)block withRightIndexBlock:(RightItemSelctIndexBlock)block2{
    self.leftIndexBlock = block;
    self.rigntIndexBlock = block2;
}


@end
