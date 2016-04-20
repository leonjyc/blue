//
//  ZfbProduct.h
//  zfbdemo
//
//  Created by yons on 16/2/18.
//  Copyright © 2016年 jyc. All rights reserved.
//


#import <Foundation/Foundation.h>   // 导入Foundation，防止某些类出现类似：“Cannot find interface declaration for 'NSObject', superclass of 'Base64'”的错误提示

/**
 *  partner:合作身份者ID,以 2088 开头由 16 位纯数字组成的字符串。
 *
 */
#define kPartnerID @"2088121754090861"


/**
 *  seller:支付宝收款账号,手机号码或邮箱格式。
 */
#define kSellerAccount @"wy@taitaigo.cn"

/**
 *  支付宝服务器主动通知商户 网站里指定的页面 http 路径。
 */
#define kNotifyURL @"http://ttgtext.hbung.com/zhifubao/notify_url.aspx"
//#define kNotifyURL @"http://xxx.com"

/**
 *  appSckeme:应用注册scheme,在Info.plist定义URLtypes，处理支付宝回调
 */
#define kAppScheme @"zfburlttg"



#define kPrivateKey @"MIICeAIBADANBgkqhkiG9w0BAQEFAASCAmIwggJeAgEAAoGBAOup55rex/LeE/ZOeY1fTF3cp4zpF6tGURv7NPcfEZDXotGbXijr1PPYpdtN5EJTDpZzwWwn/bmxm5snYMwpMHGVpI6IC/cGl24rBULf/5GkHiz4BT4TcxapFrvtF03s6doOhcVxltuQ82giafJQvdOAM80EWqYdt3i83hG3o899AgMBAAECgYB8VcMVSa7yq0qa7CJjfUEcUHux85UCT3IhsjLqouCwq6SCtFdEfdB36vjusLTabVnH9UC6oIrUOyme/XKrpJuifoNOovohBHVw2fcpGu4u6U0NrCb9KxEjyjNQYpNgfT0shXah3RmLDbMpVN5GW46cTry/WergAdok4A4nb8janQJBAP1uGBYjnHbNjBTqDV16t84nj8Pj829rm+SPyGJR1SiLWRWs4Ed84TVSP6ax9TXbIp5Xb8itIo/uet7eGpUcZ1cCQQDuDbBkYffSGcopakunYVJIuNKL1mo3po7UUZDbrJCjwCssKV8moEf4RPdaBu7xX3IFj7R3fbsEeUjlPZNr4h9LAkEAoa+fxmAp7tHs0VsR89XbdrdezYedRDTPXN8u5St4Z0mgKGgHHxTZSf+ThHJ9E0Mfrw3xz4JGTrXDxnTFWOSqOQJBAL0vDdbI8Lz9F+eP/S25Lz5x+4l8Tg+KA4qCg//AhXZNe0HuYxr8WBXbIURfrDcQ5jm7Oe2Ycy8cAC2GoQkkvD8CQQCGjT/mfN0C8zhO4lYte6xyLCxgeitTO7kHaQwI8j+ngpJKP0V+7Ep029meH/GikoEsb4iUgt5+6n3izmGRr2e7"

@interface ZfbProduct : NSObject
//状态
typedef void (^resultStatusBlock)(NSString *resultStatus);
@property (copy, nonatomic)resultStatusBlock block;
/**
 *  配置请求信息，仅有变化且必要的参数
 *
 *  @param partner            合作者身份ID
 *  @param seller             卖家支付宝账号
 *  @param tradeNO            商户网站唯一订单号
 *  @param productName        商品名称
 *  @param productDescription 商品详情
 *  @param amount             总金额
 *  @param notifyURL          服务器异步通知页面路径
 *  @param itBPay             未付款交易的超时时间
 */
+ (void)alipayWithPartner:(NSString *)partner
                   seller:(NSString *)seller
                  tradeNO:(NSString *)tradeNO
              productName:(NSString *)productName
       productDescription:(NSString *)productDescription
                   amount:(NSString *)amount
                notifyURL:(NSString *)notifyURL
                   itBPay:(NSString *)itBPay
             resultStatus:(resultStatusBlock)block;

@end

/**
 *  支付宝的一些参数的生成
 */
@interface AlipayToolKit : NSObject

+ (NSString *)genTradeNoWithTime;


@end




