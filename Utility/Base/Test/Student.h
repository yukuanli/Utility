//
//  Student.h
//  Utility
//
//  Created by hemanli on 16/7/26.
//  Copyright © 2016年 tencent. All rights reserved.
//

#import "Person.h"

@interface Student<__covariant Type> : Person

@property (nonatomic, strong) Type type;
- (void)gotoSchool;
@end