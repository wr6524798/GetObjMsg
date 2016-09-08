//
//  NSObject+WRExtension.m
//  HHXC_Student
//
//  Created by wangrui on 16/9/8.
//  Copyright © 2016年 eCar. All rights reserved.
//

#import "NSObject+WRExtension.h"
#import <objc/runtime.h>

@implementation NSObject (WRExtension)

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
