//
//  userInfo.h
//  taitaigouUser
//
//  Created by yons on 16/2/29.
//  Copyright © 2016年 xiaojiang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
@interface userInfo : NSObject
@property (nonatomic, strong)NSDictionary *userInfoDic;


/**获取登录用户基本信息*/
+ (NSDictionary *) getLoginedUserProfile;
+ (NSString *) getPhone;
+ (NSString *) getUserID;
+ (NSString *) getImagurl;//用户头像
+ (void)setHeadImage:(NSString *)image_url;
- (void)setUserInfoDic:(NSDictionary *)userInfoDic;
- (void)clear;
/**是否已经登录*/
+ (BOOL) isLogined;
+ (void)clearInfo;


@end
