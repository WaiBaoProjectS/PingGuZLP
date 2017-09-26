//
//  TIbgview.m
//  PinGu
//
//  Created by 张小东 on 2017/9/24.
//  Copyright © 2017年 张小东. All rights reserved.
//

#import "TIbgview.h"
#import "Masonry.h"
#import "UIColor+Hex.h"
#import "UILabel+mYK.h"
#import "PPNumberButton.h"
@implementation TIbgview
@synthesize TitleContent,timuDetialContent;
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(void)initwithDAta:(NSDictionary*)dataDic{
    self.userInteractionEnabled=YES;
    TitleContent=[[UILabel alloc]init];
    TitleContent.text=@"评估内容:";
    TitleContent.font=[UIFont fontWithName:@"Helvetica-Bold" size:17.0f];
    [self addSubview:TitleContent];
    [TitleContent mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.mas_top).offset(10.0f);
        make.left.mas_equalTo(self.mas_left).offset(20.0f);
        make.size.mas_equalTo(CGSizeMake(120.0F, 30));
    }];
    NSString*sring=@"分站至少配备一名不高于45周岁的专职管理人员;服务对象超过500的分站增加管理人员1名";
    
    
    
    
    PPNumberButton *numberButton = [PPNumberButton numberButtonWithFrame:CGRectMake(100, 100, 110, 30)];
    // 开启抖动动画
    numberButton.shakeAnimation = YES;
    // 设置最小值
    numberButton.minValue = 0;
    // 设置最大值
    numberButton.maxValue = 5;
    // 设置输入框中的字体大小
    numberButton.inputFieldFont = 23;
    numberButton.increaseTitle = @"＋";
    numberButton.decreaseTitle = @"－";
    
    numberButton.numberBlock = ^(NSString *num){
        NSLog(@"%@",num);
    };
    [self addSubview:numberButton];
    



}
- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    UIView *view = [super hitTest:point withEvent:event];
    if (view == nil) {
        for (UIView *subView in self.subviews) {
            CGPoint tp = [subView convertPoint:point fromView:self];
            if (CGRectContainsPoint(subView.bounds, tp)) {
                view = subView;
            }
        }
    }
    return view;
}

@end
