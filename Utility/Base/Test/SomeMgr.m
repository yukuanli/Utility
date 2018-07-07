//
//  SomeMgr.m
//  Utility
//
//  Created by hemanli on 2017/8/21.
//  Copyright © 2017年 tencent. All rights reserved.
//

#import "SomeMgr.h"

@interface SomeMgr ()
{
    BOOL _observed;
}
@end

@implementation SomeMgr

- (void)dealloc {
    [self removeObserver];
}

- (void)func1 {
    [self addObserver];
}

- (void)addObserver {
    if (!_observed) {
        [self.someView addObserver:self forKeyPath:@"frame" options:NSKeyValueObservingOptionNew context:nil];
        _observed = YES;
    }
    
}

- (void)removeObserver {
    if (_observed) {
        [self.someView removeObserver:self forKeyPath:@"frame" context:@"MyContext"];
        _observed = NO;
    }
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context {
    [self doSomething];
}


- (void)doSomething {
    
}
@end
