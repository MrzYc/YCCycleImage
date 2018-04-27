//
//  YCAbstractDotView.m
//  YCCycleImage
//
//  Created by 赵永闯 on 2018/4/23.
//  Copyright © 2018年 zhaoyongchuang. All rights reserved.
//

#import "YCAbstractDotView.h"

@implementation YCAbstractDotView

- (id)init {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:[NSString stringWithFormat:@"You must override %@ in %@", NSStringFromSelector(_cmd), self.class]
                                 userInfo:nil];
}

- (void)changeActivityState:(BOOL)active {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:[NSString stringWithFormat:@"You must override %@ in %@", NSStringFromSelector(_cmd), self.class]
                                 userInfo:nil];
}

@end
