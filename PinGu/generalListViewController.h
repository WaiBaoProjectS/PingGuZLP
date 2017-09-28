//
//  generalListViewController.h
//  PinGu
//
//  Created by 张小东 on 2017/9/6.
//  Copyright © 2017年 张小东. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface generalListViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView*leftMenuTableView;
@property(nonatomic,strong)UIImageView*IMageView;
@property(nonatomic,copy)NSString*institutionSiteId;
@end
