//
//  ZfbProduct.m
//  zfbdemo
//
//  Created by yons on 16/2/18.
//  Copyright © 2016年 jyc. All rights reserved.
//

#import "ZfbProduct.h"
#import "Order.h"
#import "DataSigner.h"
#import <AlipaySDK/AlipaySDK.h>

#import "APAuthV2Info.h"
#import "Weburl.h"

@implementation ZfbProduct

// 仅含有变化的参数
+ (void)alipayWithPartner:(NSString *)partner
                   seller:(NSString *)seller
                  tradeNO:(NSString *)tradeNO
              productName:(NSString *)productName
       productDescription:(NSString *)productDescription
                   amount:(NSString *)amount
                notifyURL:(NSString *)notifyURL
                   itBPay:(NSString *)itBPay
             resultStatus:(resultStatusBlock)block{
    [self alipayWithPartner:partner seller:seller tradeNO:tradeNO productName:productName productDescription:productDescription amount:amount notifyURL:notifyURL service:@"mobile.securitypay.pay" paymentType:@"1" inputCharset:@"UTF-8" itBPay:itBPay privateKey:kPrivateKey appScheme:kAppScheme resultStatus:block];
    
}

// 包含所有必要的参数
+ (void)alipayWithPartner:(NSString *)partner
                   seller:(NSString *)seller
                  tradeNO:(NSString *)tradeNO
              productName:(NSString *)productName
       productDescription:(NSString *)productDescription
                   amount:(NSString *)amount
                notifyURL:(NSString *)notifyURL
                  service:(NSString *)service
              paymentType:(NSString *)paymentType
             inputCharset:(NSString *)inputCharset
                   itBPay:(NSString *)itBPay
               privateKey:(NSString *)privateKey
                appScheme:(NSString *)appScheme
             resultStatus:(resultStatusBlock)block{
    
    Order *order = [[Order alloc] init];
    order.partner = partner;
    order.seller = seller;
    order.tradeNO = tradeNO;
    order.productName = productName;
    order.productDescription = productDescription;
    order.amount = amount;
    order.notifyURL = notifyURL;
    order.service = service;
    order.paymentType = paymentType;
    order.inputCharset = inputCharset;
    order.itBPay = itBPay;
    
    
    // 将商品信息拼接成字符串
    NSString *orderSpec = [order description];
    
    // 获取私钥并将商户信息签名,外部商户可以根据情况存放私钥和签名,只需要遵循 RSA 签名规范, 并将签名字符串 base64 编码和 UrlEncode
    
    NSString *signedString = [self genSignedStringWithPrivateKey:kPrivateKey OrderSpec:orderSpec];
//     NSLog(@"signedString = %@",signedString);
    // 调用支付接口

    [self payWithAppScheme:appScheme orderSpec:orderSpec signedString:signedString resultStatus:block];
    

    NSLog(@"orderSpec = %@",orderSpec);
    
}

// 生成signedString
+ (NSString *)genSignedStringWithPrivateKey:(NSString *)privateKey OrderSpec:(NSString *)orderSpec {
    
    // 获取私钥并将商户信息签名,外部商户可以根据情况存放私钥和签名,只需要遵循 RSA 签名规范, 并将签名字符串 base64 编码和 UrlEncode
    
    id<DataSigner> signer = CreateRSADataSigner(privateKey);
    return [signer signString:orderSpec];
}

