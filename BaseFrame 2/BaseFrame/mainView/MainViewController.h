//
//  MainViewController.h
//  ttg
//
//  Created by yons on 16/3/1.
//  Copyright © 2016年 xiaojiang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
@interface MainViewController : UIViewController
@property BOOL showTab;
@property (nonatomic, strong) UILabel *addressLab;
@property (nonatomic, strong) UIImageView *dingweiImage;
- (float)countHeight:(NSString *)str width:(float)width font:(UIFont *)font;
- (float)countWidth:(NSString *)str andFont:(UIFont *)font;
- (void)hideTabbar;
- (void)showTabbar;
- (void)back;
- (void)hideLeftBtn;
- (void)setNomalNav;
- (NSArray *)preg_match:(NSString *)str pattern:(NSString *)pattern;
- (void)addNavItem;
- (void)getData;
- (NSString *)searchsql:(NSString *)Conditionstring;
//插入 新增
- (BOOL)Insertsql:(NSString *)Conditionstring COMMODITYNUMBERstring:(NSString *)COMMODITYNUMBERstring COMMODITYpricestring:(NSString *)COMMODITYpricestring imageUrl:(NSString *)imgUrl gooName:(NSString *)goodName stock:(NSString *)stock;
//、、更新
- (void)Updatesql:(NSString *)Conditionstring COMMODITYNUMBERstring:(NSString *)COMMODITYNUMBERstring COMMODITYpricestring:(NSString *)COMMODITYpricestring imageUrl:(NSString *)imgUrl;
//、、删除
- (void)Deletesql:(NSString *)Conditionstring;
- (int)countTotalNumBySQL; //计算购物车总数
- (float)countTotalPriceBySql;//计算购物车总价
- (NSArray *)getShoppingCarArr; //获取购物车列表
- (void)pushToHome; //返回主页
- (void)jumpToIndex:(NSInteger)index; //跳转
- (NSDictionary *)searchById:(NSString *)goodId;
- (void)bigsmall:(UILabel *)view :(int)total;//动画
- (void)removeAllSQLID; //清空购物车
- (void)addPromplabel:(NSString *)Prompstring   afterDelay:(NSTimeInterval)delay;
- (BOOL)ifBuyNumBigThanquantity:(NSString *)Conditionstring buyNum:(NSString *)buyNum;//是否超出库存
- (NSAttributedString *)convert:(NSString *)str;
- (void)addshopcarAnim:(UIImageView *)imageView x:(int)x y:(int)y endx:(int)endx endY:(int)endy;

- (NSString *)getTypeFromePlist:(NSString *)tel;
- (void)insertPlist:(NSDictionary *)personDic;
- (void)showMessage:(NSString *)msg;
@end
