//
//  RequestWeatherHandle.h
//  WeatherReport
//
//  Created by 赵小燕 on 14-12-18.
//  Copyright (c) 2014年 zhaoxiaoyan. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^SuccessBlock)(NSMutableData *data);
typedef void (^FailBlock)(NSError *error);

@interface RequestWeatherHandle : NSObject<NSURLConnectionDataDelegate>

@property (nonatomic,copy) SuccessBlock successBlock;
@property (nonatomic,copy) FailBlock failBlock;

- (void)copyWithSuccessBlock:(SuccessBlock)successBlock
                        fail:(FailBlock)failBlock;

+ (RequestWeatherHandle *)getHandle;

-(void)requestweather:(NSString *)URLString
             location:(NSString *)location
               output:(NSString *)output
                   ak:(NSString *)ak;

@end
