//
//  RollViewZL.m
//  PinGu
//
//  Created by apple on 2017/10/4.
//  Copyright © 2017年 张小东. All rights reserved.
//

#import "RollViewZL.h"


@implementation RollViewZL{
    BOOL _Tend;//pageControl
    UIScrollView * _scrollview;
    UIPageControl * _pageControl;
    NSMutableArray * _imageARR;
    NSInteger  _tapIndex;
    NSInteger _currentIndex;
    NSInteger _currentRollIndex;//题目视图的Index
    NSInteger _oldRollIndex;
    UIView * _backgroundView;
    UIView * _scoreView;
    UITextView * _kouTextView;
    PPNumberButton * _numButton;
}

/*
     [NSTimer scheduledTimerWithTimeInterval:5 target:self selector:@selector(handleSchedule) userInfo:nil repeats:YES];
 */

- (instancetype)initRoll{

    self = [super init];
    if (self) {
        
        UILabel * pingLabel = [UILabel new];
        pingLabel.font = [UIFont systemFontOfSize:20.0f];
        pingLabel.text = @"评估内容：";
        pingLabel.backgroundColor = [UIColor whiteColor];
        [self addSubview:pingLabel];
        [pingLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.mas_top).offset(10.0f);
            make.left.mas_equalTo(self.mas_left).offset(10.0);
            make.size.mas_equalTo(CGSizeMake(120, 30));
        }];
        
        self.userInteractionEnabled = YES;
        _backgroundView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, 315.0/560.0*self.frame.size.width)];
        _backgroundView.backgroundColor = [UIColor grayColor];
        _scrollview = [UIScrollView new];
        _scrollview.delegate = self;
        _scrollview.showsVerticalScrollIndicator = YES;
        _scrollview.showsHorizontalScrollIndicator = YES;
        //[self.lunXianScrollView setContentSize:CGSizeMake(SIZE_WIDTH*3, 315.0/560.0*SIZE_WIDTH)];
        _scrollview.backgroundColor  = [UIColor whiteColor];
        _scrollview.bounces = NO;
        _scrollview.pagingEnabled = YES;
        //_scrollview.contentSize = CGSizeMake(1000, 200);
        [self addSubview:_scrollview];
        //[self addSubview:_backgroundView];
        
        [_scrollview mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.mas_left);
            make.right.mas_equalTo(self.mas_right);
            make.top.mas_equalTo(pingLabel.mas_bottom);
//            make.height.mas_equalTo(210.0f);
            make.bottom.mas_equalTo(self.mas_bottom);
        }];

//        NSLog(@"初始化_scrollView的frame值为：%g---%g", self.bounds.size.width, _scrollview.bounds.size.height);

    }
    return self;
}
/**
 *==========ZL注释start===========
 *1.加载沦陷视图
 *
 *2.返回点击Block
 *3.返回当前视图Index
 *4.
 ===========ZL注释end==========*/
- (void)loadTopLunXianViewWithSuperView:(id)sView withImageARR:(NSMutableArray *)imageARR withRollType:(ROLL_TYPE)rollType withTapViewAction:(void (^)(NSInteger))tapActionBlcok withCurrentIndex:(CurrentIndexBlock)currentIndexBlock{

    _imageARR = imageARR;
    NSLog(@"右边传入的数组个数：%ld",_imageARR.count);
    self.currentBlock = currentIndexBlock;
    switch (rollType) {
        case IMAGEVIEW_ROLL:
            [self loadLunXianImage];
            break;
        case LABEL_ROLL:
            [self loadLabelRoll];
            break;
        default:
            break;
    }
}

/**
 *==========ZL注释start===========
 *1.加载文字轮显
 *
 *2.
 *3.
 *4.
 ===========ZL注释end==========*/
- (void)loadLabelRoll{
    
    for (UIView *view in _scrollview.subviews) {
        [view removeFromSuperview];
    }
    if (_imageARR.count < 1) {
        return;
    }
    
//    _scrollview.contentOffset = CGPointMake(0, 0);
    [_scrollview setContentOffset:CGPointMake(0, 0) animated:NO];
    _currentIndex = 0;
    self.currentBlock(_currentIndex);
    CGFloat imageScrollViewWidth = VIEWWIDTH;
    CGFloat imageScrollViewHeight = _scrollview.bounds.size.height;
    for (int i = 0; i < _imageARR.count; i ++) {
    
        ItemPOModel * model = _imageARR[i];
        
        //

        NSString * contentString = [NSString stringWithFormat:@"%@ (%@分)",model.content,model.score];
        
        UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(imageScrollViewWidth * i + 10, 0, imageScrollViewWidth-20.0,120)];
        label.numberOfLines = 0;
        label.minimumScaleFactor = 0.5;
        label.adjustsFontSizeToFitWidth = YES;
        label.font = [UIFont systemFontOfSize:17.0f];
        label.text = contentString;
        label.tag = i;
        label.userInteractionEnabled = YES;
        UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(photoTapped:)];
        [label addGestureRecognizer:singleTap];
        
        [_scrollview addSubview:label];
        
        
        NSString * remarkStr = [NSString stringWithFormat:@"*备注说明：%@",model.remark];
        UILabel * remarkLabel = [[UILabel alloc]initWithFrame:CGRectMake(imageScrollViewWidth * i+10, 120, imageScrollViewWidth-20.0, 80)];
        remarkLabel.adjustsFontSizeToFitWidth = YES;
        remarkLabel.minimumScaleFactor = 0.5f;
        remarkLabel.numberOfLines = 0;
        remarkLabel.font = [UIFont systemFontOfSize:14.0f];
        remarkLabel.text = remarkStr;
        [_scrollview addSubview:remarkLabel];
        
