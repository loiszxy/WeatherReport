//
//  ViewController.m
//  WeatherReport
//
//  Created by 赵小燕 on 14-12-18.
//  Copyright (c) 2014年 zhaoxiaoyan. All rights reserved.
//

#import "ViewController.h"
#import "RequestWeatherHandle.h"
#define kurl @"http://api.map.baidu.com/telematics/v3/weather"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *label1;

@end

@implementation ViewController

-(void)request:(id)sender
{
    RequestWeatherHandle *request = [RequestWeatherHandle getHandle];
    [request requestweather:kurl location:@"苏州"];
    [request copyWithSuccessBlock:^(NSMutableData *data) {
        //请求成功之后开始解析数据
        NSMutableDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        NSString *str = [dic objectForKey:@"result"];
         NSLog(@"%@",str);
                NSLog(@"%@",dic[@"result"]);
        
    } fail:^(NSError *error) {
        
        }];

    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
