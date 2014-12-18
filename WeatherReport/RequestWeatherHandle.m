//
//  RequestWeatherHandle.m
//  WeatherReport
//
//  Created by 赵小燕 on 14-12-18.
//  Copyright (c) 2014年 zhaoxiaoyan. All rights reserved.
//

#import "RequestWeatherHandle.h"

@implementation RequestWeatherHandle


+ (RequestWeathertHandle *)getHandle
{
    RequestWeatherHandle *request = [[RequestWeatherHandle alloc] init];
    return  request;
}

-(void)requestweather:(NSString *)URLString
             location:(NSString *)location
               output:(NSString *)output
                   ak:(NSString *)ak
{
    NSString *urlString = [NSString stringWithFormat:@"%@",URLString];
    NSURL *url = [NSURL URLWithString:urlString];
    //2.创建NSMutableURLRequest对象
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    //3.设置请求体
    //(1)将请求参数读成字符串对象
    NSString *paraString  = [NSString stringWithFormat:@"location=%@&output=%@&ak=%@",location,@"json",@"59daba8e508bb690ad65b053d917fe56"];
    //(2)转为NSData对象
    NSData *parmData = [paraString dataUsingEncoding:NSUTF8StringEncoding];
    //将data对象转为请求体
    [request setHTTPBody:parmData];
    //    [request setTimeoutInterval:30.0f];
    //4.设置请求方式
    [request setHTTPMethod:@"POST"];
    [NSURLConnection connectionWithRequest:request delegate:self];
}


- (void)copyWithSuccessBlock:(SuccessBlock)successBlock
                        fail:(FailBlock)failBlock
{
    self.successBlock = successBlock;
    self.failBlock = failBlock;
}

@end


