//
//  WeakDelegate.h
//  Common
//
//  Created by hemanli on 16/7/22.
//

#import <Foundation/Foundation.h>

@interface WeakDelegate : NSObject
- (id)initWithDelegate:(id)delegate;
@property (nonatomic, weak)id delegate;
@end
