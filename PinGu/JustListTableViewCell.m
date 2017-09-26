//
//  JustListTableViewCell.m
//  PinGu
//
//  Created by 张小东 on 2017/9/10.
//  Copyright © 2017年 张小东. All rights reserved.
//

#import "JustListTableViewCell.h"
#import "Masonry.h"
#import "UIColor+Hex.h"
@implementation JustListTableViewCell
@synthesize NameLableTitle,imageLoginIcon,jigouLableName,dateLableName,peopleLableName;
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
        
        UIView*headerBgview=[[UIView alloc]init];
        headerBgview.backgroundColor=[UIColor whiteColor];
        [self addSubview:headerBgview];
        [headerBgview mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.mas_equalTo(self).offset(0);
            make.height.mas_equalTo(@60.0f);
        }];
        
        jigouLableName=[[UILabel alloc]init];
        jigouLableName.font=[UIFont systemFontOfSize:15.0f];
        jigouLableName.text=@"分部机构名称";
        //jigouLableName.backgroundColor=[UIColor redColor];
        jigouLableName.textAlignment=NSTextAlignmentCenter;
        jigouLableName.textColor=[UIColor colorWithHexString:@"#303030"];
        [headerBgview addSubview:jigouLableName];
        [jigouLableName mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(headerBgview.mas_top).offset(0.0f);
            make.left.mas_equalTo(headerBgview.mas_left).offset(0.0f);
            make.size.mas_equalTo(CGSizeMake(360.0f, 60));
            
        }];
        
//        UIView*lineView=[[UIView alloc]init];
//        lineView.backgroundColor=[UIColor whiteColor];
//        [headerBgview addSubview:lineView];
//        
//        [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.top.mas_equalTo(headerBgview.mas_top).offset(0.0f);
//            make.left.mas_equalTo(jigouLableName.mas_right).offset(20.0f);
//            make.size.mas_equalTo(CGSizeMake(2.0f, 60.0f));
//        }];
        
        
        peopleLableName=[[UILabel alloc]init];
        peopleLableName.font=[UIFont systemFontOfSize:15.0f];
        peopleLableName.text=@"评估人";
        //peopleLableName.backgroundColor=[UIColor redColor];
        peopleLableName.textAlignment=NSTextAlignmentCenter;
        peopleLableName.textColor=[UIColor colorWithHexString:@"#303030"];
        [headerBgview addSubview:peopleLableName];
        [peopleLableName mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(headerBgview.mas_top).offset(0.0f);
            make.left.mas_equalTo(jigouLableName.mas_right).offset(22.0f);
            make.size.mas_equalTo(CGSizeMake(240.0f, 60.0f));
            
        }];
        
        
        dateLableName=[[UILabel alloc]init];
        dateLableName.font=[UIFont systemFontOfSize:15.0f];
        dateLableName.text=@"评估日期";
        // dateLableName.backgroundColor=[UIColor redColor];
        dateLableName.textAlignment=NSTextAlignmentCenter;
        dateLableName.textColor=[UIColor colorWithHexString:@"#303030"];
        [headerBgview addSubview:dateLableName];
        [dateLableName mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(headerBgview.mas_top).offset(0.0f);
            make.left.mas_equalTo(peopleLableName.mas_right).offset(0.0f);
            make.size.mas_equalTo(CGSizeMake(225.0f, 60.0f));
            
        }];
        
        
    }


    return self;
}
@end
