//
//  MGHTTPSessionManager.m
//  jia
//
//  Created by 张小东 on 17/1/17.
//  Copyright © 2017年 TonyMcGrady. All rights reserved.
//

#import "MGHTTPSessionManager.h"
static MGHTTPSessionManager *_shareInstance;
static dispatch_once_t onceToken;

@implementation MGHTTPSessionManager
+ (instancetype)shareNetWorkingTools{
    dispatch_once(&onceToken, ^{
        _shareInstance = [[MGHTTPSessionManager alloc] init];
         _shareInstance.requestSerializer.timeoutInterval = 30.0f;//延迟时间
        AFJSONResponseSerializer *serializer = [AFJSONResponseSerializer serializer];
       // AFJSONRequestSerializer*Rserializer=[AFJSONRequestSerializer serializer];
        [serializer setRemovesKeysWithNullValues:NO];
        [_shareInstance setResponseSerializer:serializer];
        _shareInstance.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html",@"text/plain", nil];
    });
    return _shareInstance;

}

@end
