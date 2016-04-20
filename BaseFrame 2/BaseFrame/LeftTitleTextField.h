//
//  LeftTitleTextField.h
//  BaseFrame
//
//  Created by yons on 16/4/16.
//  Copyright © 2016年 xiaojiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LeftTitleTextField : UITextField
@property (nonatomic, strong) UIView *underline;
- (void)hideUnderLine;
- (id)initWithUnderLineColor:(UIColor *)underLineColor height:(float)Y width:(float)width title:(NSString  *)title;
@end
