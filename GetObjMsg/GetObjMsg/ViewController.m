//
//  ViewController.m
//  GetObjMsg
//
//  Created by wangrui on 16/9/8.
//  Copyright © 2016年 tools. All rights reserved.
//

#import "ViewController.h"
#import "NSObject+WRExtension.h"

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
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
