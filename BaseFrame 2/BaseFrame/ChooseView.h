//
//  ChooseView.h
//  BaseFrame
//
//  Created by yons on 16/4/19.
//  Copyright © 2016年 xiaojiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChooseView : UIView
typedef void (^ChooseViewBlock)(ChooseView *view,UIButton *btn, NSString *locate);
typedef void (^backBlock)(ChooseView *view,UIButton *btn, NSString *locate);
@property (nonatomic, strong) UIView *alertView;
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) NSArray *resultArr;
@property (nonatomic, strong) UIButton *Button;
@property (nonatomic, copy) NSString *title;
- (id)initWithFrame:(CGRect)fra Title:(NSString *)tit Button:(UIButton *)button lastDate:(NSString *)date TimeOrDate:(NSString *)TimeOrDate;
- (void)show;
- (void)hide;
@property (copy, nonatomic)ChooseViewBlock block;
@property (copy, nonatomic)backBlock backBlock;
@property (strong, nonatomic)ChooseView *last;
@property (nonatomic, copy) NSString *timeOrDate;
@end
