//
//  PingProgressModel.m
//  PinGu
//
//  Created by apple on 2017/10/6.
//  Copyright © 2017年 张小东. All rights reserved.
//

#import "PingProgressModel.h"

static PingProgressModel *_shareInstance = nil;
static dispatch_once_t onceToken;

@implementation PingProgressModel


+ (instancetype)sharePingProgressModel{

    dispatch_once(&onceToken, ^{
        _shareInstance = [[PingProgressModel alloc]init];
    });
    return _shareInstance;
}

- (BOOL)pingGuProgreesWithSingleSubject:(id)subject withSingleType:(id)types withCurrentSubjectIndex:(NSInteger)index withPPSingleSubjectModel:(PingProgressSingleSubjectModel *)currentSubModel{
    BOOL result = false;
    
    
    
    return result;
}

- (NSArray *)allSubjectARR{

    if (!_allSubjectARR) {
        _allSubjectARR = [NSArray new];
    }
    return _allSubjectARR;
}

@end

@implementation PingProgressSingleSubjectModel

- (NSMutableArray *)allReasonArr{
    if (!_allReasonArr) {
        _allReasonArr = [NSMutableArray new];
    }
    return _allReasonArr;
}

@end
