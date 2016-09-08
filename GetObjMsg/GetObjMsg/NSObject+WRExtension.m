//
//  NSObject+WRExtension.m
//  HHXC_Student
//
//  Created by wangrui on 16/9/8.
//  Copyright © 2016年 eCar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NSObject+WRExtension.h"
#import <objc/runtime.h>

@implementation NSObject (WRExtension)

+(void)load{
    // 交换两个方法的实现
    method_exchangeImplementations(class_getInstanceMethod([NSObject class], @selector(description)), class_getInstanceMethod([NSObject class], @selector(pkxDescription)));
}

/**
 *  该方法是用来自定义模型(直接继承NSObject)的输出格式
 *
 *  @return 格式化后的字符串
 */
- (NSString *)pkxDescription{
    Class class = [self class];
    
    NSMutableString *resultStr = [NSMutableString stringWithFormat:@"%@ = {\n",[self pkxDescription]];
    while (class != [NSObject class]) {
        // 0.如果是UIResponder或CALayer的子类,就使用系统的默认输出格式
        if ([[class description] hasPrefix:@"NS"] || [[class description] hasPrefix:@"__"]|| [[class description] hasPrefix:@"AV"] || [[class description] hasPrefix:@"_UIFlowLayout"] || [[class description] hasPrefix:@"UITouchesEvent"] || [class isSubclassOfClass:[UIResponder class]] || [class isSubclassOfClass:[CALayer class]] || [class isSubclassOfClass:[UIImage class]])return [self pkxDescription];
        unsigned int count = 0;
        //　1.获取类成员变量列表，count为类成员变量数量
        Ivar *vars = class_copyIvarList(class, &count);
        for (int index = 0; index < count; index ++) {
            // 2.根据索引获得指定位置的成员变量
            Ivar var = vars[index];
            // 3.获得成员变量名
            const char *name = ivar_getName(var);
            // 4.成员变量名转化成oc字符串
            NSString *varName = [NSString stringWithUTF8String:name];
            // 5.获得成员变量对应的值
            id value = [self valueForKey:varName];
            [resultStr appendFormat:@"\t%@ = %@;\n", varName, value];
        }
        // 6.释放指针
        free(vars);
        // 7.获得父类
        class = class_getSuperclass(class);
    }
    [resultStr appendString:@"}\n"];
    return resultStr;
}

// 获取属性列表
-(void)getPropertyList{
    unsigned int count;
    objc_property_t *propertyList = class_copyPropertyList([self class], &count);
    for (unsigned int i = 0; i < count; i++) {
        const char *porpertyName = property_getName(propertyList[i]);
        NSLog(@"property -----> %@",[NSString stringWithUTF8String:porpertyName]);
    }
}

// 获取方法列表
-(void)getMethodList{
    unsigned int count;
    Method *methodList = class_copyMethodList([self class], &count);
    for (unsigned int i = 0 ; i < count; i++) {
        Method method = methodList[i];
        NSLog(@"method -----> %@",NSStringFromSelector(method_getName(method)));
    }
}

// 获得成员变量列表
-(void)getIvarList{
    unsigned int count;
    Ivar *ivarList = class_copyIvarList([self class], &count);
    for (unsigned int i = 0; i < count; i++) {
        Ivar myIvar = ivarList[i];
        const char *ivarName = ivar_getName(myIvar);
        NSLog(@"ivar ------> %@",[NSString stringWithUTF8String:ivarName]);
    }
}

// 获得协议列表
-(void)getProtocalList{
    unsigned int count;
    __unsafe_unretained Protocol **protocolList = class_copyProtocolList([self class], &count);
    for (unsigned int i = 0; i < count; i++) {
        Protocol *myProtocal = protocolList[i];
        const char *protocolName = protocol_getName(myProtocal);
        NSLog(@"protocal -----> %@",[NSString stringWithUTF8String:protocolName]);
    }
}


@end
