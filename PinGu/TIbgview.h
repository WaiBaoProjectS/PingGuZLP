//
//  TIbgview.h
//  PinGu
//
//  Created by 张小东 on 2017/9/24.
//  Copyright © 2017年 张小东. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TIbgview : UIView

@property(nonatomic,strong)UILabel*TitleContent;
@property(nonatomic,strong)UILabel*timuDetialContent;
-(void)initwithDAta:(NSDictionary*)dataDic;

@end
