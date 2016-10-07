//
//  FirstViewController.m
//  Utility
//
//  Created by liyukuan on 16/9/2.
//  Copyright © 2016年 tencent. All rights reserved.
//

#import "FirstViewController.h"
#import "CommonDef.h"

static UTItem sections[] = {
    {@"NSRunLoop", @"RunLoopViewController"}
};

static const NSString *cellReuseId = @"Chapter1_Cell";

@interface FirstViewController () <UITableViewDelegate, UITableViewDataSource>
{
    UITableView *_tableView;
}
@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [self.view addSubview:_tableView];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    unsigned int s = sizeof(sections) / sizeof(UTItem);
    return sizeof(sections) / sizeof(UTItem);
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellReuseId];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellReuseId];
        cell.textLabel.text = sections[indexPath.row].itemName;
    }
    
    return cell;
}

#pragma mark UITableViewDataSource
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *vcClsName = sections[indexPath.row].vcClsName;
    Class vcCls = NSClassFromString(vcClsName);
    UIViewController *vc = [[vcCls alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
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
