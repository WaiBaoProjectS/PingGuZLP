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
        Numlable.backgroundColor=[UIColor colorWithHexString:GreenColor_ZL_TIJIAO];
        Numlable.textColor=[UIColor whiteColor];
        Numlable.text=@"1";
        Numlable.font=[UIFont fontWithName:@"Helvetica-Bold" size:17.0f];
        Numlable.layer.cornerRadius=20.0f;
        Numlable.layer.masksToBounds=YES;
        Numlable.textAlignment=NSTextAlignmentCenter;
        [self addSubview:Numlable];
        
        
        [Numlable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.mas_top).offset(10.0f);
            make.left.mas_equalTo(self.mas_left).offset(0.0f);
            make.size.mas_equalTo(CGSizeMake(40.0f, 40.0f));
        }];
        
        
        titleLable=[[UILabel alloc]init];
        titleLable.textColor=[UIColor colorWithHexString:GrayColor_ZL_TIJIAO];
        titleLable.text=@"供应商体系的建立";
        // titleLable.backgroundColor=[UIColor redColor];
        titleLable.textAlignment=NSTextAlignmentLeft;

        titleLable.font=[UIFont fontWithName:@"Helvetica-Bold" size:15.0f];
        titleLable.adjustsFontSizeToFitWidth = YES;
        titleLable.minimumScaleFactor = 0.5;
        [self addSubview:titleLable];
        
        [titleLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.mas_top).offset(20.0f);
            
            make.left.mas_equalTo(Numlable.mas_right).offset(2.0f);
            make.size.mas_equalTo(CGSizeMake(80.0f, 20.0f));
        }];
        
    }
    return self;

}

- (void)setButtonStateType:(LiuCButtonSate)state{

    switch (state) {
        case START_STATE:
            [self setStartButtonState];
            break;
        case FINISHED_STATE:
            [self setFinishedButtonState];
            break;
        default:
            break;
    }

}

- (void)setStartButtonState{
    
    //self.enabled = NO;
    Numlable.backgroundColor = [UIColor colorWithHexString:GrayColor_ZL_TIJIAO];
    titleLable.textColor = [UIColor colorWithHexString:GrayColor_ZL_TIJIAO];

}
- (void)setFinishedButtonState{
    //self.enabled = YES;
    Numlable.backgroundColor = [UIColor colorWithHexString:GreenColor_ZL_TIJIAO];
    titleLable.textColor = [UIColor colorWithHexString:GreenColor_ZL_TIJIAO];
}

@end
