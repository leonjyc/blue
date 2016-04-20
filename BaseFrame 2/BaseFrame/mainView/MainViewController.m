//
//  MainViewController.m
//  ttg
//
//  Created by yons on 16/3/1.
//  Copyright © 2016年 xiaojiang. All rights reserved.
//

#import "MainViewController.h"
#import <sqlite3.h>
#import "CALayer+Transition.h"
@interface MainViewController ()<UIGestureRecognizerDelegate>
{
    sqlite3 *db;
    UIView *Promplabelview;
//    CALayer *layer ;
}
@end

@implementation MainViewController
- (void)refreshAddress{

}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(getData) name:@"logoutNotification" object:nil];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"back.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate] style:UIBarButtonItemStylePlain target:self action:@selector(back)];
    // Do any additional setup after loading the view.
    [self setNomalNav];
}
- (void)getData{
    NSLog(@"通知通知 logoutNotification");
}
- (void)showMessage:(NSString *)msg{
    [XHToast showCenterWithText:msg];
}
- (void)addNavItem{
//    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
//    [btn setTitleColor:color(blackColor) forState:UIControlStateNormal];
//    [btn setImage:img(@"17") forState:UIControlStateNormal];
//    btn.titleLabel.font = FONT(15);
//    [self.view addSubview:btn];
//    [btn addTarget:self action:@selector(push) forControlEvents:UIControlEventTouchUpInside];
//    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
    
    UIButton *rightBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
    [rightBtn setTitleColor:color(blackColor) forState:UIControlStateNormal];
    [rightBtn setImage:img(@"16") forState:UIControlStateNormal];
    rightBtn.titleLabel.font = FONT(15);
    [self.view addSubview:rightBtn];
    [rightBtn addTarget:self action:@selector(Search) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightBtn];
    
    UIView *navView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth-120, 30)];
//    navView.backgroundColor = color(whiteColor);
    self.addressLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth-120, 30)];
    
    self.addressLab.textAlignment = NSTextAlignmentCenter;
    self.addressLab.font = FONT(15);
    [navView addSubview:self.addressLab];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapnav)];
    [navView addGestureRecognizer:tap];
    self.navigationItem.titleView = navView;
}
//点击nav
- (void)tapnav{
    
}
//转换str
- (NSAttributedString *)convert:(NSString *)str{
    NSMutableAttributedString *attrrbutedStr = [[NSMutableAttributedString alloc] initWithString:str];
    NSTextAttachment *textAttachment = [[NSTextAttachment alloc] initWithData:nil ofType:nil] ;
    
    textAttachment.image = img(@"dw"); //要添加的图片
    textAttachment.bounds = CGRectMake(textAttachment.bounds.origin.x, textAttachment.bounds.origin.y-2.5, 15, 15);
    
    NSAttributedString *textAttachmentString = [NSAttributedString attributedStringWithAttachment:textAttachment] ;
    
    [attrrbutedStr insertAttributedString:textAttachmentString atIndex:attrrbutedStr.length];
    return attrrbutedStr;
}
- (void)Search{
    }
