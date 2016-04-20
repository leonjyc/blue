//
//  LeftView.m
//  BaseFrame
//
//  Created by yons on 16/4/19.
//  Copyright © 2016年 xiaojiang. All rights reserved.
//

#import "LeftView.h"

@implementation LeftView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (id)initWithUnderLineColor:(UIColor *)underLineColor height:(float)Y width:(float)width title:(NSString  *)title{
    self = [super init];
    if (self) {
        if (underLineColor != nil) {
            UIView *under = [[UIView alloc] initWithFrame:CGRectMake(0, Y-1, width, 1)];
            [self addSubview:under];
            under.backgroundColor= color(groupTableViewBackgroundColor);
            self.underline = under;
        }
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 70, Y)];
        //        label.backgroundColor = RandomColor;
        label.font = FONT(15);
        label.text = title;
        label.textColor = underLineColor;
        [self addSubview:label];
        self.rightLab = [[UILabel alloc] initWithFrame:CGRectMake(70, 0, width-70, Y)];
        self.rightLab.font = FONT(15);
        [self addSubview:self.rightLab];
        
        //        self.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    }
    return self;
}
- (void)hideUnderLine{
    self.underline.hidden = YES;
}
@end
