//
//  UIView+YCCategory.h
//  YCCycleImage
//
//  Created by 赵永闯 on 2018/4/23.
//  Copyright © 2018年 zhaoyongchuang. All rights reserved.
//

#import <UIKit/UIKit.h>

#define YCColorCreater(r, g, b, a) [UIColor colorWithRed:(r / 255.0) green:(g / 255.0) blue:(b / 255.0) alpha:a]

@interface UIView (YCCategory)

@property (nonatomic, assign) CGFloat yc_height;
@property (nonatomic, assign) CGFloat yc_width;

@property (nonatomic, assign) CGFloat yc_y;
@property (nonatomic, assign) CGFloat yc_x;

@end