- (void)push{
    [MBProgressHUD showSuccess:@"扫一扫"];
}
- (void)hideLeftBtn{
    self.navigationItem.leftBarButtonItem = nil;
}
- (void)back{
//    if (self.showTab == YES) {
//        [self showTabbar];
//    }
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)setupRefresh
{
    //下拉刷新01-默认
//    self.tableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
//        // 进入刷新状态后会自动调用这个block
//    }];
//    或
//    // 设置回调（一旦进入刷新状态，就调用target的action，也就是调用self的loadNewData方法）
//    self.tableView.header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
//    
//    // 马上进入刷新状态
//    [self.tableView.header beginRefreshing];
    
    
    //下拉刷新02-动画图片
    // 设置回调（一旦进入刷新状态，就调用target的action，也就是调用self的loadNewData方法）
//    MJRefreshGifHeader *header = [MJRefreshGifHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
//    // 设置普通状态的动画图片
//    [header setImages:idleImages forState:MJRefreshStateIdle];
//    // 设置即将刷新状态的动画图片（一松开就会刷新的状态）
//    [header setImages:pullingImages forState:MJRefreshStatePulling];
//    // 设置正在刷新状态的动画图片
//    [header setImages:refreshingImages forState:MJRefreshStateRefreshing];
//    // 设置header
//    self.tableView.mj_header = header;
    
//    下拉刷新03-隐藏时间
//    header.lastUpdatedTimeLabel.hidden = YES;
    // 隐藏状态
//    header.stateLabel.hidden = YES;
    
//    下拉刷新05-自定义文字
    // 设置文字
//    [header setTitle:@"Pull down to refresh" forState:MJRefreshStateIdle];
//    [header setTitle:@"Release to refresh" forState:MJRefreshStatePulling];
//    [header setTitle:@"Loading ..." forState:MJRefreshStateRefreshing];
//    
//    // 设置字体
//    header.stateLabel.font = [UIFont systemFontOfSize:15];
//    header.lastUpdatedTimeLabel.font = [UIFont systemFontOfSize:14];
//    
//    // 设置颜色
//    header.stateLabel.textColor = [UIColor redColor];
//    header.lastUpdatedTimeLabel.textColor = [UIColor blueColor];
    
//    下拉刷新06-自定义刷新控件
//    self.tableView.mj_header = [MJDIYHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
    // 具体实现参考MJDIYHeader.h和MJDIYHeader.m
    
//    上拉刷新01-默认
//    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
//        // 进入刷新状态后会自动调用这个block
//    }];
//    或
//    // 设置回调（一旦进入刷新状态，就调用target的action，也就是调用self的loadMoreData方法）
//    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
    
//    上拉刷新02-动画图片
    // 设置回调（一旦进入刷新状态，就调用target的action，也就是调用self的loadMoreData方法）
//    MJRefreshAutoGifFooter *footer = [MJRefreshAutoGifFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
//    
//    // 设置刷新图片
//    [footer setImages:refreshingImages forState:MJRefreshStateRefreshing];
//    
//    // 设置尾部
//    self.tableView.mj_footer = footer;
    
//    上拉刷新03-隐藏刷新状态的文字
    // 隐藏刷新状态的文字
//    footer.refreshingTitleHidden = YES;
    // 如果没有上面的方法，就用footer.stateLabel.hidden = YES;
    
//    上拉刷新04-全部加载完毕
    // 变为没有更多数据的状态
//    [footer endRefreshingWithNoMoreData];
    
//    上拉刷新06-加载后隐藏
//    self.tableView.mj_footer.hidden = YES;

    
    //    上拉刷新07-自动回弹的上拉01
//    self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
}

- (void)setNomalNav{
    UINavigationBar *bar = self.navigationController.navigationBar;
    //设置显示的颜色
    bar.barTintColor = backColor;
    //设置字体颜色
    bar.tintColor = [UIColor whiteColor];
    [bar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (float)countHeight:(NSString *)str width:(float)width font:(UIFont *)font{
    UILabel *lab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, width, 20)];
    lab.text = str;
    lab.font = font;
    lab.numberOfLines = 0;
    lab.lineBreakMode = NSLineBreakByWordWrapping;
    [lab sizeToFit];
    return lab.frame.size.height;
}
- (float)countWidth:(NSString *)str andFont:(UIFont *)font{
    UILabel *lab = [[UILabel alloc] initWithFrame:CGRectMake(140, 10, 100, 20)];
    lab.text = str;
    lab.font = font;
    [lab sizeToFit];
    return lab.frame.size.width;
}
- (void)hideTabbar{
    self.hidesBottomBarWhenPushed = YES;
}
- (void)showTabbar{
//    AppDelegate *delegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
//    [UIView beginAnimations:@"move" context:nil];
//    [UIView setAnimationDuration:0.5];
//    [UIView setAnimationDelegate:self];
//    //改变它的frame的x,y的值
//    delegate.tabbarView.frame=CGRectMake(0,KScreenHeight-60, KScreenWidth,60);
//    [UIView commitAnimations];
}
- (NSArray *)preg_match:(NSString *)str pattern:(NSString *)pattern{
    NSError *error = NULL;
//    NSString *pattern = @"http://[0-9a-z./:]+";
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:pattern options:NSRegularExpressionCaseInsensitive error:&error];
    NSArray *array = [regex matchesInString:str options:0 range:NSMakeRange(0, str.length)];
    NSMutableArray *data = [[NSMutableArray alloc] init];
    for (NSTextCheckingResult *result in array) {
        [data addObject:[str substringWithRange:[result rangeAtIndex:0]]];
    }
    return data;
}

