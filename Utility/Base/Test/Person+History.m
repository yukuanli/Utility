//
//  Person+History.m
//  Utility
//
//  Created by hemanli on 16/7/26.
//  Copyright © 2016年 tencent. All rights reserved.
//

#import "Person+History.h"

@implementation Person (History)

+ (void)load
{
    NSLog(@"Person+History category load");
}

- (void)haveLunch
{
    NSLog(@"%@ have lunch in Person+History", self.name);
}
@end
