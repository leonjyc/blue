//
//  userInfo.m
//  taitaigouUser
//
//  Created by yons on 16/2/29.
//  Copyright © 2016年 xiaojiang. All rights reserved.
//

#import "userInfo.h"
@interface userInfo()

@end
@implementation userInfo

+ (NSString *) getPhone{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSDictionary *info = [defaults objectForKey:@"userInfoDic"];
    NSString *mobile = [NSString stringWithFormat:@"%@",[info objectForKey:@"cTel"]];
    if (mobile.length < 11) {
        mobile = @"";
    }
    return mobile;
}

+ (void)setDefaultAddress:(NSString *)defaultAddress{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:defaultAddress forKey:@"homeDefaultAddress"];
}
+ (NSDictionary *) getLoginedUserProfile{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSDictionary *info = [defaults objectForKey:@"userInfoDic"];
    return info;
}
+ (NSString *) getUserID{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSDictionary *info = [defaults objectForKey:@"userInfoDic"];
    NSString *userID = [NSString stringWithFormat:@"%@",[info objectForKey:@"Id"]];
    return userID;
}
+ (NSString *) getImagurl{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *headImageUrl = [defaults objectForKey:@"headImageUrl"];
    if ([headImageUrl isEqualToString:@"(null)"] || headImageUrl == nil) {
        headImageUrl = @"";
    }
    return headImageUrl;
}

+ (void)setHeadImage:(NSString *)image_url{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:image_url forKey:@"headImageUrl"];
}

- (void)setHeadImage:(NSString *)image_url{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:image_url forKey:@"headImageUrl"];
}


- (void)setUserInfoDic:(NSDictionary *)userInfoDic{
    [self clear];
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
    for (int i = 0; i < [userInfoDic allKeys].count; i++) {
        NSString *key = [[userInfoDic allKeys] objectAtIndex:i];
        NSString *value = [NSString stringWithFormat:@"%@",[userInfoDic objectForKey:key]];
        if ([value isEqualToString:@"<null>"]) {
            value = @"";
        }
        if ([key isEqualToString:@"cPhoto"]) {
            [self setHeadImage:value];
            NSLog(@"headImage  %@",value);
        }
        [dic setObject:value forKey:key];
    }
    NSLog(@"userInfoDic %@",dic);
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:dic forKey:@"userInfoDic"];
    [defaults synchronize];
}
- (void)clear{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults removeObjectForKey:@"userInfoDic"];
    [defaults removeObjectForKey:@"headImageUrl"];
    [defaults removeObjectForKey:@"shopID"];
    [defaults removeObjectForKey:@"defaultAddress"];
    [defaults removeObjectForKey:@"homeDefaultAddress"];
    [defaults synchronize];
}
+ (void)clearInfo{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults removeObjectForKey:@"userInfoDic"];
    [defaults removeObjectForKey:@"headImageUrl"];
    [defaults removeObjectForKey:@"shopID"];
    [defaults removeObjectForKey:@"defaultAddress"];
    [defaults removeObjectForKey:@"homeDefaultAddress"];
    [defaults synchronize];
}
+ (BOOL) isLogined{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSDictionary *info = [defaults objectForKey:@"userInfoDic"];
    NSString *mobile = [NSString stringWithFormat:@"%@",[info objectForKey:@"cTel"]];
    return mobile.length > 10;
}


@end
