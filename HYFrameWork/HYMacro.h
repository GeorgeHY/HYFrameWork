//
//  HYMacro.h
//  HYFrameWork
//
//  Created by GE on 16/2/14.
//  Copyright © 2016年 HY. All rights reserved.
//

#ifndef HYMacro_h
#define HYMacro_h


//block中使用
#define WEAK_SELF(weakSelf)  __weak __typeof(&*self)weakSelf = self


/*控件适配*/
#define SCREEN_WIDTH  ([[UIScreen mainScreen] bounds].size.width)
#define SCREEN_HEIGHT  ([[UIScreen mainScreen] bounds].size.height)

#define SCALE_WIDTH(w) (SCREEN_WIDTH/320.0*w)
#define SCALE_HEIGHT(h) (SCREEN_HEIGHT/568.0*h)

#define RECTFIX_WIDTH(a) (IS_IPHONE6 ? a : SCALE_WIDTH(a))
#define RECTFIX_HEIGHT(a) (IS_IPHONE6 ? a : SCALE_HEIGHT(a))

/*RGB颜色设置*/
#define RGBCOLOR(r,g,b) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1]


/*屏幕判断*/
#define IS_IPHONE4 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) : NO)
#define IS_IPHONE5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)
#define IS_IPHONE6 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) : NO)
#define IS_IPHONE6_PLUS ([UIScreen instancesRespondToSelector:@selector(currentMode)] ?((CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size) || CGSizeEqualToSize(CGSizeMake(1125, 2001), [[UIScreen mainScreen]currentMode].size)) : NO)
#define IS_IPHONE6_PLUS_BIGMODE ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2001), [[UIScreen mainScreen]currentMode].size) : NO)




/*全局Appdelegate*/
#define APPLICATION ((AppDelegate *)[[UIApplication sharedApplication] delegate])


/*UserDefault*/
#define kUserDefaults [NSUserDefaults standardUserDefaults]

/*iOS版本*/
#define IOS_VER ([[[UIDevice currentDevice] systemVersion] floatValue])

/*基地址*/
#define URL_BASE @"baseurl"//根据项目进行修改

#endif /* HYMacro_h */
