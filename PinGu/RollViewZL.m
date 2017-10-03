//
//  RollViewZL.m
//  PinGu
//
//  Created by apple on 2017/10/4.
//  Copyright © 2017年 张小东. All rights reserved.
//

#import "RollViewZL.h"


@implementation RollViewZL{
    UIScrollView * _scrollview;
    UIPageControl * _pageControl;
    NSMutableArray * _imageARR;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
/*
     [NSTimer scheduledTimerWithTimeInterval:5 target:self selector:@selector(handleSchedule) userInfo:nil repeats:YES];
 */

/**
 *==========ZL注释start===========
 *1.加载沦陷视图
 *
 *2.返回点击Block
 *3.返回当前视图Index
 *4.
 ===========ZL注释end==========*/
- (void)loadTopLunXianViewWithSuperView:(id)sView withImageARR:(NSMutableArray *)imageARR withTapViewAction:(void (^)(NSInteger))tapActionBlcok withCurrentIndex:(void (^)(NSInteger))currentIndexBlock{

//    self.lunXianBackgroundView
    UIView * backgroundView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SIZE_WIDTH, 315.0/560.0*SIZE_WIDTH)];
    backgroundView.backgroundColor = [UIColor whiteColor];
    
    _scrollview = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, SIZE_WIDTH, 315.0/560.0*SIZE_WIDTH)];
    _scrollview.delegate = self;
    _scrollview.showsVerticalScrollIndicator = NO;
    _scrollview.showsHorizontalScrollIndicator = NO;
    //[self.lunXianScrollView setContentSize:CGSizeMake(SIZE_WIDTH*3, 315.0/560.0*SIZE_WIDTH)];
    _scrollview.backgroundColor  = [UIColor whiteColor];
    _scrollview.bounces = NO;
    _scrollview.pagingEnabled = YES;
    
    [backgroundView addSubview:_scrollview];
    
    _pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(SIZE_WIDTH-100, 315.0/560.0*SIZE_WIDTH-20, 80, 20)];
    _pageControl.userInteractionEnabled = YES;
    
    [backgroundView addSubview:_pageControl];

    
    [self loadLunXianImage];
}