//返回查询值
- (NSString *)searchsql:(NSString *)Conditionstring
{
    NSString *string;
    NSArray *array = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *str = [array objectAtIndex:0];
    //        NSLog(@"str = %@",str);
    //dbPath
    NSString *dbPath = [str stringByAppendingPathComponent:DBNAME];
    if (sqlite3_open([dbPath UTF8String], &db) == SQLITE_OK)
    {
        sqlite3_stmt *statement;//包装sql语句
        NSString *insertStr = [NSString stringWithFormat:@"select * from COMMODITY where COMMODITYID = \"%@\"",Conditionstring];//sql语句
        sqlite3_prepare_v2(db, [insertStr UTF8String], -1, &statement, nil);//准备
        if (sqlite3_step(statement) == SQLITE_ROW)//执行sql语句
        {
            //            NSString *resuStr = [[NSString alloc] initWithUTF8String:(const char*)sqlite3_column_text(statement, 1)];
            //                   NSLog(@"resuStr---%@",resuStr);
            
            //获取主健的值 int型的 用 sqlite3_column_int
//            int ID = sqlite3_column_int(statement, 0);
//            //转换成 NSNumber 类型的
//            NSNumber *primaryKeyValue = [[NSNumber alloc]
//                                         initWithInt: ID];
//            
//            char *commodityid = (char*)sqlite3_column_text(statement, 1);
//            NSString *nscommodityid = [[NSString alloc]initWithUTF8String:commodityid];
            
            char *number = (char*)sqlite3_column_text(statement, 2);
            string = [[NSString alloc]initWithUTF8String:number];
            
            
            //            、、、售价
//            char *price = (char*)sqlite3_column_text(statement, 3);
//            NSString *pricestring = [[NSString alloc]initWithUTF8String:price];

            
//            NSLog(@"ID:%@ commodityid:%@  number:%@   pricestring:%@ ",primaryKeyValue,nscommodityid,string,pricestring);
            
        }
        else
        {
//            NSLog(@"fail to search!");
            
        }
        
        sqlite3_finalize(statement);
        sqlite3_close(db);
    }
    
    
    
    return string;
}

