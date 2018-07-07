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
{
    UIButton *_playBtn;
    UISlider *_slider;
}
@property (nonatomic, strong) AVPlayerItem *playerItem;
@property (nonatomic, strong) AVPlayer *player;
@property (nonatomic, strong) HMPlayerView *playerView;
@property (nonatomic, strong) id playbackTimeObserver;
@property (nonatomic, strong) UIProgressView *progress;
@property (nonatomic, strong) UISlider *slider;

@end

@implementation HMAVPlayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    NSURL *videoUrl = [NSURL URLWithString:@"http://static.tripbe.com/videofiles/20121214/9533522808.f4v.mp4"];
    self.playerItem = [AVPlayerItem playerItemWithURL:videoUrl];
    [self.playerItem addObserver:self forKeyPath:@"status" options:NSKeyValueObservingOptionNew context:nil];
    [self.playerItem addObserver:self forKeyPath:@"loadedTimeRanges" options:NSKeyValueObservingOptionNew context:nil];
    
    self.player = [AVPlayer playerWithPlayerItem:self.playerItem];
    
    self.playerView = [[HMPlayerView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:self.playerView];
    self.playerView.player = self.player;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(moviePlayDidEnd:) name:AVPlayerItemDidPlayToEndTimeNotification object:nil];
    
    NSString *imagePath = [[[NSBundle mainBundle] bundlePath] stringByAppendingString:@"/Resource/play_icon_48.png"];
    
    _playBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_playBtn setTitle:@"play" forState:UIControlStateNormal];
    [_playBtn setImage:[UIImage imageNamed:imagePath] forState:UIControlStateNormal];
    _playBtn.frame = CGRectMake(10, 100, 48, 48);
    [_playBtn addTarget:self action:@selector(onPlayBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    _playBtn.enabled = NO;
    [self.view addSubview:_playBtn];
    
    self.progress = [[UIProgressView alloc] initWithFrame:CGRectMake(10, 400, 300, 5)];
    [self.progress setProgress:0.4];
    [self.view addSubview:self.progress];
    
    _slider = [[UISlider alloc] initWithFrame:CGRectMake(-1, 0, 302, 2)];
    UIGraphicsBeginImageContextWithOptions((CGSize){1, 1}, NO, 0.0);
    UIImage *transparentImage =  UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    _slider.maximumTrackTintColor = [UIColor clearColor];
    _slider.minimumTrackTintColor = [UIColor orangeColor];
    [self.progress addSubview:_slider];
}

- (void)onPlayBtnClick:(UIButton *)button
{
    [self.player play];
}

- (void)moviePlayDidEnd:(NSNotification *)userInfo
{
    
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
{
    AVPlayerItem *playerItem = (AVPlayerItem *)object;
    
    if ([keyPath isEqualToString:@"status"]) {
        if ([playerItem status] == AVPlayerItemStatusReadyToPlay) {
            _playBtn.enabled = YES;
            CMTime duration = self.playerItem.duration;
            [_slider setMaximumValue:CMTimeGetSeconds(duration)];
            [self monitorPlayback];
        }
    } else if ([keyPath isEqualToString:@"loadedTimeRanges"]) {
        NSTimeInterval timeInterval = [self availableDuration];
        CMTime duration = playerItem.duration;
        CGFloat totalDuration = CMTimeGetSeconds(duration);
        [self.progress setProgress:timeInterval / totalDuration  animated:YES];
    }
}

- (void)monitorPlayback
{
    __weak typeof(self) weakSelf = self;
    self.playbackTimeObserver = [self.playerView.player addPeriodicTimeObserverForInterval:CMTimeMake(1, 1) queue:NULL usingBlock:^(CMTime time) {
        CGFloat currentSecond = weakSelf.playerItem.currentTime.value / weakSelf.playerItem.currentTime.timescale;
        [weakSelf.slider setValue:currentSecond animated:YES];
    }];
}

- (NSTimeInterval)availableDuration {
    NSArray *loadedTimeRanges = [[self.playerView.player currentItem] loadedTimeRanges];
    CMTimeRange timeRange = [loadedTimeRanges.firstObject CMTimeRangeValue];
    float startSeconds = CMTimeGetSeconds(timeRange.start);
    float durationSeconds = CMTimeGetSeconds(timeRange.duration);
    NSTimeInterval result = startSeconds + durationSeconds;
    return result;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc
{
    [self.playerItem removeObserver:self forKeyPath:@"status"];
    [self.playerItem removeObserver:self forKeyPath:@"loadedTimeRanges"];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:AVPlayerItemDidPlayToEndTimeNotification object:nil];
    [self.playerView.player removeTimeObserver:self.playbackTimeObserver];
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
