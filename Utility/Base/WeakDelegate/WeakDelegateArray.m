//
//  WeakDelegateArray.m
//  Common
//
//  Created by hemanli on 16/6/28.
//

#import "WeakDelegateArray.h"
#import "WeakDelegate.h"

@interface WeakDelegateArray ()

@property (nonatomic, retain) NSMutableArray *delegates;

@end

@implementation WeakDelegateArray

- (void)addDelegate:(id)delegate
{
    BOOL found = NO;
    for (WeakDelegate *delegateWrapper in self.delegates) {
        if (delegateWrapper.delegate == delegate) {
            found = YES;
            break;
        }
    }
    
    if (!found) {
        WeakDelegate *delegateWrapper = [[WeakDelegate alloc] initWithDelegate:delegate];
        [self.delegates addObject:delegateWrapper];
    }
}

- (void)removeDelegate:(id)delegate
{
    for (WeakDelegate *delegateWrapper in self.delegates) {
        if (delegateWrapper.delegate == delegate) {
            [self.delegates removeObject:delegateWrapper];
            break; //immediately break
        }
    }
}

- (void)enumerateUsingBlock:(void(^)(id delegate))block respond:(SEL)sel;
{
    if (block == nil) {
        return;
    }
    
    //firstly, got one copy of delegate array
    NSArray *tempDelegateArray = [[NSArray alloc] initWithArray:self.delegates];
    for (WeakDelegate *delegateWrapper in tempDelegateArray) {
        if (delegateWrapper.delegate != nil && [delegateWrapper.delegate respondsToSelector:sel]) {
            block(delegateWrapper.delegate);
        }
    }
}

- (NSMutableArray *)delegates
{
    if (_delegates == nil) {
        _delegates = [[NSMutableArray alloc] init];
    }
    
    return _delegates;
}
@end
