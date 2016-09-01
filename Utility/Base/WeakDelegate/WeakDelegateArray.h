//
//  WeakDelegateArray.h
//  Common
//
//  Created by hemanli on 16/6/28.
//

#import <Foundation/Foundation.h>

@interface WeakDelegateArray : NSObject

- (void)addDelegate:(id)delegate;
- (void)removeDelegate:(id)delegate;

// 遍历所有delegate，如果非空，且能响应sel则调用block，传入delegate
- (void)enumerateUsingBlock:(void(^)(id delegate))block respond:(SEL)sel;

@end
