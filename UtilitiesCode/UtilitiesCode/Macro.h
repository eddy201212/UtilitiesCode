//
//  Macro.h
//  Utilities
//
//  Created by Eddy on 15/11/2.
//  Copyright © 2015年 Zx. All rights reserved.
//

#ifndef Macro_h
#define Macro_h

/*  =======注意事项====
1.cocopods 执行安装操作 ：pod install --verbose --no-repo-update[更新前备份]
               更新操作：pod update  --verbose --no-repo-update[更新前备份]
 
*/


//__OPTIMIZE__  :用于release和debug的判断，当选择了__OPTIMIZE__  时，可以让代码在release时执行，在debug时不执行。示例如下：
//#ifndef __OPTIMIZE__
////这里执行的是debug模式下
//else
////这里执行的是release模式下
//#endif


//__i386__ 与 __x86_64__   ：用于模拟器环境和真机环境的判断。满足该条件的代码只在模拟器下执行。示例代码如下：
#if defined (__i386__) || defined (__x86_64__)
//模拟器下执行
#else
//真机下执行
#endif

//#define NSLog(format, ...) do { \
//fprintf(stderr, " %s\n", \
//        [[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String], \
//        __LINE__, __func__); \
//(NSLog)((format), ##__VA_ARGS__); \
//fprintf(stderr, "-------\n"); \
//} while (0)

#define weakify(...) \\
autoreleasepool {} \\
metamacro_foreach_cxt(rac_weakify_,, __weak, __VA_ARGS__)

#define strongify(...) \\
try {} @finally {} \\
_Pragma("clang diagnostic push") \\
_Pragma("clang diagnostic ignored \\"-Wshadow\\"") \\
metamacro_foreach(rac_strongify_,, __VA_ARGS__) \\
_Pragma("clang diagnostic pop")


#define GCDAsyncBlock(block) dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), block)
#define GCDMainBlock(block) dispatch_async(dispatch_get_main_queue(),block)

/*
TICK;
for (int i = 0; i < 5; i++) {
    NSLog(@"我的值：%d",i);
}
TOCK;
 */
#define TICK   NSDate *startTime = [NSDate date]
#define TOCK   NSLog(@"Time: %f", -[startTime timeIntervalSinceNow])


/***************MRC释放**************/
#define SAFE_RELEASE(x) [x release]; x = nil;

/***************常用路径**************/
#define PATH_OF_APP_HOME    NSHomeDirectory()
#define PATH_OF_TEMP        NSTemporaryDirectory()
#define PATH_OF_DOCUMENT    [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0]

/***************常用尺寸**************/
#define MainScreenFrame         [[UIScreen mainScreen] bounds]
#define MainScreenFrame_Width   MainScreenFrame.size.width
#define MainScreenFrame_Height  MainScreenFrame.size.height
#define UI_NAVIGATION_BAR_HEIGHT    44.0f
#define UI_TAB_BAR_HEIGHT           49.0f
#define UI_STATUS_BAR_HEIGHT        20.0f

/***************常用字体**************/
#define DEFAULT_FONT(s) [UIFont fontWithName:@"Arial" size:s]
#define DEFAULT_BOLD_FONT(s) [UIFont fontWithName:@"Arial-BoldMT" size:s]

/***************常用颜色**************/
#define COLOR_CLEAR [UIColor clearColor]
#define COLOR_GRAY  [UIColor grayColor]
#define COLOR_WHITE [UIColor whiteColor]
#define COLOR_BLACK [UIColor blackColor]
#define COLOR_RED   [UIColor redColor]
#define COLOR_LOW_GRAY [PanliHelper colorWithHexString:@"#5d5d5d"]
#define COLOR_NAVBAR_TITLE [PanliHelper colorWithHexString:@"#4B4B4B"]

/***************系统版本检测**************/
//ios7以后
#define IS_OS_7_OR_LATER    ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)

/**
 *判断是否大于等于ios7
 */
#define IS_IOS7 SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"7.0")
/**
 *判断是否大于等于ios8
 */
#define IS_IOS8 SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"8.0")
/*
 *获取系统版本号
 */
#define SYSTEM_VERSION [[[UIDevice currentDevice] systemVersion] floatValue]
/*
 *判断系统版本是否与v相等
 */
#define SYSTEM_VERSION_EQUAL_TO(v)                  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)
/*
 *判断系统版本是否大于v
 */
#define SYSTEM_VERSION_GREATER_THAN(v)              ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)
/*
 *判断系统版本是否大于等于v
 */
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
/*
 *判断系统版本是否小于v
 */
#define SYSTEM_VERSION_LESS_THAN(v)                 ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)

/*
 *判断系统版本是否小于等于v
 */
#define SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v)     ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)



/***************设备检测**************/
//是iPad
#define isPad ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad)

//是iPhoneOriTouch
#define isIPhoneOrITouch ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)


//===================测试URL==============
#define test_git_image_url @"http://img5.duitang.com/uploads/item/201411/29/20141129014255_4hnZt.thumb.700_0.gif"


//=======================================

