//
//  LiuCUIbutton.m
//  PinGu
//
//  Created by 张小东 on 2017/9/24.
//  Copyright © 2017年 张小东. All rights reserved.
//

#import "LiuCUIbutton.h"
#import "UIColor+Hex.h"
#import "Masonry.h"
@implementation LiuCUIbutton
@synthesize Numlable,titleLable,titleImage;
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(instancetype)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    if (self) {
        self.backgroundColor=[UIColor colorWithHexString:@"F1f1f1"];
        Numlable=[[UILabel alloc]init];
        Numlable.backgroundColor=[UIColor colorWithHexString:@"5ddcd3"];
        Numlable.textColor=[UIColor whiteColor];
        Numlable.text=@"1";
        Numlable.font=[UIFont fontWithName:@"Helvetica-Bold" size:17.0f];
        Numlable.layer.cornerRadius=30.0f;
        Numlable.layer.masksToBounds=YES;
        Numlable.textAlignment=NSTextAlignmentCenter;
        [self addSubview:Numlable];
        
        
        [Numlable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.mas_top).offset(10.0f);
            make.left.mas_equalTo(self.mas_left).offset(0.0f);
            make.size.mas_equalTo(CGSizeMake(60.0f, 60.0f));
        }];
        
        
        titleLable=[[UILabel alloc]init];
        titleLable.textColor=[UIColor colorWithHexString:@"5ddcd3"];
        titleLable.text=@"供应商体系的建立";
       // titleLable.backgroundColor=[UIColor redColor];
        titleLable.textAlignment=NSTextAlignmentCenter;
        titleLable.font=[UIFont fontWithName:@"Helvetica-Bold" size:17.0f];
        [self addSubview:titleLable];
        
        [titleLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.mas_top).offset(25.0f);
        
            make.left.mas_equalTo(Numlable.mas_right).offset(10.0f);
            make.size.mas_equalTo(CGSizeMake(140.0f, 30.0f));
        }];
        
        
    }
    return self;

}
@end
