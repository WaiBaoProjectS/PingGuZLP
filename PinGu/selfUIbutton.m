//
//  selfUIbutton.m
//  PinGu
//
//  Created by 张小东 on 2017/9/23.
//  Copyright © 2017年 张小东. All rights reserved.
//

#import "selfUIbutton.h"
#import "Masonry.h"
#import "UIColor+Hex.h"
@implementation selfUIbutton
@synthesize uilaTitle,imageViewm;
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
        imageViewm=[[UIImageView alloc]init];
        imageViewm.image=[UIImage imageNamed:@"专家评估"];
        [self addSubview:imageViewm];
        
        
        [imageViewm mas_makeConstraints:^(MASConstraintMaker *make) {
            // make.top.mas_equalTo(self.mas_top).offset(13.0f);
            make.centerY.mas_equalTo(self);
            make.left.mas_equalTo(self.mas_left).offset(15.0f);
            make.size.mas_equalTo(CGSizeMake(18.0f, 15.5f));
        }];
        
        
        uilaTitle=[[UILabel alloc]init];
        uilaTitle.textAlignment=NSTextAlignmentLeft;
        uilaTitle.textColor=[UIColor colorWithHexString:@"#5ddcd3"];
        uilaTitle.font=[UIFont systemFontOfSize:15];
        [self addSubview:uilaTitle];
        [uilaTitle mas_makeConstraints:^(MASConstraintMaker *make) {
            //make.top.mas_equalTo(self.mas_top).offset(10.0f);
            make.centerY.mas_equalTo(self);
            
            make.left.mas_equalTo(imageViewm.mas_right).offset(15.0f);
            make.size.mas_equalTo(CGSizeMake(150.0f, 17.0));
        }];
    
        
    }
    return self;


}
@end