//判断设备类型
#define iPhone4 ([UIScreen mainScreen].bounds.size.height == 480)
#define iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)
#define iPhone6 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? (CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size)) : NO)
#define iPhone6plus ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? (CGSizeEqualToSize(CGSizeMake(1125, 2001), [[UIScreen mainScreen] currentMode].size) || CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size)) : NO)

#define kScreenHeight [UIScreen mainScreen].bounds.size.height
#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kWidth(R)  (R)*(kScreenWidth)/320
#define kHeight(R) (iPhone4?((R)*(kScreenHeight)/480):((R)*(kScreenHeight)/568))


#define font(R) (R)*(kScreenWidth)/320.0
#define kFONT16 [UIFont systemFontOfSize:font(16.0f)]


//=====================================
//字符串是否为空

#define kStringIsEmpty(str) ([str isKindOfClass:[NSNull class]] || str == nil || [str length] < 1 ? YES : NO )

//数组是否为空

#define kArrayIsEmpty(array) (array == nil || [array isKindOfClass:[NSNull class]] || array.count == 0)

//字典是否为空

#define kDictIsEmpty(dic) (dic == nil || [dic isKindOfClass:[NSNull class]] || dic.allKeys == 0)

//是否是空对象

#define kObjectIsEmpty(_object) (_object == nil ||[_object isKindOfClass:[NSNull class]] || ([_object respondsToSelector:@selector(length)] && [(NSData *)_object length] == 0) || ([_object respondsToSelector:@selector(count)] && [(NSArray *)_object count] == 0)

//获取屏幕宽度与高度

#define kScreenWidth ([[UIScreen mainScreen] respondsToSelector:@selector(nativeBounds)] ? [UIScreenmainScreen].nativeBounds.size.width/[UIScreen mainScreen].nativeScale : [UIScreen mainScreen].bounds.size.width)

#define kScreenHeight ([[UIScreen mainScreen] respondsToSelector:@selector(nativeBounds)] ? [UIScreenmainScreen].nativeBounds.size.height/[UIScreen mainScreen].nativeScale : [UIScreen mainScreen].bounds.size.height)

#define kScreenSize ([[UIScreen mainScreen] respondsToSelector:@selector(nativeBounds)] ? CGSizeMake([UIScreenmainScreen].nativeBounds.size.width/[UIScreen mainScreen].nativeScale,[UIScreenmainScreen].nativeBounds.size.height/[UIScreen mainScreen].nativeScale) : [UIScreen mainScreen].bounds.size)



//一些缩写

#define kApplication        [UIApplication sharedApplication]

#define kKeyWindow          [UIApplication sharedApplication].keyWindow

#define kAppDelegate        [UIApplication sharedApplication].delegate

#define kUserDefaults       [NSUserDefaults standardUserDefaults]

#define kNotificationCenter [NSNotificationCenter defaultCenter]



//APP版本号

#define kAppVersion [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]

//系统版本号

#define kSystemVersion [[UIDevice currentDevice] systemVersion]

//获取当前语言

#define kCurrentLanguage ([[NSLocale preferredLanguages] objectAtIndex:0])

//判断是否为iPhone

#define kISiPhone (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)

//判断是否为iPad

#define kISiPad (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)



//获取沙盒Document路径

#define kDocumentPath [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject]

//获取沙盒temp路径

#define kTempPath NSTemporaryDirectory()

//获取沙盒Cache路径

#define kCachePath [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject]



//判断是真机还是模拟器

#if TARGET_OS_IPHONE

//真机

#endif



#if TARGET_IPHONE_SIMULATOR

//模拟器

#endif



//开发的时候打印，但是发布的时候不打印的NSLog

#ifdef DEBUG

#define NSLog(...) NSLog(@"%s 第%d行 \n %@\n\n",__func__,__LINE__,[NSString stringWithFormat:__VA_ARGS__])

#else

#define NSLog(...)

#endif



//颜色

#define kRGBColor(r, g, b)     [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]

#define kRGBAColor(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(r)/255.0 blue:(r)/255.0 alpha:a]

#define kRandomColor  KRGBColor(arc4random_uniform(256)/255.0,arc4random_uniform(256)/255.0,arc4random_uniform(256)/255.0)

#define kColorWithHex(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16)) / 255.0 green:((float)((rgbValue & 0xFF00) >> 8)) / 255.0 blue:((float)(rgbValue & 0xFF)) / 255.0 alpha:1.0]



//弱引用/强引用

#define kWeakSelf(type)   __weak typeof(type) weak##type = type;

#define kStrongSelf(type) __strong typeof(type) type = weak##type;



//由角度转换弧度

#define kDegreesToRadian(x)      (M_PI * (x) / 180.0)

//由弧度转换角度

#define kRadianToDegrees(radian) (radian * 180.0) / (M_PI)



//获取一段时间间隔

#define kStartTime CFAbsoluteTime start = CFAbsoluteTimeGetCurrent();

#define kEndTime   NSLog(@"Time: %f", CFAbsoluteTimeGetCurrent() - start)



#endif /* Macro_h */


// ==========================
// IOS内置调试工具 - DebugMan
// https://github.com/liman123/DebugMan
// ==========================

