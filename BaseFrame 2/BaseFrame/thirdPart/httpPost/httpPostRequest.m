//
//  httpPostRequest.m
//  ttg
//
//  Created by yons on 16/2/29.
//  Copyright © 2016年 xiaojiang. All rights reserved.
//

#import "httpPostRequest.h"

@implementation httpPostRequest
+(void)getDataByPostAshx:(NSString *)ashx and:(NSDictionary *)parameter withFinishBlock:(GetDataDidFinishBlock)finishBlock{
    AFSecurityPolicy *securityPolicy = [[AFSecurityPolicy alloc] init];
    [securityPolicy setAllowInvalidCertificates:YES];
    AFHTTPRequestOperationManager *manger = [AFHTTPRequestOperationManager  manager];
    [manger setSecurityPolicy:securityPolicy];
    manger.responseSerializer = [AFJSONResponseSerializer new];
    manger.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/plain",@"text/html", nil];
    manger.requestSerializer.timeoutInterval = 30;
    NSString *ip = [NSString stringWithFormat:@"%@%@",IPAddress,ashx];
    [manger POST:ip parameters:parameter success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        NSDictionary *responseDic = [operation.responseData objectFromJSONData];
        NSError *error;
        NSDictionary *responseDic = [NSJSONSerialization JSONObjectWithData:operation.responseData  options:NSJSONReadingMutableLeaves error:&error];
        if(finishBlock)
        {
            finishBlock(responseDic,nil);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"error %@",error);
        if(finishBlock)
        {
            finishBlock(nil,error);
        }
    }];

}
+(void)asiGetDataPost:(NSDictionary *)parameter withFinishBlock:(GetDataDidFinishBlock)finishBlock{
    ASIFormDataRequest* request = [ASIFormDataRequest requestWithURL:[NSURL URLWithString:IPAddress]];
    __weak typeof(ASIFormDataRequest) *req = request;
    for (int i = 0; i<parameter.count; i++) {
        NSString *key = [[parameter allKeys] objectAtIndex:i];
        [request addPostValue:[parameter objectForKey:key] forKey:key];
    }
    [request setCompletionBlock:^{
        [MBProgressHUD hideHUD];
        //解析json
        NSData *jsonData = [req.responseString dataUsingEncoding:NSUTF8StringEncoding];
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:nil];
        if(finishBlock)
        {
            finishBlock(dic,nil);
        }
    }];
    
    //回调
    [request setFailedBlock:^{
        NSError *error;
        if(finishBlock)
        {
            finishBlock(nil,error);
        }
    }];
    
    [request startAsynchronous];
}
@end
