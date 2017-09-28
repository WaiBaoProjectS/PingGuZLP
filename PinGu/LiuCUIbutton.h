//
//  LiuCUIbutton.h
//  PinGu
//
//  Created by 张小东 on 2017/9/24.
//  Copyright © 2017年 张小东. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, LCButtonState) {
    START_STATE,
    FINISHED_STATE,
};


@interface LiuCUIbutton : UIButton
@property(nonatomic,strong)UILabel*Numlable;
@property(nonatomic,strong)UILabel*titleLable;
@property(nonatomic,strong)UIImageView*titleImage;
@property (nonatomic, strong) UIImageView *rightImage;
@property (nonatomic, assign) LCButtonState buttonStateType;

- (void) setImageViewWithStateType:(LCButtonState)type;

@end
