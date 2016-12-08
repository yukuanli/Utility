//
//  HMPlayerView.m
//  Utility
//
//  Created by hemanli on 16/12/8.
//  Copyright © 2016年 tencent. All rights reserved.
//

#import "HMPlayerView.h"

@implementation HMPlayerView

+ (Class)layerClass
{
    return [AVPlayerLayer class];
}

- (AVPlayer *)player {
    return [(AVPlayerLayer *)[self layer] player];
}

- (void)setPlayer:(AVPlayer *)player {
    [(AVPlayerLayer *)[self layer] setPlayer:player];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