// 支付
+ (void)payWithAppScheme:(NSString *)appScheme orderSpec:(NSString *)orderSpec signedString:(NSString *)signedString resultStatus:(resultStatusBlock)block{
    // 将签名成功字符串格式化为订单字符串,请严格按照该格式
    NSString *orderString = nil;
    if (signedString != nil) {
        orderString = [NSString stringWithFormat:@"%@&sign=\"%@\"&sign_type=\"%@\"", orderSpec, signedString, @"RSA"];
        [[AlipaySDK defaultService] payOrder:orderString fromScheme:appScheme callback:^(NSDictionary *resultDic) {
            
        NSLog(@"RSAreslut回调 = %@",resultDic);
        NSString *resultStatus = [NSString stringWithFormat:@"%@",resultDic[@"resultStatus"]];
        block(resultStatus);
//        [[NSNotificationCenter defaultCenter] postNotificationName:AliPay object:resultStatus];

//        NSString *resultstring = resultDic[@"result"];
//             NSLog(@"resultstring = %@",resultstring);
//        resultstring=[resultstring stringByReplacingOccurrencesOfString:@"\\" withString:@""];
//        resultstring=[resultstring stringByReplacingOccurrencesOfString:@"\"" withString:@""];
//        resultstring=[resultstring stringByReplacingOccurrencesOfString:@"=" withString:@""];
//        resultstring=[resultstring stringByReplacingOccurrencesOfString:@"partner" withString:@""];
//        resultstring=[resultstring stringByReplacingOccurrencesOfString:@"seller_id" withString:@""];
//        resultstring=[resultstring stringByReplacingOccurrencesOfString:@"out_trade_no" withString:@""];
//        resultstring=[resultstring stringByReplacingOccurrencesOfString:@"subject" withString:@""];
//        resultstring=[resultstring stringByReplacingOccurrencesOfString:@"body" withString:@""];
//        resultstring=[resultstring stringByReplacingOccurrencesOfString:@"total_fee" withString:@""];
//        resultstring=[resultstring stringByReplacingOccurrencesOfString:@"notify_url" withString:@""];
//        resultstring=[resultstring stringByReplacingOccurrencesOfString:@"service" withString:@""];
//        resultstring=[resultstring stringByReplacingOccurrencesOfString:@"payment_type" withString:@""];
//        resultstring=[resultstring stringByReplacingOccurrencesOfString:@"_input_charset" withString:@""];
//        resultstring=[resultstring stringByReplacingOccurrencesOfString:@"it_b_pay" withString:@""];
//        resultstring=[resultstring stringByReplacingOccurrencesOfString:@"success" withString:@""];
//        resultstring=[resultstring stringByReplacingOccurrencesOfString:@"sign_type" withString:@""];
//        resultstring=[resultstring stringByReplacingOccurrencesOfString:@"sign" withString:@""];
//        NSArray *arry=[resultstring componentsSeparatedByString:@"&"];
//        NSString *partner=@"";
//        NSString *seller_id=@"";
//        NSString *out_trade_no=@"";
//        NSString *subject=@"";
//        NSString *body=@"";
//        NSString *total_fee=@"";
//        NSString *notify_url=@"";
//        NSString *service=@"";
//        NSString *payment_type=@"";
//        NSString *_input_charset=@"";
//        NSString *it_b_pay=@"";
//        NSString *success=@"";
//        NSString *sign_type=@"";
//        NSString *sign=@"";
//        NSString *resultStatus = [NSString stringWithFormat:@"%@",resultDic[@"resultStatus"]];
//        if (resultstring.length!=0) {
//           partner=[arry objectAtIndex:0];
//           seller_id=[arry objectAtIndex:1];
//           out_trade_no=[arry objectAtIndex:2];
//           subject=[arry objectAtIndex:3];
//            body=[arry objectAtIndex:4];
//            total_fee=[arry objectAtIndex:5];
//            notify_url=[arry objectAtIndex:6];
//           service=[arry objectAtIndex:7];
//            payment_type=[arry objectAtIndex:8];
//            _input_charset=[arry objectAtIndex:9];
//            it_b_pay=[arry objectAtIndex:10];
//            success=[arry objectAtIndex:11];
//            sign_type=[arry objectAtIndex:12];
//            sign=[arry objectAtIndex:13];
//            resultStatus=[NSString stringWithFormat:@"%@",resultDic[@"resultStatus"]];
//        }
        //发送通知

            
//        [[NSNotificationCenter defaultCenter] postNotificationName:AliPay object:resultStatus];
            
            //            NSLog(@"arry---%@\n", arry);
            //            NSLog(@"arry---%@\n", [arry objectAtIndex:0]);
//            NSString *urlstring =[NSString stringWithFormat:@"%@",IPAddress];
//            
//            ASIFormDataRequest* request = [ASIFormDataRequest requestWithURL:[NSURL URLWithString:urlstring]];
//            
//       
//            [request addPostValue:@"GetZfbFinshCansMing" forKey:@"action"];
//            
//            [request addPostValue:@"1" forKey:@"payment"];
//            [request addPostValue:service forKey:@"service"];
//            [request addPostValue:partner forKey:@"partner"];
//            [request addPostValue:_input_charset forKey:@"_input_charset"];
//            [request addPostValue:sign_type forKey:@"sign_type"];
//            [request addPostValue:sign forKey:@"sign"];
//            [request addPostValue:notify_url  forKey:@"notify_url"];
//            [request addPostValue:@"" forKey:@"app_id"];
//            [request addPostValue:@"" forKey:@"appenv"];
//            [request addPostValue:out_trade_no forKey:@"out_trade_no"];
//            [request addPostValue:subject forKey:@"subject"];
//            [request addPostValue:payment_type forKey:@"payment_type"];
//            [request addPostValue:seller_id forKey:@"seller_id"];
//            [request addPostValue:total_fee forKey:@"total_fee"];
//            [request addPostValue:body forKey:@"body"];
//            [request addPostValue:@"" forKey:@"goods_type"];
//            [request addPostValue:@"" forKey:@"rn_check"];
//            [request addPostValue:it_b_pay forKey:@"it_b_pay"];
//            [request addPostValue:@"" forKey:@"extern_token"];
//            [request addPostValue:@"" forKey:@"out_context"];
//            [request addPostValue:resultStatus forKey:@"resultStatus"];
//            [request addPostValue:success forKey:@"success"];
//            
//            [request setRequestMethod:@"POST"];
//            
//            __weak typeof(ASIFormDataRequest) *req = request;
//            
//            [request setCompletionBlock:^{
//                
//                //解析json
//                NSData *jsonData = [req.responseString dataUsingEncoding:NSUTF8StringEncoding];
//                
//                NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:nil];
//                
//                NSLog(@"dic支付宝--%@",dic);
//                int result = [[NSString stringWithFormat:@"%@",[dic objectForKey:@"Result"]]intValue];
//                if (result == 0)
//                {
//                    
//                    NSUserDefaults *witch = [NSUserDefaults standardUserDefaults];
//                    NSString *payStyle = [NSString stringWithFormat:@"%@",[witch objectForKey:@"cheatment"]];
//                    
//                    NSLog(@"payStyle支付宝---%@",payStyle);
//                    
//                    NSDictionary *dict = [[NSDictionary alloc]initWithObjectsAndKeys:payStyle,@"返回值", nil];
//                    NSNotification *notice =[NSNotification notificationWithName:@"zhifuNotice" object:nil userInfo:dict];
//                    [[NSNotificationCenter defaultCenter]postNotification:notice];
//                }
//                
//                else{
//                
//                    [MBProgressHUD showError:@"支付失败！"];
//                
//                }
//                
//            }];
//            //回调
//            [request setFailedBlock:^{
//                [MBProgressHUD showError:@"获取信息失败！"];
//            }];
//            
//            [request startAsynchronous];
//
        }];
    }
}


@end


@implementation AlipayToolKit


+ (NSString *)genTradeNoWithTime
{
    static int kNumber = 15;
    
    NSString *sourceStr = @"0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    NSMutableString *resultStr = [[NSMutableString alloc] init];
    srand(time(0));
    for (int i = 0; i < kNumber; i++)
    {
        unsigned index = rand() % [sourceStr length];
        NSString *oneStr = [sourceStr substringWithRange:NSMakeRange(index, 1)];
        [resultStr appendString:oneStr];
    }
   
 return resultStr;
    
   
}
@end
