//
//  BaseTextField.h
//  BaseFrame
//
//  Created by yons on 16/4/13.
//  Copyright © 2016年 xiaojiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseTextField : UITextField
@property (nonatomic, strong) UIColor *underLineColor;
- (id)initWithUnderLineColor:(UIColor *)underLineColor :(float)Y :(float)width;
@end
