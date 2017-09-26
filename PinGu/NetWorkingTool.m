//
//  NetWorkingTool.m
//  jia
//
//  Created by 张小东 on 17/1/17.
//  Copyright © 2017年 TonyMcGrady. All rights reserved.
//

#import "NetWorkingTool.h"
#import "MGHTTPSessionManager.h"
//#import <AFNetworking.h>
#import "AFNetworking.h"
//#import "UserMessageManager.h"
@interface NetWorkingTool ()

@end
@implementation NetWorkingTool
//将NSDictionary中的Null类型的项目转化成@""
+(NSDictionary *)nullDic:(NSDictionary *)myDic
{
    NSArray *keyArr = [myDic allKeys];
    NSMutableDictionary *resDic = [[NSMutableDictionary alloc]init];
    for (int i = 0; i < keyArr.count; i ++)
    {
        id obj = [myDic objectForKey:keyArr[i]];
        
        obj = [self changeType:obj];
        
        [resDic setObject:obj forKey:keyArr[i]];
    }
    return resDic;
}
//将NSDictionary中的Null类型的项目转化成@""
+(NSArray *)nullArr:(NSArray *)myArr
{
    NSMutableArray *resArr = [[NSMutableArray alloc] init];
    for (int i = 0; i < myArr.count; i ++)
    {
        id obj = myArr[i];
        
        obj = [self changeType:obj];
        
        [resArr addObject:obj];
    }
    return resArr;
}

//将NSString类型的原路返回
+(NSString *)stringToString:(NSString *)string
{
    return string;
}

//将Null类型的项目转化成@""
+(NSString *)nullToString
{
    return @"";
}
#pragma mark - 公有方法
//类型识别:将所有的NSNull类型转化成@""
+(id)changeType:(id)myObj
{
    if ([myObj isKindOfClass:[NSDictionary class]])
    {
        return [self nullDic:myObj];
    }
    else if([myObj isKindOfClass:[NSArray class]])
    {
        return [self nullArr:myObj];
    }
    else if([myObj isKindOfClass:[NSString class]])
    {
        return [self stringToString:myObj];
    }
    else if([myObj isKindOfClass:[NSNull class]])
    {
        return [self nullToString];
    }
    else
    {
        return myObj;
    }
}
/*
 *  封装get请求
 *
 *  @param URL        请求地址
 *  @param parameters 请求参数
 *  @param success    成功回调
 *  @param failure    失败回调
 */
+ (void)getWithURL:(NSString *)URL parameters:(NSMutableDictionary *)parameters success:(void (^)(id json))success failure:(void (^)(NSError *))failure{
    //创建请求管理对象
    MGHTTPSessionManager *manager = [MGHTTPSessionManager shareNetWorkingTools];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html",@"text/plain", nil];
    //NSLog(@"token:%@",[UserMessageManager sharedManager].userToken);
    //[manager.requestSerializer setValue:[UserMessageManager sharedManager].userToken forHTTPHeaderField:@"token"];
//[manager.requestSerializer setValue:[UserMessageManager sharedManager].userToken forHTTPHeaderField:@"hash"];

    [manager GET:URL parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        responseObject = [NetWorkingTool changeType:responseObject];
        success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {

        failure(error);
    }];
}
/**
 *  封装post请求
 *
 *  @param URL        请求地址
 *  @param parameters 请求参数
 *  @param success    成功回调
 *  @param failure    失败回调
 */

+ (void)postWithURL:(NSString *)URL parameters:(NSDictionary *)parameters LX:(NSString*)lsjson success:(void (^)(id json))success failure:(void (^)(NSError *))failure {
    
    //     创建请求管理对象
    MGHTTPSessionManager *manager = [MGHTTPSessionManager shareNetWorkingTools];
    if ([lsjson isEqualToString:@"1"]==YES) {
        manager.requestSerializer=[AFJSONRequestSerializer serializer];
    }
    
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html",@"text/plain", nil];
    //[manager.requestSerializer setValue:[UserMessageManager sharedManager].userToken forHTTPHeaderField:@"token"];

    //     发送请求
    [manager POST:URL parameters:parameters success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            //成功
            responseObject = [NetWorkingTool changeType:responseObject];

            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (error) {
            //失败
            failure(error);
        }
    }];
    
}

/**
 *  封装带文件的POST请求(可用于工程管家图片上传)
 *
 *  @param URL        请求地址
 *  @param parameters 请求参数
 *  @param dataArray  上传内容数组
 *  @param success    成功回调
 *  @param failure    失败回调
 */
+ (void)postWithURL:(NSString *)URL parameters:(NSMutableDictionary *)parameters fromDataArray:(NSArray *)dataArray success:(void (^)(id json))success failure:(void (^)(NSError *))failure{
    // 1.创建请求管理对象
    MGHTTPSessionManager *manager = [MGHTTPSessionManager shareNetWorkingTools];
    
    // 2.发送请求
    
    [manager POST:URL parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        for (NetWorkData *formDatas in dataArray) {
            [formData appendPartWithFileData:formDatas.data name:formDatas.name fileName:formDatas.filename mimeType:formDatas.mimeType];
        }
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
        //YJLog(@"%@",uploadProgress);
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        if (success) {
            
            success(responseObject);
            
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        if (error) {
            
            failure(error);
        }
    }];
}

@end
/**
 *  用来封装文件数据的模型
 */
@implementation NetWorkData
@end
