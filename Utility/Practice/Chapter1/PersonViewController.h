//
//  PersonViewController.h
//  Utility
//
//  Created by hemanli on 2017/3/1.
//  Copyright © 2017年 tencent. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PersonViewController : UIViewController

- (void)doTask;
- (void)cancel;
@end


@protocol NSArray <NSObject>

@end

@interface NSArrayI : NSObject<NSArray>

@end

@interface NSArrayXX : NSObject<NSArray>

@end

@interface NSArrayFactory : NSObject

+ (NSArray *)createArrayWithType:(NSString *)type;
@end
