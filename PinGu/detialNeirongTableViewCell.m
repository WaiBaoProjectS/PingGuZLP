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
@synthesize lablexuhao,lablekpnr,lablekfqk,lablekfyy;
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
        
        UIView*leftLineView=[[UIView alloc]init];
        leftLineView.backgroundColor=[UIColor colorWithHexString:@"999999"];
        [self addSubview:leftLineView];
        [leftLineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.mas_top).offset(0.0f);
            make.left.mas_equalTo(self.mas_left).offset(40.0f);
            make.size.mas_equalTo(CGSizeMake(1.5f,140.0f ));
        }];
        
        lablexuhao=[[UILabel alloc]init];
        lablexuhao.text=@"序号";
        lablexuhao.textAlignment=NSTextAlignmentCenter;
        lablexuhao.font=[UIFont fontWithName:@"Helvetica-Bold" size:17.0f];
        lablexuhao.textAlignment=NSTextAlignmentCenter;
        [self addSubview:lablexuhao];
        
        [lablexuhao mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(leftLineView.mas_right).offset(5.0f);
            make.top.mas_equalTo(self.mas_top).offset(6.0f);
            make.size.mas_equalTo(CGSizeMake(60.0f, 100.0f));
        }];
        
        UIView*shuview=[[UIView alloc]init];
        // shuview.backgroundColor=[UIColor redColor];
        shuview.backgroundColor=[UIColor colorWithHexString:@"#999999"];
        [self addSubview:shuview];
        [shuview mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.mas_top).offset(0.0f);
            make.left.mas_equalTo(lablexuhao.mas_right).offset(5.0f);
            make.size.mas_equalTo(CGSizeMake(1.5f, 140.0f));
        }];
        
        lablekpnr=[[UILabel alloc]init];
        lablekpnr.text=@"";
        
        lablekpnr.font=[UIFont fontWithName:@"Helvetica-Bold" size:15.0f];
        // lablekpnr.backgroundColor=[UIColor purpleColor];
        lablekpnr.textAlignment=NSTextAlignmentCenter;
        [lablekpnr setNumberOfLines:0];
        [self addSubview:lablekpnr];
        
        [lablekpnr mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.mas_top).offset(6.0f);
            make.left.mas_equalTo(shuview.mas_right).offset(5.0f);
            make.size.mas_equalTo(CGSizeMake(340.0f, 135.0f));
        }];
        UIView*shuviewsec=[[UIView alloc]init];
        // shuviewsec.backgroundColor=[UIColor redColor];
        shuviewsec.backgroundColor=[UIColor colorWithHexString:@"#999999"];
        [self addSubview:shuviewsec];
        [shuviewsec mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.mas_top).offset(0.0f);
            make.left.mas_equalTo(lablekpnr.mas_right).offset(5.0f);
            make.size.mas_equalTo(CGSizeMake(1.5f, 140.0f));
        }];
        
        lablekfqk=[[UILabel alloc]init];
        lablekfqk.text=@"12";
        lablekfqk.font=[UIFont fontWithName:@"Helvetica-Bold" size:17.0f];
        lablekfqk.textAlignment=NSTextAlignmentCenter;
        [self addSubview:lablekfqk];
        
        [lablekfqk mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.mas_top).offset(6.0f);
            make.left.mas_equalTo(shuviewsec.mas_right).offset(5.0f);
            make.size.mas_equalTo(CGSizeMake(160.0f, 135.0f));
        }];
        
        UIView*shuviewthid=[[UIView alloc]init];
        shuviewthid.backgroundColor=[UIColor colorWithHexString:@"#999999"];
        [self addSubview:shuviewthid];
        [shuviewthid mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.mas_top).offset(0.0f);
            make.left.mas_equalTo(lablekfqk.mas_right).offset(5.0f);
            make.size.mas_equalTo(CGSizeMake(1.5f, 140.0f));
        }];
        
        lablekfyy=[[UILabel alloc]init];
        lablekfyy.text=@"爱是快乐发哈萨克来得及欧派前五日哦请回复金坷垃首付款拉数据的；拉斯看到爬起富婆按揭付款咯垃圾苦辣都怕死看到了；按时记得克拉时候覅偶权威安达";
        lablekfyy.textAlignment=NSTextAlignmentCenter;
        lablekfyy.font=[UIFont fontWithName:@"Helvetica-Bold" size:15.0f];
        lablekfyy.textAlignment=NSTextAlignmentCenter;
        [self addSubview:lablekfyy];
        [lablekfyy mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.mas_top).offset(6.0f);
            make.left.mas_equalTo(shuviewthid.mas_right).offset(5.0f);
            make.size.mas_equalTo(CGSizeMake(160, 135));
        }];
        
        UIView*shuviewFOUR=[[UIView alloc]init];
        shuviewFOUR.backgroundColor=[UIColor colorWithHexString:@"#999999"];
        [self addSubview:shuviewFOUR];
        [shuviewFOUR mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.mas_top).offset(0.0f);
            make.right.mas_equalTo(self.mas_right).offset(-40.0f);
            make.size.mas_equalTo(CGSizeMake(1.5f, 140.0f));
        }];
        
        UIView*lineviewDIDI=[[UIView alloc]init];
        lineviewDIDI.backgroundColor=[UIColor colorWithHexString:@"#999999"];
        [self addSubview:lineviewDIDI];
        [lineviewDIDI mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(shuviewFOUR.mas_bottom).offset(0.0f);
            make.left.mas_equalTo(self.mas_left).offset(40.0f);
            make.right.mas_equalTo(self.mas_right).offset(-40.0f);
            make.height.mas_equalTo(@1.5f);
        }];

        
        
        
    }
    return self;

}
@end
