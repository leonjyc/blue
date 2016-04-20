//
//  NSString+Extension.m
//  01-QQ聊天布局
//
//  Created by apple on 14-4-2.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "NSString+Extension.h"

@implementation NSString (Extension)

- (CGSize)sizeWithFont:(UIFont *)font maxSize:(CGSize)maxSize
{
    NSDictionary *attrs = @{NSFontAttributeName : font};
    return [self boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
}
//手机号
-(BOOL)isDigit
{
    NSString *regex = @"^1[3|4|5|7|8|][0-9]{9}$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    BOOL isMatch = [pred evaluateWithObject:self];
    
    return isMatch;
}
//身份证
- (BOOL)isIdNum{
    NSString *regex = @"^([0-9]{15}$|^[0-9]{18}$|^[0-9]{17}([0-9]|X|x))$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    BOOL isMatch = [pred evaluateWithObject:self];
    
    return isMatch;
}
//车牌
- (BOOL)isChepai{
    NSString *regex = @"^[\u4e00-\u9fa5]{1}[A-Z0-9a-z]{6}$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    BOOL isMatch = [pred evaluateWithObject:self];
    
    return isMatch;
}
//获取图片路径
+ (NSString *)getImageDocumentsPath:(NSString *)imageUrl
{
    NSArray *componets = [imageUrl componentsSeparatedByString:@"/"];
    long index = [componets count] - 1;
    NSString *imageName = [componets objectAtIndex:index];
    
    NSString *imageFilePath = [NSString stringWithFormat:@"%@/Documents/%@",NSHomeDirectory(),imageName];
    
    return imageFilePath;
}
//1. 获取plist文件路径
+ (NSString *)dataFileName
{
    NSArray *paths=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
    
    NSString *path=[paths  objectAtIndex:0];
    
    NSString *filename=[path stringByAppendingPathComponent:@"test.plist"];
    
//    NSFileManager *fm = [NSFileManager defaultManager];
//    [fm createFileAtPath:filename contents:nil attributes:nil];
    
    return filename;
}
+(NSString*)DataTOjsonString:(id)object
{
    NSString *jsonString = nil;
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:object
                                                       options:NSJSONWritingPrettyPrinted // Pass 0 if you don't care about the readability of the generated string
                                                         error:&error];
    if (! jsonData) {
        NSLog(@"Got an error: %@", error);
    } else {
        jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    }
    return jsonString;
}
//float
- (BOOL)isxiaoshu{
    NSScanner* scan = [NSScanner scannerWithString:self];
    
    float val;
    
    return[scan scanFloat:&val] && [scan isAtEnd];
}
@end