//        [label mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.top.mas_equalTo(_scrollview.mas_top).offset(20.0f);
//            make.left.mas_equalTo(_scrollview.mas_left).offset(10.0+i*imageScrollViewWidth);
//            make.width.mas_equalTo(imageScrollViewWidth-20.0);
//            make.bottom.mas_equalTo(_scrollview.mas_bottom);
//        }];
        
        UIView * backView = [UIView new];
        backView.backgroundColor = [UIColor colorWithHexString:LightGrayColor_ZL_TIJIAO];
        [_scrollview addSubview:backView];
        [backView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(_scrollview.mas_top).offset(210.0f);
            make.left.mas_equalTo(_scrollview.mas_left).offset(imageScrollViewWidth * i + 10.0f);
            make.width.mas_equalTo(imageScrollViewWidth-20.0);
//            make.height.mas_equalTo(@300);
            //make.right.mas_equalTo(_scrollview.mas_right).offset(imageScrollViewWidth * i - 10.0f);
            make.bottom.mas_equalTo(self.mas_bottom).offset(-10.0f);
        }];
        
        
        UIImageView * logo1Image = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"评估结果"]];
        [backView addSubview:logo1Image];
        
        [logo1Image mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(backView).offset(-60);
            make.top.mas_equalTo(backView.mas_top).offset(10);
            make.size.mas_equalTo(CGSizeMake(24, 24));
        }];
        
        UILabel * titleLabel = [UILabel new];
        titleLabel.text = @"评估结果";
        titleLabel.font = [UIFont systemFontOfSize:20.0f];
        
        [backView addSubview:titleLabel];
        
        [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(logo1Image.mas_right).offset(10.0f);
            make.top.mas_equalTo(backView.mas_top).offset(10);
            make.size.mas_equalTo(CGSizeMake(120, 30));
        }];
        
        
        UILabel * deFenLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, 100, 70, 30)];
        deFenLabel.text = @"得分情况:";
        deFenLabel.font = [UIFont systemFontOfSize:14.0];
        UILabel * kouFenLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, 150, 100, 30)];
        kouFenLabel.text = @"扣分原因(必填):";
        kouFenLabel.font = [UIFont systemFontOfSize:14.0];
        
        [backView addSubview:deFenLabel];
        [backView addSubview:kouFenLabel];
        
        PPNumberButton *numButtons = [PPNumberButton numberButtonWithFrame:CGRectMake(100, 100, 110, 30)];
        // 开启抖动动画
        numButtons.shakeAnimation = YES;
        //        // 设置最小值
        //        _numButton.minValue = 0;
        //        // 设置最大值
        //        _numButton.maxValue = 5;
        // 设置输入框中的字体大小
        numButtons.inputFieldFont = 23;
        numButtons.increaseTitle = @"＋";
        numButtons.decreaseTitle = @"－";
        
        NSString * score = model.score;
        int maxInt = [score intValue];
        float maxFloat = [score floatValue];
        
//        NSLog(@"maxInt-maxFloat：%d---%g",maxInt,maxFloat);
        if (maxInt == maxFloat) {
//            NSLog(@"maxInt == maxFloat相同");
            // 设置最小值
            numButtons.minValue = 0;
            // 设置最大值
            numButtons.maxValue = maxInt;
        }
        else{
            NSLog(@"maxInt == maxFloat不同");
            // 设置最小值
            numButtons.minValue = 0;
            // 设置最大值
            numButtons.maxValue = maxFloat *10;
        }
        
        numButtons.numberBlock = ^(NSString *num){
//            NSLog(@"当前题目评分为：%@",num);
            
            [model setPingFen:num];
            
            
        };
        
        if (model.pingFen != nil) {
            [numButtons setCurrentNumber:model.pingFen];
        }
        

        
        [backView addSubview:numButtons];
        
        UITextView * textViews = [UITextView new];
        textViews.delegate = self;
        textViews.tag = i;
        textViews.backgroundColor = [UIColor whiteColor];
        [backView addSubview:textViews];
        if (model.kouReason != nil) {
            textViews.text = model.kouReason;
        }
        [textViews mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(kouFenLabel.mas_top);
            make.left.mas_equalTo(kouFenLabel.mas_right).offset(10);
            make.right.mas_equalTo(backView).offset(-20.0f);
            make.bottom.mas_equalTo(backView).offset(-20.0f);
        }];
        
    }
    
    _scrollview.contentSize = CGSizeMake(imageScrollViewWidth * _imageARR.count, imageScrollViewHeight);
   
