//
//  SubjectModel.h
//  PinGu
//
//  Created by apple on 2017/10/3.
//  Copyright © 2017年 张小东. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SubjectModel : NSObject

@property (nonatomic, copy) NSString *createBy;
@property (nonatomic, copy) NSString *createTime;
@property (nonatomic, copy) NSString *deleted;
@property (nonatomic, copy) NSString *evaluationId;
@property (nonatomic, copy) NSString *evaluationSubjectId;
@property (nonatomic, strong) NSArray *evaluationTypePOList;
@property (nonatomic, copy) NSString *id;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *rowVersion;

//已完成的统计
@property (nonatomic, strong) NSMutableArray *finishedTypePOList;
@property (nonatomic, assign) BOOL isFinished;



@end
