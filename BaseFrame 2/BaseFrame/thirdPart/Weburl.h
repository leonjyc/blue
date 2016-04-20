//
//  Loginuserinfo.h
//  Urchinradio
//
//  Created by yons on 15/8/14.
//  Copyright (c) 2015年 jyc All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIColor+Hex.h"
#import "NSString+Extension.h"
#define KScreenWidth [UIScreen mainScreen].bounds.size.width
#define KScreenHeight [UIScreen mainScreen].bounds.size.height
#define IPAddress @"http://hyw1709000001.my3w.com/Server/"
#define memberhelperAPI @"/tools/app_api.ashx?"
#define backColor [UIColor colorWithHexString:@"#79bcf6"]
#define gColor  [UIColor colorWithHexString:@"#38c6a0"]
#define hexColor(s) [UIColor colorWithHexString:s]
#define color(s) [UIColor s]
#define img(s) [UIImage imageNamed:s]
#define FONT(s)  [UIFont fontWithName:@"FZLanTingHeiS-EL-GB" size:s]
#import "MBProgressHUD+MJ.h"
#import "MJRefresh.h"
#import "JSONKit.h"
#import "GzwTableViewLoading.h"
#import "AsynImageView.h"
#import "GUAAlertView.h"
#import "UIImageView+WebCache.h"
#define FileName @"user.plist"
#define getHeight(s) s.frame.origin.y + s.frame.size.height
#define getWidth(s) s.frame.origin.x + s.frame.size.width
#define getx(s) s.frame.origin.x
#define gety(s) s.frame.origin.yre
#define widths(s) s.frame.size.width
#define height(s) s.frame.size.height
#define DBNAME    @"commodityinfo.sqlite"
#import "CellBtn.h"
#import "CALayer+Transition.h"
#import "BaseTextField.h"
#define WS(weakSelf)  __weak __typeof(&*self)weakSelf = self;
@interface Loginuserinfo : NSObject


@end
