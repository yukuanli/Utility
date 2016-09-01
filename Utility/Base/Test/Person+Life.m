//
//  Person+Life.m
//  Utility
//
//  Created by hemanli on 16/7/26.
//  Copyright © 2016年 tencent. All rights reserved.
//

#import "Person+Life.h"

@implementation Person (Life)

+ (void)load
{
    NSLog(@"Person+Life category load");
}

- (void)haveLunch
{
    NSLog(@"%@ has lunch in Person+Life", self.name);
}

//- (void)walk
//{
//    NSLog(@"%@ has lunch in person+life", self.name);
//}
@end
