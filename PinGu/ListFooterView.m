//
//  ListFooterView.m
//  PinGu
//
//  Created by 张小东 on 2017/9/10.
//  Copyright © 2017年 张小东. All rights reserved.
//

#import "ListFooterView.h"
#import "Masonry.h"
@implementation ListFooterView

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
        UIImageView*imageViewOldMen=[[UIImageView alloc]init];
        imageViewOldMen.image=[UIImage imageNamed:@"oldmen"];
        imageViewOldMen.backgroundColor=[UIColor redColor];
        [self addSubview:imageViewOldMen];
        
        [imageViewOldMen mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.mas_equalTo(self.mas_bottom).offset(0.0f);
            make.left.right.mas_equalTo(self).offset(0.0f);
            make.size.mas_equalTo(CGSizeMake(150.0f, 100.0f));
        }];
        
    }
    return self;
}
@end
