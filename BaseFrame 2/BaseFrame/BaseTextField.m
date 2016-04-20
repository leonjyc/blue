//
//  BaseTextField.m
//  BaseFrame
//
//  Created by yons on 16/4/13.
//  Copyright © 2016年 xiaojiang. All rights reserved.
//

#import "BaseTextField.h"

@implementation BaseTextField

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (id)initWithUnderLineColor:(UIColor *)underLineColor :(float)Y :(float)width{
    self = [super init];
    if (self) {
        UIView *under = [[UIView alloc] initWithFrame:CGRectMake(0, Y-1, width, 1)];
        [self addSubview:under];
        under.backgroundColor= underLineColor;
        self.underLineColor = underLineColor;
    }
    return self;
}
//控制placeHolder的颜色、字体
- (void)drawPlaceholderInRect:(CGRect)rect
{
    
//    [[UIColor whiteColor] setFill];
//    
//    [[self placeholder] drawInRect:rect withFont:FONT(15)];
    NSMutableDictionary *dictM = [NSMutableDictionary dictionary];
    dictM[NSFontAttributeName] = FONT(15);
    dictM[NSForegroundColorAttributeName] = self.underLineColor;
    CGPoint point = CGPointMake(0, (rect.size.height - FONT(15).lineHeight) * 0.5);
    
    [self.placeholder drawAtPoint:point withAttributes:dictM];
}
@end
