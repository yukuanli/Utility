//
//  Person.m
//  Utility
//
//  Created by hemanli on 16/7/26.
//  Copyright © 2016年 tencent. All rights reserved.
//

#import "Person.h"

@implementation Person

@synthesize name = _userName;

- (instancetype)init {
    self = [super init];
    return self;
}
- (id)initWithName:(NSString *)name {
    return [super init];
}

- (void)dealloc {
    NSLog(@"Person dealloc!");
}

+ (void)load
{
    NSLog(@"Person class load");
}

- (void)walk
{
    NSLog(@"%@ is walking", self.name);
}

+ (Person *)buildOnePerson {
    Person *p = [[Person alloc] init];
    [p autorelease];
    return p;
}
@end
