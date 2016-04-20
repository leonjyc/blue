//
//  BlockBtn.m
//  chezhu
//
//  Created by yons on 15/12/9.
//  Copyright (c) 2015年 xiaojiang. All rights reserved.
//

#import "BlockBtn.h"

@implementation BlockBtn

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (void)addTapBlock:(ButtonBlock)block
{
    _block = block;
    [self addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
}
- (void)buttonAction:(UIButton *)button
{
    _block(button);
}
@end
