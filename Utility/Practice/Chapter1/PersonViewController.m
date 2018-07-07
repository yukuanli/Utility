//
//  PersonViewController.m
//  Utility
//
//  Created by hemanli on 2017/3/1.
//  Copyright © 2017年 tencent. All rights reserved.
//

#import "PersonViewController.h"
#import "Person.h"

@interface PersonViewController ()
{
    BOOL _shouldExit;
    NSThread *_thread;
}

@property (nonatomic) NSString *flag;
@end

@implementation PersonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _thread = [[NSThread alloc] initWithTarget:self selector:@selector(threadMain:) object:nil];
    _thread.name = @"custom";
    [_thread start];
    
    NSMutableString *str = [[NSMutableString alloc] initWithString:@"123456"];
    self.flag = str;
    [str replaceCharactersInRange:NSMakeRange(0, 2) withString:@"88"];
    str = nil;
    NSLog(@"%@", self.flag);
    
}

- (void)threadMain:(NSDictionary *)param {
    NSRunLoop *runloop = [NSRunLoop currentRunLoop];
    while (!_shouldExit) {
        [runloop runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]];
    }
}

- (void)doTask {
    [self performSelector:@selector(processImage) onThread:_thread withObject:nil waitUntilDone:NO];
}

- (void)processImage {
    // to do
}

- (void)cancel {
    _shouldExit = YES;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
    NSArray *array = [NSArray arrayWithObject:@"2"];
    [array retain];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
