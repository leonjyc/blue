//
//  AppDelegate.m
//  BaseFrame
//
//  Created by yons on 16/4/11.
//  Copyright © 2016年 xiaojiang. All rights reserved.
//

#import "AppDelegate.h"
#import "LogiinRegisterViewController.h"
#import "TAdLaunchImageView.h"
#import "UIView+TYLaunchAnimation.h"
#import "TYLaunchFadeScaleAnimation.h"
#import "UIImage+TYLaunchImage.h"
#import "IQKeyboardManager.h"
#import "CocoaLumberjack.h"
#import "JRSwizzle.h"
#import "NSDictionary+Unicode.h"
#import "PassengerTabbarViewController.h"
static const DDLogLevel ddLogLevel = DDLogLevelVerbose;
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    [NSDictionary jr_swizzleMethod:@selector(description) withMethod:@selector(my_description) error:nil];
    //状态栏白色
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    if ([userInfo isLogined]) {
        NSDictionary *dic = [userInfo getLoginedUserProfile];
        NSString *USerType = [dic objectForKey:@"USerType"];
        UIViewController *currentViewController;
        switch ([USerType intValue]) {
            case 1:
            {
            
            }
                break;
            case 2:
            {
                
            }
                break;
            case 3:
            {
                
            }
                break;
            case 4:
            {
                
            }
                break;
            case 5:
            {
                PassengerTabbarViewController *t = [[PassengerTabbarViewController alloc] init];
                t.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
                currentViewController = t;
            }
                break;
                
            default:
                break;
        }
        self.window.rootViewController = currentViewController;
    }
    else{
        self.window.rootViewController = [LogiinRegisterViewController new];
    }
    
    TAdLaunchImageView *adLaunchImageView = [[TAdLaunchImageView alloc]initWithImage:[UIImage ty_getLaunchImage]];
    adLaunchImageView.URLString = @"1.jpg";
    [[UIApplication sharedApplication] setStatusBarHidden:NO];
//    [adLaunchImageView showInWindowWithAnimation:[TYLaunchFadeScaleAnimation fadeAnimationWithDelay:5.0] completion:^(BOOL finished) {
//        
//        [[UIApplication sharedApplication] setStatusBarHidden:NO];
//        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
//        NSLog(@"finished");
//        
//        
//    }];
    //IQ键盘
    IQKeyboardManager *manager = [IQKeyboardManager sharedManager];
    manager.enable = YES;
    manager.shouldResignOnTouchOutside = YES;
    manager.shouldToolbarUsesTextFieldTintColor = YES;
    manager.enableAutoToolbar = NO;
    
//    输出日志
    [DDLog addLogger:[DDTTYLogger sharedInstance]];
    // 允许颜色
    [[DDTTYLogger sharedInstance] setColorsEnabled:YES];
    DDLogVerbose(@"Verbose");
    DDLogInfo(@"Info");
    DDLogWarn(@"Warn");
    DDLogError(@"Error");
    [self createUser];
    return YES;
}

//创建保存用户type的plist文件
- (void)createUser{
    NSArray *paths=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
    NSString *path=[paths objectAtIndex:0];
    NSLog(@"path = %@",path);
    
    NSString *filename = [path stringByAppendingPathComponent:FileName];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if (![fileManager fileExistsAtPath:filename]) {
        NSMutableArray *arr = [[NSMutableArray alloc] init];
        NSDictionary *dic = @{@"tel":@"13800000000",@"type":@"4"};
        [arr addObject:dic];
        [arr writeToFile:filename atomically:YES];
    }
}
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
