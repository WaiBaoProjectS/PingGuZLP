//
//  goTojudgeViewController.h
//  PinGu
//
//  Created by 张小东 on 2017/9/24.
//  Copyright © 2017年 张小东. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GotojudgeView.h"
#import "SubjectModel.h"
#import "ItemPOModel.h"

@interface goTojudgeViewController : UIViewController
@property(nonatomic,copy)NSString*listID;
@property(nonatomic,strong)UIView*BGheaderView;

@property(nonatomic,strong)GotojudgeView*viewss;
@property (nonatomic, strong) NSMutableArray *leftSubjectARR;

@end