- (NSDictionary *)searchById:(NSString *)goodId{
    NSDictionary *dic = [[NSMutableDictionary alloc] init];
    NSArray *array = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *str = [array objectAtIndex:0];
    //        NSLog(@"str = %@",str);
    //dbPath
    NSString *dbPath = [str stringByAppendingPathComponent:DBNAME];
    if (sqlite3_open([dbPath UTF8String], &db) == SQLITE_OK)
    {
        sqlite3_stmt *statement;//包装sql语句
        NSString *insertStr = [NSString stringWithFormat:@"select * from COMMODITY where COMMODITYID = \"%@\"",goodId];//sql语句
        sqlite3_prepare_v2(db, [insertStr UTF8String], -1, &statement, nil);//准备
        if (sqlite3_step(statement) == SQLITE_ROW)//执行sql语句
        {
            //            NSString *resuStr = [[NSString alloc] initWithUTF8String:(const char*)sqlite3_column_text(statement, 1)];
            //                   NSLog(@"resuStr---%@",resuStr);
            
            //获取主健的值 int型的 用 sqlite3_column_int
            //            int ID = sqlite3_column_int(statement, 0);
            //            //转换成 NSNumber 类型的
            //            NSNumber *primaryKeyValue = [[NSNumber alloc]
            //                                         initWithInt: ID];
            //
            char *commodityid = (char*)sqlite3_column_text(statement, 1);
            NSString *nscommodityid = [[NSString alloc]initWithUTF8String:commodityid];
            
            char *number = (char*)sqlite3_column_text(statement, 2);
            NSString *string = [[NSString alloc]initWithUTF8String:number];
            
            
            //            、、、售价
            char *price = (char*)sqlite3_column_text(statement, 3);
            NSString *pricestring = [[NSString alloc]initWithUTF8String:price];
            
            char *url = (char*)sqlite3_column_text(statement, 4);
            NSString *imgUrl = [[NSString alloc]initWithUTF8String:url];
            
            char *name = (char*)sqlite3_column_text(statement, 5);
            NSString *goodName = [[NSString alloc]initWithUTF8String:name];
            
            dic = @{@"goodID":nscommodityid,@"num":string,@"price":pricestring,@"imgurl":imgUrl,@"goodName":goodName};
            //            NSLog(@"ID:%@ commodityid:%@  number:%@   pricestring:%@ ",primaryKeyValue,nscommodityid,string,pricestring);
            
        }
        else
        {
            //            NSLog(@"fail to search!");
            
        }
        
        sqlite3_finalize(statement);
        sqlite3_close(db);
    }
    return dic;
}
//插入
- (BOOL)Insertsql:(NSString *)Conditionstring COMMODITYNUMBERstring:(NSString *)COMMODITYNUMBERstring COMMODITYpricestring:(NSString *)COMMODITYpricestring imageUrl:(NSString *)imgUrl gooName:(NSString *)goodName stock:(NSString *)stock
{
    
    NSArray *array = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *str = [array objectAtIndex:0];
    NSLog(@"str = %@",str);
    //dbPath
    NSString *dbPath = [str stringByAppendingPathComponent:DBNAME];
    if (sqlite3_open([dbPath UTF8String], &db) == SQLITE_OK)
    {
        sqlite3_stmt *stm;//包装sql语句
        NSString *insertStr = [NSString stringWithFormat:@"INSERT INTO COMMODITY(COMMODITYID,number,price,imgUrl,goodName,stock) VALUES(\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\") ",Conditionstring,COMMODITYNUMBERstring,COMMODITYpricestring,imgUrl,goodName,stock];//sql语句
        sqlite3_prepare_v2(db, [insertStr UTF8String], -1, &stm, nil);//准备
        
        
        if (sqlite3_step(stm) == SQLITE_DONE)//执行sql语句
        {
            NSLog(@"success to insert!");
            sqlite3_finalize(stm);
            sqlite3_close(db);
            return YES;
        }
        else
        {
            NSLog(@"fail to insert!");
            sqlite3_finalize(stm);
            sqlite3_close(db);
            return NO;
        }
        
        
    }
    else return NO;
    
    
    
}
//、、更新
- (void)Updatesql:(NSString *)Conditionstring COMMODITYNUMBERstring:(NSString *)COMMODITYNUMBERstring COMMODITYpricestring:(NSString *)COMMODITYpricestring imageUrl:(NSString *)imgUrl
{
    
    NSArray *array = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *str = [array objectAtIndex:0];
    //    NSLog(@"str = %@",str);
    //dbPath
    NSString *dbPath = [str stringByAppendingPathComponent:DBNAME];
    if (sqlite3_open([dbPath UTF8String], &db) == SQLITE_OK)
    {
        sqlite3_stmt *stm;//包装sql语句
        NSString *updateStr = [NSString stringWithFormat:@"update commodity set  number= \"%@\" ,price= \"%@\" ,imgUrl= \"%@\" where COMMODITYID  = \"%@\"",COMMODITYNUMBERstring,COMMODITYpricestring,imgUrl,Conditionstring];//sql语句
        sqlite3_prepare_v2(db, [updateStr UTF8String], -1, &stm, nil);//准备
        if (sqlite3_step(stm) == SQLITE_DONE)//执行sql语句
        {
            NSLog(@"success to modify!");
            
        }
        else
        {
            NSLog(@"fail to modify!");
            
        }
        
        sqlite3_finalize(stm);
        sqlite3_close(db);
    }
    
    
    //    [self dismissViewControllerAnimated:YES completion:nil];
}
//、、删除
- (void)Deletesql:(NSString *)Conditionstring
{
    NSArray *array = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *str = [array objectAtIndex:0];
    //    NSLog(@"str = %@",str);
    //dbPath
    NSString *dbPath = [str stringByAppendingPathComponent:DBNAME];
    if (sqlite3_open([dbPath UTF8String], &db) == SQLITE_OK)
    {
        sqlite3_stmt *statement;//包装sql语句
        //        删除
        
        NSString *deleteStr = [NSString stringWithFormat:@"Delete from COMMODITY where COMMODITYID = \"%@\"",Conditionstring];//sql语句
        //        NSString *insertStr = [NSString stringWithFormat:@"select * from COMMODITY"];//sql语句
        //        NSString *insertStr = [NSString stringWithFormat:@"SELECT * FROM COMMODITY"];//sql语句
        sqlite3_prepare_v2(db, [deleteStr UTF8String], -1, &statement, nil);//准备
        if (sqlite3_step(statement) == SQLITE_ROW)//执行sql语句
        {
            
        }
        else
        {
            
            NSLog(@"删除成功!");
            
        }
        
        
        sqlite3_finalize(statement);
        sqlite3_close(db);
    }
    
}
//计算购物总数
- (int)countTotalNumBySQL{
    int total = 0;
    NSArray *array = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *str = [array objectAtIndex:0];
    //    NSLog(@"str = %@",str);
    //dbPath
    NSString *dbPath = [str stringByAppendingPathComponent:DBNAME];
    if (sqlite3_open([dbPath UTF8String], &db) == SQLITE_OK)
    {
        sqlite3_stmt *stm;//包装sql语句
        NSString *updateStr = @"select * from COMMODITY";//sql语句
        sqlite3_prepare_v2(db, [updateStr UTF8String], -1, &stm, nil);//准备
        while (sqlite3_step(stm) == SQLITE_ROW)//执行sql语句
        {
            //获取主健的值 int型的 用 sqlite3_column_int
//            int ID = sqlite3_column_int(stm, 0);
            //转换成 NSNumber 类型的
//            NSNumber *primaryKeyValue = [[NSNumber alloc]
//                                         initWithInt: ID];
//            
//            char *commodityid = (char*)sqlite3_column_text(stm, 1);
//            NSString *nscommodityid = [[NSString alloc]initWithUTF8String:commodityid];
            
            char *number = (char*)sqlite3_column_text(stm, 2);
            NSString *string = [[NSString alloc]initWithUTF8String:number];
            total = total + [string intValue];
            
            //            、、、售价
//            char *price = (char*)sqlite3_column_text(stm, 3);
//            NSString *pricestring = [[NSString alloc]initWithUTF8String:price];
        }
        sqlite3_finalize(stm);
        sqlite3_close(db);
//        AppDelegate *delegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
        
        if (total <= 0) {
//            delegate.tabCount.hidden = YES;
//            delegate.tabCount.text = @"0";
        }
        else{
//            delegate.tabCount.hidden = NO;
            [UIView animateWithDuration:0.1 animations:
             ^(void){
//                 delegate.tabCount.transform = CGAffineTransformScale(CGAffineTransformIdentity,0.8, 0.8);
             } completion:^(BOOL finished){//do other thing
                 [UIView animateWithDuration:0.2 animations:
                  ^(void){ 
                      
//                      delegate.tabCount.transform = CGAffineTransformScale(CGAffineTransformIdentity,1.2, 1.2);
//                      if (total > 99) {
//                          delegate.tabCount.text = @"99+";
//                      }
//                      else {
//                          delegate.tabCount.text = [NSString stringWithFormat:@"%d",total];
//                          [delegate.tabCount.layer transitionWithAnimType:TransitionAnimTypeOglFlip subType:TransitionSubtypesFromLeft curve:TransitionCurveLinear duration:.5f resultStatus:^(NSString *resultStatus) {
//                              NSLog(@"结束  %@",resultStatus);
//                          }];
//                      }
                      
                  } completion:^(BOOL finished){//do other thing
                      [UIView animateWithDuration:0.1 animations:
                       ^(void){
                           
//                           delegate.tabCount.transform = CGAffineTransformScale(CGAffineTransformIdentity,1,1);
                       } completion:^(BOOL finished){//do other thing
                       }];
                  }];
             }];
        }

    }
    NSLog(@"totalnumber:%d",total);
    return total;
}

