//
//  QYTableViewHeader.m
//  导航栏渐变效果与头部视图放大集合
//
//  Created by apple on 16/1/5.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "QYTableViewHeader.h"

@implementation QYTableViewHeader
{
    CGRect  initFrame;
    CGFloat defaultViewHeight;
    CGRect   subViewsFrame;
    CGRect nameFrame;
}
-(void)goodMenWithTableView:(UITableView *)tableView andBackGroundView:(UIView *)view andSubviews:(UIView *)subviews andNameLab:(UILabel *)nameLab
{
    
    _tableView=tableView;
    _bigImageView=view;
    _touXiangImageView=subviews;
    self.nameLab = nameLab;
    initFrame=_bigImageView.frame;
     defaultViewHeight  = initFrame.size.height;
    subViewsFrame=_touXiangImageView.frame;
    nameFrame = nameLab.frame;
     _touXiangImageView.layer.cornerRadius=_touXiangImageView.frame.size.width/2;
    UIView* heardView=[[UIView alloc]initWithFrame:initFrame];
    _touXiangImageView.userInteractionEnabled = YES;
    self.nameLab.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapheader)];
    [self.touXiangImageView addGestureRecognizer:tap];
    UITapGestureRecognizer *tap1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapheader)];
    [self.nameLab addGestureRecognizer:tap1];
    self.tableView.tableHeaderView=heardView;
    [_tableView addSubview:_bigImageView];
    [_tableView addSubview:_touXiangImageView];
    [_tableView addSubview:nameLab];
    
    
}
- (void)tapheader{
    if (self.headerTapBlock) {
        self.headerTapBlock();
    }
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGRect f     = _bigImageView.frame;
    f.size.width = _tableView.frame.size.width;
    _bigImageView.frame  = f;
    
    if (scrollView.contentOffset.y<0) {
        CGFloat offset = (scrollView.contentOffset.y + scrollView.contentInset.top) * -1;
       
        initFrame.origin.x= - offset /2;
        initFrame.origin.y= - offset;
        initFrame.size.width=_tableView.frame.size.width+offset;
        initFrame.size.height=defaultViewHeight+offset;
        _bigImageView.frame=initFrame;
        
        [self viewDidLayoutSubviews:offset/2];
    }
}
- (void)viewDidLayoutSubviews:(CGFloat)offset
{
    _touXiangImageView.frame=CGRectMake(0, 0, 80+offset, 80+offset);
    _touXiangImageView.center=CGPointMake(_bigImageView.center.x, _bigImageView.center.y);
     _touXiangImageView.layer.cornerRadius=_touXiangImageView.frame.size.width/2;
    
    self.nameLab.frame=CGRectMake(0, 0, KScreenWidth+offset, 30);
    self.nameLab.center=CGPointMake(_bigImageView.center.x, _bigImageView.center.y+60+offset);
//    self.nameLab.center=CGPointMake(_bigImageView.center.x, _bigImageView.center.y+60);
    float size = 15+offset/5;
    self.nameLab.font = FONT(size);

}
- (void)resizeView
{
    initFrame.size.width = _tableView.frame.size.width;
    _bigImageView.frame = initFrame;
    
  }
@end
