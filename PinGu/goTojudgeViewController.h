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
#import "RollViewZL.h"
#import "TypePOModel.h"
#import "ADDPhoneView.h"
#import "RITLPhotos.h"
#import "UploadImageZL.h"
#import "PingProgressModel.h"
#import "nnlistModel.h"

@interface goTojudgeViewController : UIViewController<UINavigationControllerDelegate,UIImagePickerControllerDelegate>
@property(nonatomic,copy)NSString*listID;
@property(nonatomic,strong)UIView*BGheaderView;

@property(nonatomic,strong)GotojudgeView*viewss;
@property (nonatomic, strong) NSMutableArray *leftSubjectARR;
@property (nonatomic, strong) NSArray<UIImage *> *imageARR;
@property (nonatomic, strong) NSMutableDictionary  *finishedPingItemsDic;
@property (nonatomic, strong) NSMutableArray * allFinishedItemARR;
@property (nonatomic, strong) nnlistModel *jiGouModelB;


@end