- (float)countTotalPriceBySql{
    float total = 0;
    NSArray *array = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *str = [array objectAtIndex:0];
    //    NSLog(@"str = %@",str);
    //dbPath
    NSString *dbPath = [str stringByAppendingPathComponent:DBNAME];
    if (sqlite3_open([dbPath UTF8String], &db) == SQLITE_OK)
    {
        sqlite3_stmt *stm;//包装sql语句
        NSString *updateStr = @"select * from COMMODITY";//sql语句
        sqlite3_prepare_v2(db, [updateStr UTF8String], -1, &stm, nil);//准备
        while (sqlite3_step(stm) == SQLITE_ROW)//执行sql语句
        {
            //获取主健的值 int型的 用 sqlite3_column_int
            //            int ID = sqlite3_column_int(stm, 0);
            //转换成 NSNumber 类型的
            //            NSNumber *primaryKeyValue = [[NSNumber alloc]
            //                                         initWithInt: ID];
            //
            //            char *commodityid = (char*)sqlite3_column_text(stm, 1);
            //            NSString *nscommodityid = [[NSString alloc]initWithUTF8String:commodityid];
            char *price = (char*)sqlite3_column_text(stm, 3);
            NSString *pricestring = [[NSString alloc]initWithUTF8String:price];
            float goodprice = [pricestring floatValue];
            char *number = (char*)sqlite3_column_text(stm, 2);
            NSString *string = [[NSString alloc]initWithUTF8String:number];
            total = total + [string intValue]*goodprice;
            
            //            、、、售价
            //            char *price = (char*)sqlite3_column_text(stm, 3);
            //            NSString *pricestring = [[NSString alloc]initWithUTF8String:price];
        }
        sqlite3_finalize(stm);
        sqlite3_close(db);
        
    }
    NSLog(@"totalprice:%f",total);
    return total;

}

