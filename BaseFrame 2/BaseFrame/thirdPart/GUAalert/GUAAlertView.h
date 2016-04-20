//
//  GUAAlertView.h
//  GUAAlertView
//
//  Created by gua on 11/11/14.
//  Copyright (c) 2014 GUA. All rights reserved.
//




typedef void (^GUAAlertViewBlock)(void);


@interface GUAAlertView : UIView

+ (instancetype)alertViewWithTitle:(NSString *)title
                           message:(NSString *)message
                       buttonTitle:(NSString *)buttonTitle
               buttonTouchedAction:(GUAAlertViewBlock)buttonBlock
                     dismissAction:(GUAAlertViewBlock)dismissBlock;
+ (instancetype)alertViewWithTitle:(NSString *)title
                           message:(NSString *)message
                       buttonTitle:(NSString *)buttonTitle
                       cancleTitle:(NSString *)cancleStr
               buttonTouchedAction:(GUAAlertViewBlock)buttonBlock
                     dismissAction:(GUAAlertViewBlock)dismissBlock;
- (void)show;
- (void)dismiss;

@end


