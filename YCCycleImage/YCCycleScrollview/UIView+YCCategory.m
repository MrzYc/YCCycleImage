//
//  UIView+YCCategory.m
//  YCCycleImage
//
//  Created by 赵永闯 on 2018/4/23.
//  Copyright © 2018年 zhaoyongchuang. All rights reserved.
//

#import "UIView+YCCategory.h"

@implementation UIView (YCCategory)

- (CGFloat)yc_height {
    return self.frame.size.height;
}

- (void)setYc_height:(CGFloat)yc_height {
    CGRect temp = self.frame;
    temp.size.height = yc_height;
    self.frame = temp;
}

- (CGFloat)yc_width {
    return self.frame.size.width;
}

- (void)setYc_width:(CGFloat)yc_width {
    CGRect temp = self.frame;
    temp.size.width = yc_width;
    self.frame = temp;
}

- (CGFloat)yc_x {
    return self.frame.origin.x;
}


- (void)setYc_x:(CGFloat)yc_x {
    CGRect temp = self.frame;
    temp.origin.x = yc_x;
    self.frame = temp;
}


- (CGFloat)yc_y
{
    return self.frame.origin.x;
}

- (void)setYc_y:(CGFloat)yc_y {
    CGRect temp = self.frame;
    temp.origin.x = yc_y;
    self.frame = temp;
}





@end
