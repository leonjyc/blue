//
//  LeftView.h
//  BaseFrame
//
//  Created by yons on 16/4/19.
//  Copyright © 2016年 xiaojiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LeftView : UIView
@property (nonatomic, strong) UILabel *rightLab;
@property (nonatomic, strong) UIView *underline;
- (void)hideUnderLine;
- (id)initWithUnderLineColor:(UIColor *)underLineColor height:(float)Y width:(float)width title:(NSString  *)title;
@end
