//
//  YiPhotoView.h
//  PinGu
//
//  Created by apple on 2017/10/10.
//  Copyright © 2017年 张小东. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YiPhotoCollectionViewCell.h"


@interface YiPhotoView : UIView<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) NSMutableArray *phoneARR;

- (void)loadViewWithArray:(NSMutableArray *)array;

@end
