//
//  HeaderView.m
//  PinGu
//
//  Created by 张小东 on 2017/9/10.
//  Copyright © 2017年 张小东. All rights reserved.
//

#import "HeaderView.h"
#import "UIColor+Hex.h"
#import "Masonry.h"
@implementation HeaderView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(instancetype)initWithFrame:(CGRect)frame{
    self=[super initWithFrame: frame];
    if (self) {
        self.backgroundColor=[UIColor colorWithHexString:@"#f1f1f1"];
        UIView*viewline=[[UIView alloc]init];
        viewline.backgroundColor=[UIColor whiteColor];
        [self addSubview:viewline];
        [viewline mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self).offset(0.0f);
            make.left.mas_equalTo(self).offset(0.0f);
            make.right.mas_equalTo(self).offset(0.0f);
            make.height.mas_equalTo(@15);
        }];
        UIView*viewbigTitle=[[UIView alloc]init];
        viewbigTitle.backgroundColor=[UIColor colorWithHexString:@"#5ddcd3"];
        [self addSubview:viewbigTitle];
        [viewbigTitle mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(viewline.mas_top).offset(30.0f);
            make.left.mas_equalTo(self.mas_left).offset(14.0f);
            make.right.mas_equalTo(self.mas_right).offset(-14.0f);
            make.height.mas_equalTo(@30.0f);
        }];
        viewbigTitle.layer.cornerRadius = 15;
        [viewbigTitle.layer setMasksToBounds:YES];
        UILabel*titlelable=[UILabel new];
        titlelable.text=@"全部机构";
        titlelable.font=[UIFont systemFontOfSize:14];
        titlelable.textColor=[UIColor colorWithHexString:@"#ffffff"];
        [viewbigTitle addSubview:titlelable];
        //titlelable.backgroundColor=[UIColor redColor];
        [titlelable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(viewbigTitle.mas_top).offset(0.0f);
            make.left.mas_equalTo(viewbigTitle.mas_left).offset(10.0f);
            make.size.mas_equalTo(CGSizeMake(60.0f, 30.0f));
        }];
        UIImageView*imagess=[[UIImageView alloc]init];
        imagess.image=[UIImage imageNamed:@"smale"];
        [viewbigTitle addSubview:imagess];
        [imagess mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(viewbigTitle.mas_top).offset(7.0f);
            make.left.mas_equalTo(titlelable.mas_right).offset(5.0f);
            make.size.mas_equalTo(CGSizeMake(12.0f, 12.0f));
        }];
        
        UIImageView*imageDown=[[UIImageView alloc]init];
        imageDown.image=[UIImage imageNamed:@"箭头-灰色"];
        [self addSubview:imageDown];
        [imageDown mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(viewbigTitle.mas_bottom).offset(13.0f);
            make.size.mas_equalTo(CGSizeMake(21.0f, 14.0f));
            make.centerX.mas_equalTo(self);
        }];
        
        
    }
    return self;
}
@end
