//
//  UTViewController.m
//  Utility
//
//  Created by hemanli on 16/7/22.
//  Copyright © 2016年 tencent. All rights reserved.
//

#import "UTViewController.h"
#import "Student.h"
#import "Person+Life.h"
#import "Person+History.h"
#import <objc/runtime.h>
#import "SomeView.h"
#import "SomeMgr.h"

@interface UTViewController ()

@end

@implementation UTViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    unsigned int count = 0;
    NSInvocationOperation *oper1 = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(task1:) object:@{@"name":@"hemanli"}];
    
    NSInvocationOperation *oper2 = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(task2:) object:@"hello"];
    oper1.queuePriority = NSOperationQueuePriorityVeryHigh;
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    [queue addOperation:oper1];
    [queue addOperation:oper2];
    [oper1 waitUntilFinished];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSLog(@"dispatch");
    });
    
    Student<NSNumber *> *stu = [[Student alloc] init];
    stu.type = @(23);
    [stu gotoSchool];
    
    SomeMgr *mgr = nil;
    SomeView *someView = nil;
    
    
    mgr.someView = someView;
    
    
    mgr.someView = nil;
    mgr = nil;
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)task1:(id)data
{
    NSLog(@"task1, data:%@", data);
}

- (void)task2:(id)data
{
    NSLog(@"task2, data:%@", data);
}
@end
