//
//  detialNeirongTableViewCell.m
//  PinGu
//
//  Created by 张小东 on 2017/9/24.
//  Copyright © 2017年 张小东. All rights reserved.
//

#import "detialNeirongTableViewCell.h"
#import "UIColor+Hex.h"
#import "Masonry.h"
@implementation detialNeirongTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(instancetype)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    if (self) {
        UIView*leftLineView=[[UIView alloc]init];
        ///leftLineView.backgroundColor=[UIColor colorWithHexString:@"#999999"];
        leftLineView.backgroundColor=[UIColor redColor];
        [self addSubview:leftLineView];
        
        [leftLineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.mas_top).offset(0.0f);
            make.left.mas_equalTo(self.mas_left).offset(40.0f);
            make.size.mas_equalTo(CGSizeMake(5.5f,130.0f ));
        }];
        
        
        
        
        
        
    }
    return self;
    
    

}
@end
