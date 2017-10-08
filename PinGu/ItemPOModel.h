//
//  ItemPOModel.h
//  PinGu
//
//  Created by apple on 2017/10/3.
//  Copyright © 2017年 张小东. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ItemPOModel : NSObject

@property (nonatomic, copy) NSString *content;
@property (nonatomic, copy) NSString *evaId;
@property (nonatomic, copy) NSString *evaSubjectId;
@property (nonatomic, copy) NSString *evaluationTypeId;
@property (nonatomic, copy) NSString *id;
@property (nonatomic, copy) NSString *remark;
@property (nonatomic, copy) NSString *score;

@property (nonatomic, copy) NSString *evaSubjectName;
@property (nonatomic, copy) NSString *evaTypeName;


//已完成的统计
@property (nonatomic, copy) NSString *kouReason;
@property (nonatomic, copy) NSString *pingFen;
@property (nonatomic, assign) BOOL isItemFinished;

@end

@interface ImageURLModelUP : NSObject

@property (nonatomic, copy) NSString *downUrl;
@property (nonatomic, copy) NSString *id;
@property (nonatomic, copy) NSString *url;

@end
