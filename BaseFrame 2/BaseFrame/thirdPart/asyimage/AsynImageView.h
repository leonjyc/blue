//
//  AsynImageView.h
//  Mapbaidu
//
//  Created by yons on 15/11/27.
//  Copyright (c) 2015年 於Fish. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AsynImageView : UIImageView
{
    NSURLConnection *connection;
    NSMutableData *loadData;
}
//图片对应的缓存在沙河中的路径
@property (nonatomic, retain) NSString *fileName;

//指定默认未加载时，显示的默认图片
@property (nonatomic, retain) UIImage *placeholderImage;
//请求网络图片的URL
@property (nonatomic, retain) NSString *imageURL;

@property NSInteger row;
@property NSInteger section;
@end