//    NSLog(@"_scrollView的frame值为：%g---%g-----%g-------%g", _scrollview.bounds.size.width, _scrollview.bounds.size.height,_scrollview.contentSize.width,_scrollview.contentSize.height);
    
}


/**
 *==========ZL注释start===========
 *1.加载图片轮显
 *
 *2.
 *3.
 *4.
 ===========ZL注释end==========*/
- (void)loadLunXianImage{

    
}

- (void)photoTapped:(UITapGestureRecognizer *)sender{
    NSLog(@"点击了第几张:%ld",sender.view.tag);
}


#pragma mark ScrollViewDelegate 方法
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{

//NSLog(@"执行了scrollViewDidScroll方法");
    if (scrollView == _scrollview) {
        NSInteger i = scrollView.contentOffset.x/scrollView.frame.size.width + 1;
        _pageControl.currentPage = i - 1;
        _currentRollIndex = i - 1;
        //self.currentBlock(i-1);
    }
    
}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{
//    NSLog(@"结束动画");
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
//    NSLog(@"结束结束当前页数：%ld---上一次页面：%ld",_currentRollIndex,_oldRollIndex);
    if (_currentRollIndex == _oldRollIndex) {
        
        
    }
    else{
        self.currentBlock(_currentRollIndex);
        
//        ItemPOModel * bannerModel = _imageARR[_currentRollIndex];
//        NSString * score = bannerModel.score;
//        int maxInt = [score intValue];
//        float maxFloat = [score floatValue];
//        
//        NSLog(@"maxInt-maxFloat：%d---%g",maxInt,maxFloat);
//        if (maxInt == maxFloat) {
//            NSLog(@"maxInt == maxFloat相同");
//                    // 设置最小值
//                    _numButton.minValue = 0;
//                    // 设置最大值
//                    _numButton.maxValue = maxInt;
//        }
//        else{
//            NSLog(@"maxInt == maxFloat不同");
//                    // 设置最小值
//                    _numButton.minValue = 0;
//                    // 设置最大值
//                    _numButton.maxValue = maxFloat *10;
//        }

        
        _oldRollIndex = _currentRollIndex;
        
        
    }

    
}
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{

    //NSLog(@"结束拖拽");
}
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    //NSLog(@"开始拖拽");
}

//定时任务方法调用：（注意计算好最后一页循环滚动）

-(void)handleSchedule{
    
    _pageControl.currentPage++;
    if(_Tend){
        
        [_scrollview setContentOffset:CGPointMake(0, 0) animated:YES];
        
        _pageControl.currentPage = 0;
        
        
    }else{
        
        [_scrollview  setContentOffset:CGPointMake(_pageControl.currentPage * SIZE_WIDTH, 0) animated:YES];
        
    }
    
    if (_pageControl.currentPage == _pageControl.numberOfPages - 1) {
        
        _Tend=YES;
        
    }else{
        
        _Tend=NO;
        
    }
    
}
#pragma end mark

#pragma mark ===================textViewDelegate方法==================
- (void)textViewDidChange:(UITextView *)textView{

    //NSLog(@"textView改变内容");
    
}

- (void)textViewDidEndEditing:(UITextView *)textView{

    ItemPOModel * model = _imageARR[textView.tag];
    [model setKouReason:textView.text];
    if (textView.text.length > 0 && ![textView.text isEqualToString:@""] && textView.text != nil) {

        NSLog(@"textView的内容为：%@",textView.text);
        [self xw_postNotificationWithName:TextViewChangeNotifications userInfo:@{@"text":textView.text}];
    }
    else{
        NSLog(@"textView为空");
        [self xw_postNotificationWithName:TextViewChangeNotifications userInfo:@{@"text":@"delete"}];
        
    }

    //NSLog(@"textView编辑结束");
}
- (BOOL)textViewShouldEndEditing:(UITextView *)textView{
    //NSLog(@"结束编辑，返回YES");
    return YES;
}



#pragma mark ===================设置当前页面的Block==================
- (void)setCurrentIndexBlocksWith:(CurrentIndexBlock)block{
    self.currentBlock = block;
}

@end
