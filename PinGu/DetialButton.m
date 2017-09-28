//
//  DetialButton.m
//  PinGu
//
//  Created by 张小东 on 2017/9/27.
//  Copyright © 2017年 张小东. All rights reserved.
//

#import "DetialButton.h"
#import "UIColor+Hex.h"
#import "Masonry.h"
@implementation DetialButton
@synthesize circleNumlable,titleLable,titleImage;


-(instancetype)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    if (self) {
        self.backgroundColor=[UIColor colorWithHexString:@"F1f1f1"];
        circleNumlable=[[UILabel alloc]init];
        circleNumlable.backgroundColor=[UIColor colorWithHexString:@"5ddcd3"];
        circleNumlable.textColor=[UIColor whiteColor];
        circleNumlable.text=@"";
        circleNumlable.font=[UIFont fontWithName:@"Helvetica-Bold" size:17.0f];
        circleNumlable.layer.cornerRadius=30.0f;
        circleNumlable.layer.masksToBounds=YES;
        circleNumlable.textAlignment=NSTextAlignmentCenter;
        [self addSubview:circleNumlable];
        [circleNumlable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.mas_top).offset(5.0f);
            make.left.mas_equalTo(self.mas_left).offset(30.0f);
            make.size.mas_equalTo(CGSizeMake(60.0f, 60.0f));
        }];
        titleLable=[[UILabel alloc]init];
        titleLable.textColor=[UIColor colorWithHexString:@"5ddcd3"];
        titleLable.text=@"";
        // titleLable.backgroundColor=[UIColor redColor];
        titleLable.textAlignment=NSTextAlignmentCenter;
        titleLable.font=[UIFont fontWithName:@"Helvetica-Bold" size:17.0f];
        [self addSubview:titleLable];
        [titleLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(circleNumlable.mas_bottom).offset(0.0f);
            make.left.mas_equalTo(self.mas_left).offset(0.0f);
            make.size.mas_equalTo(CGSizeMake(120.0f, 30.0f));
        }];
        
    }
    return self;
    
}
@end
