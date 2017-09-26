//
//  genListTableViewCell.m
//  PinGu
//
//  Created by 张小东 on 2017/9/10.
//  Copyright © 2017年 张小东. All rights reserved.
//

#import "genListTableViewCell.h"
#import "Masonry.h"
#import "UIColor+Hex.h"
@implementation genListTableViewCell
@synthesize cellTitle,imageBg;
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        imageBg=[[UIImageView alloc]init];
        imageBg.image=[UIImage imageNamed:@"缩略图"];
        [self addSubview:imageBg];
        
        [imageBg mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.mas_top).offset(0.0f);
            make.left.mas_equalTo(self.mas_left).offset(14.0f);
            make.right.mas_equalTo(self.mas_right).offset(-14.0f);
            make.height.mas_equalTo(@82.0f);
        }];
        
        cellTitle=[[UILabel alloc]init];
        cellTitle.backgroundColor=[UIColor whiteColor];
        cellTitle.text=@"居家福";
        cellTitle.textColor=[UIColor colorWithHexString:@"#303030"];
        cellTitle.textAlignment=NSTextAlignmentCenter;
        cellTitle.font=[UIFont systemFontOfSize:12.0f];
        [self addSubview:cellTitle];
        [cellTitle mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(imageBg.mas_bottom).offset(-10.0f);
            make.centerX.mas_equalTo(self);
            make.size.mas_equalTo(CGSizeMake(62.0f, 20.0f));

        }];
        
        
        
        
        
        
        
        
    }
    return self;

}
@end
