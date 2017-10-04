//
//  TypePOModel.h
//  PinGu
//
//  Created by apple on 2017/10/4.
//  Copyright © 2017年 张小东. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TypePOModel : NSObject

@property (nonatomic, copy) NSString *evaluationId;
@property (nonatomic, strong) NSArray *evaluationItemPOList;
@property (nonatomic, copy) NSString *evaluationSubjectId;
@property (nonatomic, copy) NSString *id;
@property (nonatomic, copy) NSString *name;

@end
