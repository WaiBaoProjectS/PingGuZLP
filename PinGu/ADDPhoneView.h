//
//  ADDPhoneView.h
//  PinGu
//
//  Created by apple on 2017/10/5.
//  Copyright © 2017年 张小东. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddPhoneCollectionViewCell.h"


typedef void(^ClickButtonADDBlock)(NSInteger index);

@interface ADDPhoneView : UIView<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>


@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) NSMutableArray *phoneARR;
@property (nonatomic, copy) ClickButtonADDBlock clickAddBlock;

- (void)createCollectionView;
- (void)setClickAddPhoneBlockAction:(ClickButtonADDBlock)block;
- (void)reloadCollectionWith:(NSArray *)imageArr;

@end
