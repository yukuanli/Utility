//
//  UrlConnectionViewController.m
//  Utility
//
//  Created by hemanli on 16/10/7.
//  Copyright © 2016年 tencent. All rights reserved.
//

#import "UrlConnectionViewController.h"

#define URL_1 @"http://desk.fd.zol-img.com.cn/t_s960x600c5/g5/M00/0F/02/ChMkJlfIBAOIEVMgAAv2L9WCzKkAAU5zgOVmDgAC_ZH216.jpg"
#define URL_2 @"http://desk.fd.zol-img.com.cn/t_s960x600c5/g5/M00/0F/02/ChMkJlfIBA2IK4BUAAg4NDai3KUAAU50AET9doACDhM284.jpg"

@interface UrlConnectionViewController () <NSURLConnectionDataDelegate>
@property (nonatomic, strong) UIImageView *pic1;
@property (nonatomic, strong) NSMutableData *data1;
@property (nonatomic, strong) UIImageView *pic2;
@property (nonatomic, strong) NSData *data2;
@property (nonatomic, strong) NSURLConnection *urlConnection;
@end

@implementation UrlConnectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _pic1 = [[UIImageView alloc] initWithFrame:CGRectMake(10, 100, 100, 100)];
    [self.view addSubview: _pic1];
    
    _pic2 = [[UIImageView alloc] initWithFrame:CGRectMake(200, 100, 100, 100)];
    [self.view addSubview:_pic2];
    
    NSURL *url = [NSURL URLWithString:URL_1];
    NSURLRequest *request  = [NSURLRequest requestWithURL:url];
    _urlConnection = [[NSURLConnection alloc] initWithRequest:request delegate:self startImmediately:NO];
    [_urlConnection start];
    _data1 = [[NSMutableData alloc] init];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [_data1 appendData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    UIImage *image = [UIImage imageWithData:_data1];
    self.pic1.image = image;
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
