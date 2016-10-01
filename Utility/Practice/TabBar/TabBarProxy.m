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
    UINavigationController *firstNav = [[UINavigationController alloc] initWithRootViewController:[[FirstViewController alloc] init]];
    firstNav.title = @"chapter1";
    
    UINavigationController *secondNav = [[UINavigationController alloc] initWithRootViewController:[[SecondViewController alloc] init]];
    secondNav.title = @"chapter2";
    
    _tabBarController = [[UITabBarController alloc] init];
    _tabBarController.viewControllers = @[firstNav, secondNav];
}

@end