- (void)bigsmall:(UILabel *)view :(int)total{
    [UIView animateWithDuration:0.1 animations:
     ^(void){
         view.transform = CGAffineTransformScale(CGAffineTransformIdentity,0.8, 0.8);
     } completion:^(BOOL finished){//do other thing
         [UIView animateWithDuration:0.2 animations:
          ^(void){
              
              view.transform = CGAffineTransformScale(CGAffineTransformIdentity,1.2, 1.2);
              if (total > 99) {
                  view.text = @"99+";
              }
              else {
                  view.text = [NSString stringWithFormat:@"%d",total];
              }
              
          } completion:^(BOOL finished){//do other thing
              [UIView animateWithDuration:0.1 animations:
               ^(void){
                   
                   view.transform = CGAffineTransformScale(CGAffineTransformIdentity,1,1);
               } completion:^(BOOL finished){//do other thing
               }];
          }];
     }];
}
- (NSArray *)getShoppingCarArr{
    NSMutableArray *arr = [[NSMutableArray alloc] init];
    NSArray *array = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *str = [array objectAtIndex:0];
    //    NSLog(@"str = %@",str);
    //dbPath
    NSString *dbPath = [str stringByAppendingPathComponent:DBNAME];
    if (sqlite3_open([dbPath UTF8String], &db) == SQLITE_OK)
    {
        sqlite3_stmt *stm;//包装sql语句
        NSString *updateStr = @"select * from COMMODITY";//sql语句
        sqlite3_prepare_v2(db, [updateStr UTF8String], -1, &stm, nil);//准备
        while (sqlite3_step(stm) == SQLITE_ROW)//执行sql语句
        {
            //获取主健的值 int型的 用 sqlite3_column_int
            //            int ID = sqlite3_column_int(stm, 0);
            //转换成 NSNumber 类型的
            //            NSNumber *primaryKeyValue = [[NSNumber alloc]
            //                                         initWithInt: ID];
            //
            char *commodityid = (char*)sqlite3_column_text(stm, 1);
            NSString *nscommodityid = [[NSString alloc]initWithUTF8String:commodityid];
            
            char *number = (char*)sqlite3_column_text(stm, 2);
            NSString *string = [[NSString alloc]initWithUTF8String:number];
            
            //            、、、售价
            char *price = (char*)sqlite3_column_text(stm, 3);
            NSString *pricestring = [[NSString alloc]initWithUTF8String:price];
            
            char *imgurl = (char*)sqlite3_column_text(stm, 4);
            NSString *urlstring = [[NSString alloc]initWithUTF8String:imgurl];
            
            char *name = (char*)sqlite3_column_text(stm, 5);
            NSString *goodName = [[NSString alloc]initWithUTF8String:name];
            
            NSDictionary *dic = @{@"goodID":nscommodityid,@"num":string,@"price":pricestring,@"imgurl":urlstring,@"goodName":goodName};
            [arr addObject:dic];
        }
        sqlite3_finalize(stm);
        sqlite3_close(db);
    }

    return arr;
}
//跳首页
- (void)pushToHome{
//    AppDelegate *delegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
//    [delegate.baseController setTabBarViewIndex:1];
}
//跳转
- (void)jumpToIndex:(NSInteger)index{
//    AppDelegate *delegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
//    [delegate.baseController setTabBarViewIndex:index];
}

- (void)removeAllSQLID{
    NSArray *array = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *str = [array objectAtIndex:0];
    //    NSLog(@"str = %@",str);
    //dbPath
    NSString *dbPath = [str stringByAppendingPathComponent:DBNAME];
    if (sqlite3_open([dbPath UTF8String], &db) == SQLITE_OK)
    {
        sqlite3_stmt *statement;//包装sql语句
        //        删除
        
        NSString *deleteStr = @"Delete from COMMODITY";//sql语句
        //        NSString *insertStr = [NSString stringWithFormat:@"select * from COMMODITY"];//sql语句
        //        NSString *insertStr = [NSString stringWithFormat:@"SELECT * FROM COMMODITY"];//sql语句
        sqlite3_prepare_v2(db, [deleteStr UTF8String], -1, &statement, nil);//准备
        if (sqlite3_step(statement) == SQLITE_ROW)//执行sql语句
        {
            
        }
        else
        {
            
            NSLog(@"删除成功!");
            
        }
        
        
        sqlite3_finalize(statement);
        sqlite3_close(db);
    }

}
-(void)addPromplabel:(NSString *)Prompstring   afterDelay:(NSTimeInterval)delay{
    [Promplabelview removeFromSuperview];
    self.view.userInteractionEnabled=NO;
    Promplabelview=[[UIView alloc]init];
    Promplabelview.layer.cornerRadius = 5;
    Promplabelview.layer.masksToBounds = YES;
    UILabel * Promplabel=[[UILabel alloc]init];
    Promplabel.frame=CGRectMake(10, 0, KScreenWidth-20, 60);
    //    Promplabel.backgroundColor=[UIColor grayColor];
    Promplabel.textColor=[UIColor whiteColor];
    Promplabel.font = FONT(18);
    Promplabel.text=Prompstring;
    Promplabel.numberOfLines=0;
    Promplabel.textAlignment=NSTextAlignmentCenter;
    [Promplabel sizeToFit];
    Promplabel.lineBreakMode=NSLineBreakByWordWrapping;
    Promplabel.frame=CGRectMake(10, 10, Promplabel.frame.size.width, Promplabel.frame.size.height);
    [Promplabelview addSubview:Promplabel];
    Promplabelview.backgroundColor=[UIColor blackColor];
    Promplabelview.alpha = 0.8;
    Promplabelview.frame=CGRectMake((KScreenWidth-Promplabel.frame.size.width)/2-10, KScreenHeight-Promplabel.frame.size.height-100, Promplabel.frame.size.width+20, Promplabel.frame.size.height+20);
    [self.view addSubview:Promplabelview];
    //    NSLog(@"Promplabel----%f",Promplabel.frame.size.width);
    [self performSelector:@selector(hidePromplabel:) withObject:nil afterDelay:delay];
}
//、、去除提示信息
- (void)hidePromplabel:(NSNumber *)animated {
    self.view.userInteractionEnabled=YES;
    [Promplabelview removeFromSuperview];
}

