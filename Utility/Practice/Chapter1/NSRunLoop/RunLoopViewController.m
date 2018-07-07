//
//  RunLoopViewController.m
//  Utility
//
//  Created by hemanli on 16/10/1.
//  Copyright © 2016年 tencent. All rights reserved.
//

#import "RunLoopViewController.h"
#import "PersonViewController.h"

@interface RunLoopViewController ()
{
    PersonViewController *_personVC;
}
@end

@implementation RunLoopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.userInteractionEnabled = YES;
    UIButton *testBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [testBtn setTitle:@"测试" forState:UIControlStateNormal];
    testBtn.frame = CGRectMake(100, 100, 60, 30);
    [self.view addSubview:testBtn];
    [testBtn addTarget:self action:@selector(onTestBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *cancelBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [cancelBtn setTitle:@"测试" forState:UIControlStateNormal];
    cancelBtn.frame = CGRectMake(100, 200, 60, 30);
    [self.view addSubview:cancelBtn];
    [cancelBtn addTarget:self action:@selector(onCancelBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    _personVC = [[PersonViewController alloc] init];
    [self.view addSubview:_personVC.view];
    // Do any additional setup after loading the view.
}

- (void)onTestBtnClick:(id)sender {
    [_personVC doTask];
}

- (void)onCancelBtnClick:(id)sender {
    [_personVC cancel];
}

- (void)viewDidAppear:(BOOL)animated {
    [_personVC doTask];
}

- (void)viewWillDisappear:(BOOL)animated {
    [_personVC cancel];
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
