//
//  MyViewController.m
//  Utility
//
//  Created by hemanli on 2017/2/27.
//  Copyright © 2017年 tencent. All rights reserved.
//

#import "MyViewController.h"
#import "Person.h"

typedef void(^MyBlock)();

@interface MyViewController ()

@property (nonatomic, strong) MyBlock myBlock;
@property (nonatomic, strong) UIView *myView;

@end

@implementation MyViewController

- (id)init {
    if (self == [super init]) {
        // to o
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray<NSString *> *iarr = [[NSArray alloc] initWithObjects:@"123", nil];
    NSArray *marr = [[NSArray alloc] initWithObjects:[[NSMutableString alloc] initWithString:@"234"], nil];
    
    iarr = marr;
    

    
}

- (void)doAnimation {
    
    NSMutableArray *marray = [NSMutableArray arrayWithCapacity:3];
    [UIView animateWithDuration:0.25 animations:^{
        [marray addObject:@(12)];
    }];
    
    UIView *view = self.myView;
    [UIView animateWithDuration:0.25 animations:^{
        view.frame = CGRectMake(0, 64, 320, 667);
    }];
    
    __block typeof(self) weakSelf = self;
    self.myBlock = ^ {
        weakSelf.view.frame = CGRectMake(0, 64, 320, 667);
    };
    
    [UIView animateWithDuration:0.25 animations:self.myBlock];
}

- (void)dealloc {
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
