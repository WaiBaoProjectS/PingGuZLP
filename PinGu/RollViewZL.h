//
//  RollViewZL.h
//  PinGu
//
//  Created by apple on 2017/10/4.
//  Copyright © 2017年 张小东. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *==========ZL注释start===========
 *1.设置宽度和高度
 *
 *2.导入SDWebImageView
 *3.
 *4.
 ===========ZL注释end==========*/
#define VIEWWIDTH SIZE_WIDTH
#define VIEWHEIGHT VIEWWIDTH * 0.5

//typedef void(^TapViewBlock)(NSInteger index);


@interface RollViewZL : UIView<UIScrollViewDelegate>




- (void)loadTopLunXianViewWithSuperView:(id) sView withImageARR:(NSMutableArray *)imageARR withTapViewAction:(void (^)(NSInteger index)) tapActionBlcok withCurrentIndex:(void (^)(NSInteger currentIndex)) currentIndexBlock;

@end
