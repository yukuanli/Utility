//
//  Persion.h
//  Utility
//
//  Created by hemanli on 16/7/26.
//  Copyright © 2016年 tencent. All rights reserved.
//
//@property (nonatomic, readwrite, copy) NSString *name;


#import <Foundation/Foundation.h>

@interface Person<__covariant ObjectType> : NSObject

@property (nonatomic, strong) NSString *name;
+ (Person *)buildOnePerson;
@end
