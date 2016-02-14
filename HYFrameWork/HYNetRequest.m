//
//  HYNetRequest.m
//  HYFrameWork
//
//  Created by GE on 16/2/14.
//  Copyright © 2016年 HY. All rights reserved.
//

#import "HYNetRequest.h"

@implementation HYNetRequest

#pragma mark - 把字典转化为json字符串用来打印
+(NSString *)jsonStringWithDict:(NSDictionary *)dict
{
    NSError * err;
    NSData * data = [NSJSONSerialization dataWithJSONObject:dict options:NSJSONWritingPrettyPrinted error:&err];
    NSString * json = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
    return json;
}


/*Post请求*/
+(void)requestWithUrl:(NSString *)url
          andPostDict:(NSDictionary *)postDict
            successed:(RequestSuccessed)successed
               failed:(RequestFailed)failed
{
    
//    NSLog(@"param = %@",postDict);
//    NSLog(@"url = %@",url);
    AFHTTPRequestOperationManager * manager = [AFHTTPRequestOperationManager manager];
    
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/json", @"text/plain", @"text/html",nil];

    //判断输入地址是否重复输入"/"
    NSString * str = [url substringFromIndex:url.length - 1];
    if([str isEqualToString:@"/"])
    {
        url = [url substringToIndex:url.length - 1];
    }

    NSString * finalUrl = [URL_BASE stringByAppendingString:url];
//    NSLog(@"newUrl = %@",finalUrl);
    
    [manager POST:finalUrl parameters:postDict success:^(AFHTTPRequestOperation *operation, id responseObject) {
//    NSLog(@"请求结果的Json串为:%@", [self jsonStringWithDict:responseObject]);

        successed(responseObject);
        
    } failure:^(AFHTTPRequestOperation * operation, NSError *error) {
//        NSLog(@"请求错误原因是：%@", error);

        failed(error);
        
    }];
}

/*Get请求*/
+ (void)getDataWithUrl:(NSString *)url
         andParameters:(id)parameters
             successed:(RequestSuccessed)successed
                failed:(RequestFailed)failed
{
    NSLog(@"param = %@",parameters);
    AFHTTPRequestOperationManager * manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/plain",@"text/html",@"text/json",nil];
    //判断输入地址是否重复输入"/"
    NSString * str = [url substringFromIndex:url.length - 1];
    if([str isEqualToString:@"/"])
    {
        url = [url substringToIndex:url.length - 1];
    }
    
    NSString * finalUrl = [URL_BASE stringByAppendingString:url];
    //    NSLog(@"newUrl = %@",finalUrl);
    [manager GET:finalUrl parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        NSLog(@"请求结果的Json串为:%@", [self jsonStringWithDict:responseObject]);
        successed(responseObject);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        //NSLog(@"Error: %@", error);
        failed(error);
        
    }];
    
}



/*Put请求*/
+ (void)putDataWithUrl:(NSString *)url
         andParameters:(id)parameters
             successed:(RequestSuccessed)successed
                failed:(RequestFailed)failed
{
//    NSLog(@"param = %@",parameters);
    AFHTTPRequestOperationManager * manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/json", @"text/plain", @"text/html",nil];
    //判断输入地址是否重复输入"/"
    NSString * str = [url substringFromIndex:url.length - 1];
    if([str isEqualToString:@"/"])
    {
        url = [url substringToIndex:url.length - 1];
    }
    
    NSString * finalUrl = [URL_BASE stringByAppendingString:url];
    //    NSLog(@"newUrl = %@",finalUrl);
    [manager PUT:finalUrl parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        successed(responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        failed(error);
    }];
    
}

/*Delete请求*/
+ (void)deleteDataWithUrl:(NSString *)url
            andParameters:(id)parameters
                successed:(RequestSuccessed)successed
                   failed:(RequestFailed)failed
{
//    NSLog(@"param = %@",parameters);
    AFHTTPRequestOperationManager * manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/json", @"text/plain", @"text/html",nil];
    //判断输入地址是否重复输入"/"
    NSString * str = [url substringFromIndex:url.length - 1];
    if([str isEqualToString:@"/"])
    {
        url = [url substringToIndex:url.length - 1];
    }
    
    NSString * finalUrl = [URL_BASE stringByAppendingString:url];
    //    NSLog(@"newUrl = %@",finalUrl);
    [manager DELETE:finalUrl parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        successed(responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        failed(error);
    }];
    
}

@end