- (BOOL)ifBuyNumBigThanquantity:(NSString *)Conditionstring buyNum:(NSString *)buyNum{
    BOOL ifbig = NO;
    NSString *goodquantity = @"";
    NSArray *array = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *str = [array objectAtIndex:0];
    //        NSLog(@"str = %@",str);
    //dbPath
    NSString *dbPath = [str stringByAppendingPathComponent:DBNAME];
    if (sqlite3_open([dbPath UTF8String], &db) == SQLITE_OK)
    {
        sqlite3_stmt *statement;//包装sql语句
        NSString *insertStr = [NSString stringWithFormat:@"select * from COMMODITY where COMMODITYID = \"%@\"",Conditionstring];//sql语句
        sqlite3_prepare_v2(db, [insertStr UTF8String], -1, &statement, nil);//准备
        if (sqlite3_step(statement) == SQLITE_ROW)//执行sql语句
        {
            //            NSString *resuStr = [[NSString alloc] initWithUTF8String:(const char*)sqlite3_column_text(statement, 1)];
            //                   NSLog(@"resuStr---%@",resuStr);
            
            //获取主健的值 int型的 用 sqlite3_column_int
            //            int ID = sqlite3_column_int(statement, 0);
            //            //转换成 NSNumber 类型的
            //            NSNumber *primaryKeyValue = [[NSNumber alloc]
            //                                         initWithInt: ID];
            //
            //            char *commodityid = (char*)sqlite3_column_text(statement, 1);
            //            NSString *nscommodityid = [[NSString alloc]initWithUTF8String:commodityid];
            //
            //            char *number = (char*)sqlite3_column_text(statement, 2);
            //            NSString *string = [[NSString alloc]initWithUTF8String:number];
            //
            //
            //            //            、、、售价
            //            char *price = (char*)sqlite3_column_text(statement, 3);
            //            NSString *pricestring = [[NSString alloc]initWithUTF8String:price];
            //
            //            char *url = (char*)sqlite3_column_text(statement, 4);
            //            NSString *imgUrl = [[NSString alloc]initWithUTF8String:url];
            
            char *quantity = (char*)sqlite3_column_text(statement, 6);
            goodquantity = [[NSString alloc]initWithUTF8String:quantity];
            
            //            NSLog(@"ID:%@ commodityid:%@  number:%@   pricestring:%@ ",primaryKeyValue,nscommodityid,string,pricestring);
            
        }
        else
        {
            //            NSLog(@"fail to search!");
            
        }
        
        sqlite3_finalize(statement);
        sqlite3_close(db);
    }
    if ([goodquantity intValue] < [buyNum intValue]) {
        ifbig = YES;
//        [MBProgressHUD showError:@"超出库存啦.."];
    }
    return ifbig;
}
//添加购物车动画
-(void)addshopcarAnim:(UIImageView *)imageView x:(int)x y:(int)y endx:(int)endx endY:(int)endy{
//    self.view.userInteractionEnabled = NO;
    if (endx == 0) {
        endx = KScreenWidth-50;
    }
    if (endy == 0) {
        endy = KScreenHeight-49;
    }
    //曲线动画
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(x, y)];
    [path addQuadCurveToPoint:CGPointMake(endx,endy) controlPoint:CGPointMake(x, y)];
    
    //    、、、、
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    animation.path = path.CGPath;
    animation.rotationMode = kCAAnimationRotateAuto;
    
    //放大
