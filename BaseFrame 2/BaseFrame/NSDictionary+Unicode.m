//
//  NSDictionary+Unicode.m
//  BaseFrame
//
//  Created by yons on 16/4/18.
//  Copyright © 2016年 xiaojiang. All rights reserved.
//

#import "NSDictionary+Unicode.h"

@implementation NSDictionary (Unicode)
- (NSString*)my_description {
    NSString *desc = [self my_description];
    desc = [NSString stringWithCString:[desc cStringUsingEncoding:NSUTF8StringEncoding] encoding:NSNonLossyASCIIStringEncoding];
    return desc;
}
@end
