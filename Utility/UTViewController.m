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
    // Do any additional setup after loading the view, typically from a nib.
    
    id obj1;
    id obj2;
    obj1 = [[NSString alloc] initWithFormat:@"%@", @"123"];
    obj2 = [[NSString alloc] initWithFormat:@"%@", @"456"];
    NSArray *array1 = [[NSArray alloc] initWithObjects:obj1, obj2, nil];
    NSArray *array2 = [array1 copy];
    NSMutableArray *marray2 = [NSMutableArray arrayWithArray:array1];
    int x = 0;
    
    NSString *str1 = @"";
    NSString *str2 = [str1 copy];
    NSMutableArray *mstr1 = [str1 copy];
    int y = 0;
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"https://ss1.baidu.com/8aQDcnSm2Q5IlBGlnYG/stat/tmp/qixilogo.png"]];
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