//    CABasicAnimation *expandAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
//    expandAnimation.duration = 0.3f;
//    expandAnimation.fromValue = [NSNumber numberWithFloat:1];
//    expandAnimation.toValue = [NSNumber numberWithFloat:2.0f];
//    expandAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    
    //缩小
    CABasicAnimation *narrowAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    narrowAnimation.beginTime = 0.5;
    narrowAnimation.duration = 0.6f;
    narrowAnimation.fromValue = [NSNumber numberWithFloat:1.0f];
    narrowAnimation.toValue = [NSNumber numberWithFloat:0.5f];
    narrowAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    
    CAAnimationGroup *groups = [CAAnimationGroup animation];
    groups.animations = @[animation,narrowAnimation];
    groups.duration = 0.6f;
    groups.removedOnCompletion=NO;
    groups.fillMode=kCAFillModeForwards;
    groups.delegate = self;
    
    
    UIImage *img = imageView.image;
    
    CALayer *layer= [CALayer layer];
    layer.contents = (__bridge id)img.CGImage;
    layer.contentsGravity = kCAGravityResizeAspectFill;
    layer.bounds = CGRectMake(0, 0, 50, 50);
    [layer setCornerRadius:CGRectGetHeight([layer bounds]) / 2];
    layer.masksToBounds = YES;
//    layer.position =CGPointMake(50, 150);
    [self.view.layer addSublayer:layer];
    [layer addAnimation:groups forKey:@"group"];
    [self performSelector:@selector(endAnim:) withObject:layer afterDelay:0.6];
}

- (void)endAnim:(CALayer *)layer{
    
        
    [layer removeFromSuperlayer];
    layer = nil;
    self.view.userInteractionEnabled = YES;
    [self countTotalNumBySQL];
//
//    
//    
//    
//    CATransition *animation = [CATransition animation];
//    animation.duration = 0.15f;
//    CABasicAnimation *shakeAnimation = [CABasicAnimation animationWithKeyPath:@"transform.translation.y"];
//    shakeAnimation.duration = 0.15f;
//    shakeAnimation.fromValue = [NSNumber numberWithFloat:-5];
//    shakeAnimation.toValue = [NSNumber numberWithFloat:5];
//    shakeAnimation.autoreverses = YES;
//    [imageView.layer addAnimation:shakeAnimation forKey:nil];
//    [self performSelector:@selector(end:) withObject:imageView afterDelay:0.15];
}
- (void)end:(UIImageView *)imageView{
    [self countTotalNumBySQL];
    [imageView removeFromSuperview];
    self.view.userInteractionEnabled = YES;
}

- (NSString *)getTypeFromePlist:(NSString *)tel{
    NSString *typeNum = @"";
    NSArray *paths=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
    NSString *path=[paths objectAtIndex:0];
    NSString *filename = [path stringByAppendingPathComponent:FileName];
    NSMutableArray *arr = [[NSMutableArray alloc] initWithContentsOfFile:filename];
    for (int i = 0; i<arr.count; i++) {
        NSDictionary *d = arr[i];
        NSString *tel1 = [d objectForKey:@"tel"];
        if ([tel isEqualToString:tel1]) {
            return  [d objectForKey:@"type"];
        }
    }
    
    return typeNum;
}
- (void)insertPlist:(NSDictionary *)personDic{
    NSString *telPhoneNum = [personDic objectForKey:@"tel"];
    NSArray *paths=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
    NSString *path=[paths objectAtIndex:0];
    NSString *filename = [path stringByAppendingPathComponent:FileName];
    NSMutableArray *arr = [[NSMutableArray alloc] initWithContentsOfFile:filename];
    BOOL inarr = NO;
    for (int i = 0; i<arr.count; i++) {
        NSDictionary *d = arr[i];
        NSString *tel = [d objectForKey:@"telPhoneNum"];
        if ([tel isEqualToString:telPhoneNum]) {
            inarr = YES;
        }
    }
    if (inarr == NO) {
        [arr addObject:personDic];
        [arr writeToFile:filename atomically:YES];
    }
}

//、、添加购物车 结束
//- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag :(UIImageView *)imageView
//{
//    
//    if (anim == [layer animationForKey:@"group"]) {
//        
//        [layer removeFromSuperlayer];
//        layer = nil;
//
//        
//        
//        
//        CATransition *animation = [CATransition animation];
//        animation.duration = 0.15f;
//               CABasicAnimation *shakeAnimation = [CABasicAnimation animationWithKeyPath:@"transform.translation.y"];
//        shakeAnimation.duration = 0.15f;
//        shakeAnimation.fromValue = [NSNumber numberWithFloat:-5];
//        shakeAnimation.toValue = [NSNumber numberWithFloat:5];
//        shakeAnimation.autoreverses = YES;
//        [imageView.layer addAnimation:shakeAnimation forKey:nil];
//    }
//}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
