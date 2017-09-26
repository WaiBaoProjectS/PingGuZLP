//
//  NetWorkingTool.h
//  jia
//
//  Created by 张小东 on 17/1/17.
//  Copyright © 2017年 TonyMcGrady. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NetWorkingTool : NSObject
/*
 *  封装get请求
 *
 *  @param URL        请求地址
 *  @param parameters 请求参数
 *  @param success    成功回调
 *  @param failure    失败回调
 */

+ (void)getWithURL:(NSString *)URL parameters:(NSMutableDictionary *)parameters  success:(void (^)(id json))success failure: (void (^)(NSError *error))failure;



/**
 *  封装post请求
 *
 *  @param URL        请求地址
 *  @param parameters 请求参数
 *  @param success    成功回调
 *  @param failure    失败回调
 */
+ (void)postWithURL:(NSString *)URL parameters:(NSDictionary *)parameters LX:(NSString*)lsjson success:(void (^)(id json))success failure:(void (^)(NSError *error))failure;





/**
 *  封装带文件的POST请求(可用于工程管家图片上传)
 *
 *  @param URL        请求地址
 *  @param parameters 请求参数
 *  @param dataArray  上传内容数组
 *  @param success    成功回调
 *  @param failure    失败回调
 */
+ (void)postWithURL:(NSString *)URL parameters:(NSMutableDictionary *)parameters fromDataArray:(NSArray *)dataArray success:(void (^)(id json))success failure:(void (^)(NSError *))failure;
@end

@interface NetWorkData : NSObject
/** 文件数据 */
@property(nonatomic, strong)NSData *data;
/** 参数名 */
@property (nonatomic, copy) NSString *name;
/** 文件名 */
@property (nonatomic, copy) NSString *filename;
/** 文件类型 */
@property (nonatomic, copy) NSString *mimeType;

@end
