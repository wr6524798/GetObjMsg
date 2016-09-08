//
//  NSObject+WRExtension.h
//  HHXC_Student
//
//  Created by wangrui on 16/9/8.
//  Copyright © 2016年 eCar. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (WRExtension)

// 获取属性列表
-(void)getPropertyList;

// 获取方法列表
-(void)getMethodList;

// 获得成员变量列表(自定义的)
-(void)getIvarList;

// 获得协议列表
-(void)getProtocalList;

@end
