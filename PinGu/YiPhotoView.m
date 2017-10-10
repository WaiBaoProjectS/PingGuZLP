//
//  YiPhotoView.m
//  PinGu
//
//  Created by apple on 2017/10/10.
//  Copyright © 2017年 张小东. All rights reserved.
//

#import "YiPhotoView.h"
#define Collection_item_Width (SIZE_WIDTH - 50) / 4.0
#define Collection_item_Height (SIZE_WIDTH - 50) / 4.0
@implementation YiPhotoView{

    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (instancetype)init{

    self = [super init];
    if (self) {
        
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
        //    NSLog(@"Collection的frame:%g-------%g----%g-----%g------%g-------%g",self.collectionView.frame.size.width,self.collectionView.frame.size.height,Collection_item_Width,Collection_item_Height,self.bounds.size.width,self.bounds.size.height);
        self.collectionView.delegate = self;
        self.collectionView.dataSource = self;
        self.collectionView.backgroundColor = [UIColor whiteColor];
        
        self.collectionView.scrollEnabled = YES;
        //注册item类型
        
        //[self.backCollectionView registerClass:[DianShiQiangCollectionCell class] forCellWithReuseIdentifier:@"dianShiQiangCellId"];
        [self.collectionView registerNib:[UINib nibWithNibName:@"YiPhotoCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"yiPhotoID"];
        
        self.phoneARR = [NSMutableArray new];
    }
    return self;
}
- (void)loadViewWithArray:(NSMutableArray *)array{
    self.phoneARR = array;
    [self.collectionView reloadData];
    
}


#pragma mark CollectionViewCellDelegate 代理方法
#pragma mark CollectionView  的  dataSource方法
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    //    NSLog(@"Collection数组为：%ld",self.phoneARR.count);
    return self.phoneARR.count;
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString * cellId = @"yiPhotoID";
    YiPhotoCollectionViewCell *cell = (YiPhotoCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:cellId forIndexPath:indexPath];
    
    
    [cell.imageVIewP sd_setImageWithURL:[NSURL URLWithString:self.phoneARR[indexPath.row]]];

    return cell;
}

#pragma end mark

@end
