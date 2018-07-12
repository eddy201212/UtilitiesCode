//
//  RuntimeDemo.m
//  UtilitiesCode
//
//  Created by Eddy on 16/4/11.
//  Copyright © 2016年 tutuge. All rights reserved.
//

#import "RuntimeDemo.h"
#import "UIAlertView+FYAdditions.h"
#import "UIActionSheet+FYAdditions.h"
#import "UIView+FYLoadingView.h"
#import <objc/runtime.h>

@implementation RuntimeDemo

- (void)test{
    
    [self lyl_registerClassPair];
    
}

//验证元类
- (void)lyl_registerClassPair {
    
    Class newClass = objc_allocateClassPair([NSError class], "TestClass", 0);
    class_addMethod(newClass, @selector(testMetaClass), (IMP)TestMetaClass, "v@");
    
    class_addIvar(newClass, "testString", sizeof(NSString *), 0, "@");
    
    objc_registerClassPair(newClass);
    
    id instance = [[newClass alloc] initWithDomain:@"some domain" code:0 userInfo:nil];
    [instance performSelector:@selector(testMetaClass)];
    
}

void TestMetaClass(id self, SEL _cmd){
    
    NSLog(@"the object is %p", self);
    
    NSLog(@"class is %@, superClass is %@", [self class], [self superclass]);
    
    Class currentClass = [self class];
    
    for (NSInteger i = 0; i < 4; i ++) {
        NSLog(@"the %ld time 's  methclass is %p", (long)i, currentClass);
        
        currentClass = object_getClass(currentClass);
    }
    
    NSLog(@"NSObject's class is %p", [NSObject class]);
    NSLog(@"NSObject's meta class is %p", object_getClass([NSObject class]));
    
    unsigned int count;
    Method *methods = class_copyMethodList([self class], &count);
    
    for (int i = 0; i < count; i ++) {
        Method method = methods[i];
        
        SEL selector = method_getName(method);
        
        NSString *name = NSStringFromSelector(selector);
        NSLog(@"方法 名字 ==== %@",name);
    }
    
    
    Ivar *ivars = class_copyIvarList([self class], &count);
    for (int i = 0; i < count; i ++) {
        Ivar ivar = ivars[i];
        NSString *ivarName = [NSString stringWithCString:ivar_getName(ivar) encoding:NSUTF8StringEncoding];
        NSLog(@"ivarName = %@", ivarName);
    }
    
    
    objc_property_t *propertys = class_copyPropertyList([NSObject class], &count);
    for (int i = 0; i < count; i ++) {
        objc_property_t propertyName = propertys[i];
        NSString *ivarName = [NSString stringWithCString:property_getName(propertyName) encoding:NSUTF8StringEncoding];
        NSLog(@"propertyName = %@", ivarName);
    }
}

- (void)viewDidLoad{
    
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self test];
    
//#warning 测试代码============================
//    [self test]; return;
//#warning 测试代码============================
    
    //添加属性
    [UIAlertView alertWithCallBackBlock:^(NSInteger buttonIndex) {
        if (buttonIndex == 0) {
            NSLog(@"取消");
        }else if(buttonIndex == 1)
        {
            NSLog(@"你是个好人");
        }else if(buttonIndex == 2)
        {
            NSLog(@"我们结婚吧");
        }
    } title:@"我说" message:@"我稀罕你" cancelButtonName:@"取消" otherButtonTitles:@"你是个好人",@"我们结婚吧",nil];
    
    
    [UIActionSheet actionSWithCallBackBlock:^(NSInteger buttonIndex) {
        if (buttonIndex == 1) {
            NSLog(@"取消");
        }else if(buttonIndex == 0)
        {
            NSLog(@"button1");
        }else if(buttonIndex == 2)
        {
            NSLog(@"button2");
        }else if(buttonIndex == 3){
            NSLog(@"button3");
        }
        
    } title:@"标题" message:@"消息消息消息消息消息消息消息消息" cancelButtonName:@"取消" otherButtonTitles:@"button1",@"button2",@"button3",nil];
    
    
    [self.view showLoadingViewWithMessage:@"测试运行时添加属性"];
    [self.view stopLoadingViewWithMessage:@"测试运行时添加属性..."];
    //#测试运行时的属性操作是什么样的 nslog 可以可以可以抗氧化卡号浮生六记   是了测试运行时的属性了 我现在是在测试运行时的属性了
}

@end
