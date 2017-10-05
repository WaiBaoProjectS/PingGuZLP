//
//  ADDPhoneView.m
//  PinGu
//
//  Created by apple on 2017/10/5.
//  Copyright © 2017年 张小东. All rights reserved.
//

#import "ADDPhoneView.h"
#define Collection_item_Width (SIZE_WIDTH - 50) / 4.0
#define Collection_item_Height (SIZE_WIDTH - 50) / 4.0
@implementation ADDPhoneView

//
- (void)createCollectionView{
    

    //创建CollectionVIew
    //创建一个Layout布局
    UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc]init];
    //设置布局方向为垂直流布局
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    //设置每个item的大小为
    layout.itemSize = CGSizeMake(Collection_item_Width, Collection_item_Width);
    //item距离四周的位置（上左下右）
    layout.sectionInset = UIEdgeInsetsMake(0, 10, 0, 10);
    //item 行与行的距离
    layout.minimumLineSpacing = 10;
    //item 列与列的距离
    layout.minimumInteritemSpacing = 10;
    

//    [self.collectionView setCollectionViewLayout:layout];
    self.collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];

    [self addSubview:self.collectionView];
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.bottom.right.mas_equalTo(self);
    }];
    NSLog(@"Collection的frame:%g-------%g----%g-----%g------%g-------%g",self.collectionView.frame.size.width,self.collectionView.frame.size.height,Collection_item_Width,Collection_item_Height,self.bounds.size.width,self.bounds.size.height);
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.collectionView.backgroundColor = [UIColor whiteColor];
    
    self.collectionView.scrollEnabled = YES;
    //注册item类型
    
    //[self.backCollectionView registerClass:[DianShiQiangCollectionCell class] forCellWithReuseIdentifier:@"dianShiQiangCellId"];
    [self.collectionView registerNib:[UINib nibWithNibName:@"AddPhoneCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"addPhoneCellid"];

}

- (void)reloadCollectionWith:(NSArray *)imageArr{

    [self.phoneARR addObjectsFromArray:imageArr];
    
    [self.collectionView reloadData];
    
    
}

#pragma mark CollectionViewCellDelegate 代理方法
#pragma mark CollectionView  的  dataSource方法
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    NSLog(@"Collection数组为：%ld",self.phoneARR.count);
    return self.phoneARR.count+1;
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString * cellId = @"addPhoneCellid";
    AddPhoneCollectionViewCell *cell = (AddPhoneCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:cellId forIndexPath:indexPath];
    
    if (indexPath.row == self.phoneARR.count) {
        
    }
    else{
        UIImage * image = self.phoneARR[indexPath.row];
        [cell.phoneImageView setImage:image];
        cell.addImage.hidden = YES;
        cell.titleLabel.hidden = YES;
        
    }
    /*
     UIImage * JHimage = self.dataSourceArray[indexPath.row];
     //    UIImage * JHImage = [UIImage imageNamed:imageNamed];
     cell.myImgView.image = JHimage;
     cell.close.hidden = self.isDelItem;
     cell.delegate = self;
     //    cell.backgroundColor = arcColor;
     */
    return cell;
}

#pragma end mark
#pragma mark  点击CollectionView触发事件
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    //    if (self.delegate && [self.delegate respondsToSelector:@selector(firstSubVC:withType:withName:withKey:)]) {
    //        [self.delegate firstSubVC:self withType:0 withName:@"电影" withKey:@"关键字"];
    //    }
    NSLog(@"点击上传图片");

    if (indexPath.row == self.phoneARR.count) {
        self.clickAddBlock(indexPath.row);
    }
    
}


#pragma mark  设置CollectionViewCell是否可以被点击
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}
#pragma mark ===================代理方法  结束==================

/**
 *==========ZL注释start===========
 *1.BlocK添加图片
 *
 *2.
 *3.
 *4.
 ===========ZL注释end==========*/
- (void)setClickAddPhoneBlockAction:(ClickButtonADDBlock)block{
    self.clickAddBlock = block;
}

- (NSMutableArray *)phoneARR{

    if (!_phoneARR) {
        _phoneARR = [NSMutableArray new];
    }
    return _phoneARR;
}

@end
