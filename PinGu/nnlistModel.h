//
//  nnlistModel.h
//  PinGu
//
//  Created by 张小东 on 2017/9/23.
//  Copyright © 2017年 张小东. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface nnlistModel : NSObject
@property(nonatomic,copy)NSString*mID;//
@property(nonatomic,copy)NSString*postcode;//
@property(nonatomic,copy)NSString*type;//
@property(nonatomic,copy)NSString*rowVersion;//
@property(nonatomic,copy)NSString*address;//
@property(nonatomic,copy)NSString*contacts;//
@property(nonatomic,copy)NSString*contactsPhone;//
@property(nonatomic,copy)NSString*name;//
@property(nonatomic,copy)NSString*institutionSiteName;//

@property (nonatomic, copy) NSString * evaluationId;
@property(nonatomic,copy)NSString*institutionSiteId;

@property(nonatomic,copy)NSString*evaluated;

@end
