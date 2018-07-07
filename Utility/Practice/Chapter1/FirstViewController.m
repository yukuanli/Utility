//
//  FirstViewController.m
//  Utility
//
//  Created by liyukuan on 16/9/2.
//  Copyright © 2016年 tencent. All rights reserved.
//

#import "FirstViewController.h"
#import "CommonDef.h"
#import "Person.h"
#import "PersonViewController.h"

static UTItem sections[] = {
    {@"NSRunLoop", @"RunLoopViewController"}
};

static const NSString *cellReuseId = @"Chapter1_Cell";

@interface FirstViewController () <UITableViewDelegate, UITableViewDataSource>
{
    UITableView *_tableView;
    Person *_student;
    
}

@property (nonatomic, strong) Person *teacher;
@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [self.view addSubview:_tableView];
    
    /*Person *p = [[Person alloc] init];
    NSMutableString *name = [[NSMutableString alloc] initWithString:@"hemanli"];
    p.name = name;
    [name replaceCharactersInRange:NSMakeRange(5, 2) withString:@""];*/
    
    
    
    /*NSString *list = [[NSString alloc] initWithFormat:@"%@, %@", @"23", nil, nil];
    NSString *l2 = [list copy];
    NSLog(@"%p, %p", list, l2);
    int x = 0;*/
    // Do any additional setup after loading the view.
    
        
    /*_man = [[Person alloc] init];
    self.teacher = [[Person alloc] init];
    Person *onePerson = _man;
    [UIView animateWithDuration:0.25 animations:^{
        
        onePerson.name = @"2";
    }];*/
    
    /*NSArray *array = [[NSArray alloc] initWithObjects:@"1", @"3", nil];
    
    NSLog(@"class of NSArray:%@", [NSArray class]);
    NSLog(@"class of array:%@", [array class]);
    
    NSMutableArray *marray = [[NSMutableArray alloc] initWithObjects:@"1", @"3", nil];
    NSLog(@"class of NSMutableArray:%@", [NSMutableArray class]);
    NSLog(@"class of marray:%@", [marray class]);
    
    NSMutableArray *emptyArr = [NSMutableArray array];
    NSLog(@"class of emptyArr:%@", [emptyArr class]);
    
    NSArray *uninitArr = [NSArray alloc];
    NSLog(@"class of uninitArr:%@", [uninitArr class]);*/
    
    
    NSNumber *num = [NSNumber alloc];
    NSArray *uninitArr1 = [NSArray alloc];
    
    NSArray *uninitArr2 = [NSArray alloc];
    
    NSArray *uninitArr3 = [NSArray alloc];
    
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
