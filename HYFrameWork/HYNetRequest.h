//
//  HYNetRequest.h
//  HYFrameWork
//
//  Created by GE on 16/2/14.
//  Copyright © 2016年 HY. All rights reserved.
//

typedef void (^RequestSuccessed) (NSDictionary * dict);

typedef void (^RequestFailed) (NSError * err);

#import <Foundation/Foundation.h>

@interface HYNetRequest : NSObject

///json转化
+(NSString *)jsonStringWithDict:(NSDictionary *)dict;
///post方法
+(void)requestWithUrl:(NSString *)url
          andPostDict:(NSDictionary *)postDict
            successed:(RequestSuccessed)successed
               failed:(RequestFailed)failed;

///get方法
+ (void)getDataWithUrl:(NSString *)url
         andParameters:(id)parameters
             successed:(RequestSuccessed)successed
                failed:(RequestFailed)failed;
///put方法
+ (void)putDataWithUrl:(NSString *)url
         andParameters:(id)parameters
             successed:(RequestSuccessed)successed
                failed:(RequestFailed)failed;
///delete方法
+ (void)deleteDataWithUrl:(NSString *)url
            andParameters:(id)parameters
                successed:(RequestSuccessed)successed
                   failed:(RequestFailed)failed;






@end
