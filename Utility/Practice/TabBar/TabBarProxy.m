//
//  TabBarProxy.m
//  Utility
//
//  Created by liyukuan on 16/9/2.
//  Copyright © 2016年 tencent. All rights reserved.
//

#import "TabBarProxy.h"
#import "FirstViewController.h"
#import "SecondViewController.h"

@interface TabBarProxy ()

@property (nonatomic, strong) UITabBarController *tabBarController;
@end

@implementation TabBarProxy

- (instancetype)init
{
    if (self = [super init]) {
        [self loadViewControllers];
    }
    
    return self;
}

- (void)loadViewControllers
{
    FirstViewController *first = [[FirstViewController alloc] init];
    first.title = @"chapter1";
    
    SecondViewController *second = [[SecondViewController alloc] init];
    second.title = @"chapter2";
    
    _tabBarController = [[UITabBarController alloc] init];
    _tabBarController.viewControllers = @[first, second];
}

@end
