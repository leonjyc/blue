//
//  httpPostRequest.h
//  ttg
//
//  Created by yons on 16/2/29.
//  Copyright © 2016年 xiaojiang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface httpPostRequest : NSObject
typedef void (^requestBlock)(NSDictionary *dic);
typedef void (^errorBlock)(NSDictionary *dic);
typedef void (^GetDataDidFinishBlock)(id model,NSError *error);
+(void)getDataByPostAshx:(NSString *)ashx and:(NSDictionary *)parameter withFinishBlock:(GetDataDidFinishBlock)finishBlock;
+(void)asiGetDataPost:(NSDictionary *)parameter withFinishBlock:(GetDataDidFinishBlock)finishBlock;
@property (copy, nonatomic)requestBlock block;
@property (copy, nonatomic)errorBlock errblock;
@end
