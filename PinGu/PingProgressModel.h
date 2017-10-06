//
//  PingProgressModel.h
//  PinGu
//
//  Created by apple on 2017/10/6.
//  Copyright © 2017年 张小东. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SubjectModel.h"
#import "ItemPOModel.h"
#import "TypePOModel.h"
@class PingProgressSingleSubjectModel;

@interface PingProgressModel : NSObject

@property (nonatomic, strong) NSArray<SubjectModel *> *allSubjectARR;

+ (instancetype)sharePingProgressModel;
- (BOOL)pingGuProgreesWithSingleSubject:(id)subject withSingleType:(id)types withCurrentSubjectIndex:(NSInteger)index withPPSingleSubjectModel:(PingProgressSingleSubjectModel*) currentSubModel;

@end


@interface PingProgressSingleSubjectModel : NSObject

@property (nonatomic, assign) NSInteger allTiMuNumber;
@property (nonatomic, strong) NSMutableArray *allReasonArr;



@end
