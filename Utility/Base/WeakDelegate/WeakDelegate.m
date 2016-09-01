//
//  WeakDelegate.h
//  Common
//
//  Created by hemanli on 16/7/22.
//

#import "WeakDelegate.h"

@implementation WeakDelegate
- (id)initWithDelegate:(id)delegate
{
    if (self = [super init]) {
        self.delegate = delegate;
    }
    
    return self;
}

@end