//加载 沦陷图片
- (void)loadLunXianImage{
    CGFloat imageScrollViewWidth = VIEWWIDTH;
    CGFloat imageScrollViewHeight = _scrollview.bounds.size.height;
    for (int i = 0; i < _imageARR.count; i ++) {
        UIImageView *imageview =[[UIImageView alloc]initWithFrame:CGRectMake(imageScrollViewWidth*i, 0, imageScrollViewWidth,imageScrollViewHeight)];
        //NSString * urlStr = self.lunXianImageARR[i][@"imgurl"];
        
        //        if ([urlStr hasSuffix:@"webp"]) {
        //            [imageview setZLWebPImageWithURLStr:urlStr withPlaceHolderImage:PLACEHOLDER_IMAGE];
        //        } else {
        HOmeBannerMTLModel * bannerModel = self.lunXianImageARR[i];
        //[imageview sd_setImageWithURL:[NSURL URLWithString:bannerModel.pic] placeholderImage:[UIImage imageNamed:@"icon_default2"]];
        
        //检测缓存中是否存在图片
        UIImage *myCachedImage = [[SDImageCache sharedImageCache] imageFromCacheForKey:bannerModel.pic];
        /*
         SDWebImageManager *manager = [SDWebImageManager sharedManager];
         // 取消正在下载的操作
         //[manager cancelAll];
         // 清除内存缓存
         [manager.imageCache clearMemory];
         //释放磁盘的缓存
         [manager.imageCache clearDiskOnCompletion:^{
         
         }];
         */
        if (myCachedImage) {
            NSLog(@"缓存中有图片");
            [imageview sd_setImageWithURL:[NSURL URLWithString:bannerModel.pic] placeholderImage:[UIImage imageNamed:@"icon_default2"] options:SDWebImageRefreshCached progress:^(NSInteger receivedSize, NSInteger expectedSize, NSURL * _Nullable targetURL) {
                
            } completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
                
            }];
        }
        else{
            NSLog(@"缓存中没有图片时执行方法");
            [[SDWebImageManager sharedManager].imageDownloader downloadImageWithURL:[NSURL URLWithString:bannerModel.pic] options:0 progress:^(NSInteger receivedSize, NSInteger expectedSize, NSURL * _Nullable targetURL) {
                NSLog(@"处理下载进度");
            } completed:^(UIImage * _Nullable image, NSData * _Nullable data, NSError * _Nullable error, BOOL finished) {
                if (error) {
                    NSLog(@"下载有错误");
                }
                if (image) {
                    NSLog(@"下载图片完成");
                    dispatch_async(dispatch_get_main_queue(), ^{
                        // switch back to the main thread to update your UI
                        [imageview setImage:image];
                        //[cell layoutSubviews];
                    });
                    
                    
                    [[SDImageCache sharedImageCache] storeImage:image forKey:bannerModel.pic toDisk:NO completion:^{
                        //NSLog(@"保存到磁盘中。。。。。。");
                    }];
                    //图片下载完成  在这里进行相关操作，如加到数组里 或者显示在imageView上
                }
            }];
            
        }
        
        //        }
        //NSLog(@"imageview == %@",imageview.sd_imageURL);
        
        // imageview.contentMode = UIViewContentModeScaleAspectFit;
        imageview.tag = i;
        imageview.userInteractionEnabled = YES;
        UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(photoTapped:)];
        [imageview addGestureRecognizer:singleTap];
        [self.lunXianScrollView addSubview:imageview];
        
        UIView * backview = [[UIView alloc]initWithFrame:CGRectMake(0, imageScrollViewHeight-40, imageScrollViewWidth, 38)];
        backview.backgroundColor = [UIColor blackColor];
        backview.alpha = 0.3;
        [imageview addSubview:backview];
        UILabel * nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, imageScrollViewHeight-30, 250, 16)];
        nameLabel.textColor = [UIColor whiteColor];
        nameLabel.text = bannerModel.name;
        nameLabel.font = [UIFont systemFontOfSize:13.0];
        [imageview addSubview:nameLabel];
        UILabel * subnameLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, imageScrollViewHeight-19, 250, 14)];
        subnameLabel.textColor = [UIColor whiteColor];
        //subnameLabel.text = bannerModel.subname;
        subnameLabel.text = @"ddddddd林俊杰";
        subnameLabel.font = [UIFont systemFontOfSize:10.0];
        //[imageview addSubview:subnameLabel];
    }
    self.lunXianScrollView.contentSize = CGSizeMake(imageScrollViewWidth*self.lunXianImageARR.count, 0);
    
    _pageControl.numberOfPages = self.lunXianImageARR.count;
    _pageControl.tintColor = [UIColor whiteColor];
    _pageControl.currentPageIndicatorTintColor = [UIColor redColor];
    
}
- (void)photoTapped:(UITapGestureRecognizer *)sender{
    NSLog(@"点击了第几张:%ld",sender.view.tag);
    HOmeBannerMTLModel * bannerModel = self.lunXianImageARR[sender.view.tag];
    NSString * isVIPLevel = [[NSUserDefaults standardUserDefaults] objectForKey:MEMBER_VIP_LEVEL];
    NSString * bannerVIP = [NSString stringWithFormat:@"%d",[bannerModel.vip intValue]];
    
    if ([isVIPLevel intValue] < [bannerModel.vip intValue] ) {
        if (self.delegate && [self.delegate respondsToSelector:@selector(firstSubVC:withType:withName:withKey:withIsShiKan:)]) {
            NSString * keyID = [NSString stringWithFormat:@"%@",bannerModel.id];
            [self.delegate firstSubVC:self withType:2 withName:bannerModel.name withKey:keyID withIsShiKan:YES];
        }
    }
    else{
        if (self.delegate && [self.delegate respondsToSelector:@selector(firstSubVC:withType:withName:withKey:withIsShiKan:)]) {
            NSString * keyID = [NSString stringWithFormat:@"%@",bannerModel.id];
            [self.delegate firstSubVC:self withType:2 withName:bannerModel.name withKey:keyID withIsShiKan:NO];
        }
    }
    
    //    if ([bannerVIP isEqualToString:@"1"]) {
    //        if ([isVIP isEqualToString:@"1"]) {
    //            if (self.delegate && [self.delegate respondsToSelector:@selector(firstSubVC:withType:withName:withKey:)]) {
    //                NSString * keyID = [NSString stringWithFormat:@"%@",bannerModel.id];
    //                [self.delegate firstSubVC:self withType:2 withName:bannerModel.name withKey:keyID];
    //            }
    //        }
    //        else{
    //            AlertViewCustomZL * alertZL = [[AlertViewCustomZL alloc]init];
    //            alertZL.titleName = @"需要开通VIP才能观看";
    //            alertZL.cancelBtnTitle = @"取消";
    //            alertZL.okBtnTitle = @"开通";
    //            [alertZL cancelBlockAction:^(BOOL success) {
    //                [alertZL hideCustomeAlertView];
    //            }];
    //            [alertZL okButtonBlockAction:^(BOOL success) {
    //                NSLog(@"点击了去支付按钮");
    //            }];
    //            [alertZL showCustomAlertView];
    //        }
    //
    //    }else{
    //
    //        if (self.delegate && [self.delegate respondsToSelector:@selector(firstSubVC:withType:withName:withKey:)]) {
    //            NSString * keyID = [NSString stringWithFormat:@"%@",bannerModel.id];
    //            [self.delegate firstSubVC:self withType:2 withName:bannerModel.name withKey:keyID];
    //        }
    //    }
    
    
    
}


#pragma mark ScrollViewDelegate 方法
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{

//NSLog(@"执行了scrollViewDidScroll方法");
    if (scrollView == self.lunXianScrollView) {
    NSInteger i = scrollView.contentOffset.x/scrollView.frame.size.width + 1;
        _pageControl.currentPage = i - 1;
    }
    
}
//定时任务方法调用：（注意计算好最后一页循环滚动）

-(void)handleSchedule{
    
    _pageControl.currentPage++;
    if(_Tend){
        
        [self.lunXianScrollView setContentOffset:CGPointMake(0, 0) animated:YES];
        
        _pageControl.currentPage=0;
        
        
    }else{
        
        [self.lunXianScrollView  setContentOffset:CGPointMake(_pageControl.currentPage*SIZE_WIDTH, 0) animated:YES];
        
    }
    
    if (_pageControl.currentPage==_pageControl.numberOfPages-1) {
        
        _Tend=YES;
        
    }else{
        
        _Tend=NO;
        
    }
    
}
#pragma end mark

@end
