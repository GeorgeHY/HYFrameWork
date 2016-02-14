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
+(void)requestWithUrl:(NSString *)url andPostDict:(NSDictionary *)postDict successed:(RequestSuccessed)successed failed:(RequestFailed)failed
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




//+(void)imageRequestWithUrl:(NSString *)url postDict:(NSDictionary *)dict image:(UIImage *)image successed:(RequestSuccessed)successed failed:(RequestFailed)failed
//{
//     NSString * newUrl = [URL_BASE stringByAppendingString:url];
//    AFHTTPRequestOperationManager *manager = [[AFHTTPRequestOperationManager alloc] init];
//
//    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
//
//    manager.responseSerializer.acceptableContentTypes =[NSSet setWithObject:@"text/html"];
//
//    [manager POST:newUrl parameters:dict constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
//
//        [formData appendPartWithFileData:UIImageJPEGRepresentation(image, 0.5) name:@"uploadedfile" fileName:[[TimeTool since1970Time] stringByAppendingString:@".png"] mimeType:@"png"];
//        NSLog(@"%@",[[TimeTool since1970Time] stringByAppendingString:@".jpg"]);
//
//    } success:^(AFHTTPRequestOperation *operation, id responseObject) {
//
//        successed(responseObject);
//
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        if([[error localizedDescription] isEqualToString:@"Request failed: unauthorized (401)"]){
//            //重新登陆
//            [[AppDelegate shareInstance] setLoginVC];
//        }
//        failed(error);
//    }];
//}

//+(void)imageRequestWithUrl:(NSString *)url postDict:(NSDictionary *)dict images:(NSArray *)images successed:(RequestSuccessed)successed failed:(RequestFailed)failed
//{
////    NSString * newUrl = [URL_BASE stringByAppendingString:url];
//    AFHTTPRequestOperationManager *manager = [[AFHTTPRequestOperationManager alloc] init];
//
//    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
//
//    manager.responseSerializer.acceptableContentTypes =[NSSet setWithObject:@"text/html"];
//
//        [manager POST:url parameters:dict constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
//
//
//            for (UIImage * curImage in images) {
//                [formData appendPartWithFileData:UIImageJPEGRepresentation(curImage, 0.5) name:@"image1" fileName:@"image1.jpg" mimeType:@"image/jpeg"];
//            }
//            [formData appendPartWithFileData:UIImageJPEGRepresentation(image, 0.5) name:@"uploadedfile" fileName:[[TimeTool since1970Time] stringByAppendingString:@".png"] mimeType:@"png"];
//            NSLog(@"%@",[[TimeTool since1970Time] stringByAppendingString:@".jpg"]);
//
//        } success:^(AFHTTPRequestOperation *operation, id responseObject) {
//
//            successed(responseObject);
//
//        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//            if([[error localizedDescription] isEqualToString:@"Request failed: unauthorized (401)"]){
//                //重新登陆
//                [[AppDelegate shareInstance] setLoginVC];
//            }
//            failed(error);
//        }];
//
//
//
//}


+(void)requestTokenWithUrl:(NSString *)url successed:(RequestSuccessed)successed failed:(RequestFailed)failed andKeyVaulePairs:(NSString *)firstobj,...NS_REQUIRES_NIL_TERMINATION
{
    NSMutableArray * keys = [[NSMutableArray alloc]init];
    
    NSMutableArray * values = [[NSMutableArray alloc]init];
    
    va_list arg_ptr;
    
    va_start(arg_ptr, firstobj);
    
    if(nil == firstobj)
    {
        return;
    }
    [keys addObject:firstobj];
    
    NSObject * temp = nil;
    
    NSInteger i  = 1;
    
    while((temp = va_arg(arg_ptr, NSObject *)))
    {
        if (i % 2 == 1)
        {
            [values addObject:temp];
        }else{
            [keys addObject:temp];
        }
        i++;
    }
    if(i % 2 == 1)
    {
        NSLog(@"变长参数的个数是奇数");
        NSLog(@"最后一个参数是%ld", (long)i);
        
        return;
    }
    
    NSDictionary * postDict = [NSDictionary dictionaryWithObjects:values forKeys:keys];
    
    NSLog(@"请求字典是%@", postDict);
    
    AFHTTPRequestOperationManager * manager = [AFHTTPRequestOperationManager manager];
    
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/json", @"text/plain", @"text/html",nil];
    
    //    NSString * str = [url substringFromIndex:url.length - 1];
    //    if([str isEqualToString:@"/"])
    //    {
    //        url = [url substringToIndex:url.length - 1];
    //    }
    //
    //    NSString * newUrl = [URL_BASE_LOGIN stringByAppendingString:url];
    
    NSLog(@"请求地址是%@", url);
    [manager POST:url parameters:postDict success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"请求结果的Json串为:%@", [self jsonStringWithDict:responseObject]);
        successed(responseObject);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"请求错误原因是：%@", error);
        if([[error localizedDescription] isEqualToString:@"Request failed: unauthorized (401)"]){

        }
        failed(error);
    }];
    
}
//put请求
+ (void)putDataWithUrl:(NSString *)url
         andParameters:(id)parameters
             successed:(RequestSuccessed)successed
                failed:(RequestFailed)failed
{
    NSLog(@"param = %@",parameters);
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/json", @"text/plain", @"text/html",nil];
    //    NSString * str = [url substringFromIndex:url.length - 1];
    //    if([str isEqualToString:@"/"])
    //    {
    //        url = [url substringToIndex:url.length - 1];
    //    }
    //    NSString * newUrl = [URL_BASE stringByAppendingString:url];
    NSLog(@"put请求url为 = %@",url);
    [manager PUT:url parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        successed(responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if([[error localizedDescription] isEqualToString:@"Request failed: unauthorized (401)"]){

        }
        failed(error);
    }];
    
}
//delete请求
+ (void)deleteDataWithUrl:(NSString *)url
            andParameters:(id)parameters
                successed:(RequestSuccessed)successed
                   failed:(RequestFailed)failed
{
    NSLog(@"param = %@",parameters);
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/json", @"text/plain", @"text/html",nil];
    //    NSString * str = [url substringFromIndex:url.length - 1];
    //    if([str isEqualToString:@"/"])
    //    {
    //        url = [url substringToIndex:url.length - 1];
    //    }
    //    NSString * newUrl = [URL_BASE stringByAppendingString:url];
    NSLog(@"put请求url为 = %@",url);
    [manager DELETE:url parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        successed(responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if([[error localizedDescription] isEqualToString:@"Request failed: unauthorized (401)"]){
        }
        failed(error);
    }];
    
}

@end
