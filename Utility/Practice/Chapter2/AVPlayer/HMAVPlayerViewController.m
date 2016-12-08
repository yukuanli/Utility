//
//  HMAVPlayerViewController.m
//  Utility
//
//  Created by hemanli on 16/12/8.
//  Copyright © 2016年 tencent. All rights reserved.
//

#import "HMAVPlayerViewController.h"
#import "HMPlayerView.h"

@interface HMAVPlayerViewController ()

@property (nonatomic, strong) AVPlayerItem *playerItem;
@property (nonatomic, strong) AVPlayer *player;

@end

@implementation HMAVPlayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSURL *videoUrl = [NSURL URLWithString:@""];
    self.playerItem = [AVPlayerItem playerItemWithURL:videoUrl];
    [self.playerItem addObserver:self forKeyPath:@"status" options:NSKeyValueObservingOptionNew context:nil];
    [self.playerItem addObserver:self forKeyPath:@"loadedTimeRanges" options:NSKeyValueObservingOptionNew context:nil];
    self.player = [AVPlayer playerWithPlayerItem:self.playerItem];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(moviePlayDidEnd:) name:AVPlayerItemDidPlayToEndTimeNotification object:nil];
    // Do any additional setup after loading the view.
}

- (void)moviePlayDidEnd:(NSNotification *)userInfo
{
    
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
