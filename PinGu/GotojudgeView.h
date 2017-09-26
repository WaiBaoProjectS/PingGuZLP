//
//  GotojudgeView.h
//  PinGu
//
//  Created by 张小东 on 2017/9/24.
//  Copyright © 2017年 张小东. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GotojudgeView : UIView
@property(nonatomic,strong)UIScrollView*TimuScrollview;


-(void)initwithArrayData:(NSMutableArray*)dataArray;

@end
