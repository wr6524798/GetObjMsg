//
//  ViewController.m
//  GetObjMsg
//
//  Created by wangrui on 16/9/8.
//  Copyright © 2016年 tools. All rights reserved.
//

#import "ViewController.h"
#import "NSObject+WRExtension.h"
#import "WRInfo.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 获取属性列表
    [self getPropertyList];
    
    // 获取方法列表
    [self getMethodList];
    
    // 获得成员变量列表
    [self getIvarList];
    
    // 获得协议列表
    [self getProtocalList];
    
    WRInfo *info = [[WRInfo alloc] init];
    info.name = @"WR";
    info.age = @"20";

    NSLog(@"%@",info);
    
//    重写打印信息前：<WRInfo: 0x7fc712763ee0>
//    重写打印信息后：<WRInfo: 0x7f9ae15a1780> = {
//                  _name = WR;
//                  _age = 20;
//                  }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
