//
//  DetialMainView.h
//  PinGu
//
//  Created by 张小东 on 2017/9/24.
//  Copyright © 2017年 张小东. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetialMainView : UIView<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView*tabMainTableView;

-(void)loadViewWith:(NSMutableArray*)DataArray;
@end
