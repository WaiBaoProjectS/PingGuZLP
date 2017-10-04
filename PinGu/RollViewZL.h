//
//  RollViewZL.h
//  PinGu
//
//  Created by apple on 2017/10/4.
//  Copyright © 2017年 张小东. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ItemPOModel.h"
#import "PPNumberButton.h"

/**
 *==========ZL注释start===========
 *1.设置宽度和高度
 *
 *2.导入SDWebImageView
 *3.
 *4.
 ===========ZL注释end==========*/
#define VIEWWIDTH  self.frame.size.width
#define VIEWHEIGHT self.frame.size.height

typedef NS_ENUM(NSUInteger, ROLL_TYPE) {
    IMAGEVIEW_ROLL,
    LABEL_ROLL,
};

typedef void(^CurrentIndexBlock)(NSInteger currentIndex);

//typedef void(^TapViewBlock)(NSInteger index);


@interface RollViewZL : UIView<UIScrollViewDelegate>

@property (nonatomic, copy) CurrentIndexBlock currentBlock;


//- (void)setCurrentIndexBlocksWith:(CurrentIndexBlock)block;
- (instancetype)initRoll;
- (void)loadTopLunXianViewWithSuperView:(id) sView withImageARR:(NSMutableArray *)imageARR withRollType:(ROLL_TYPE)rollType withTapViewAction:(void (^)(NSInteger index)) tapActionBlcok withCurrentIndex:(CurrentIndexBlock) currentIndexBlock;


@end
