//
//  YCPageControl.h
//  YCCycleImage
//
//  Created by 赵永闯 on 2018/4/23.
//  Copyright © 2018年 zhaoyongchuang. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol YCPageControlDelegate;

@interface YCPageControl : UIControl

@property (nonatomic) Class dotViewClass;

@property (nonatomic) UIImage *dotImage;

@property (nonatomic) UIImage *currentDotImage;

/**
 *  Dot size for dot views. Default is 8 by 8.
 */

@property (nonatomic) CGSize dotSize;

@property (nonatomic, strong) UIColor *dotColor;

/**
 *  Spacing between two dot views. Default is 8.
 */
@property (nonatomic) NSInteger spacingBetweenDots;

/**
 * Page control setup properties
 */

/**
 * Delegate for YCPageControl
 */
@property(nonatomic,assign) id<YCPageControlDelegate> delegate;


/**
 *  Number of pages for control. Default is 0.
 */
@property (nonatomic) NSInteger numberOfPages;

/**
 *  Current page on which control is active. Default is 0.
 */
@property (nonatomic) NSInteger currentPage;


/**
 *  Hide the control if there is only one page. Default is NO.
 */
@property (nonatomic) BOOL hidesForSinglePage;

/**
 *  Let the control know if should grow bigger by keeping center, or just get longer (right side expanding). By default YES.
 */
@property (nonatomic) BOOL shouldResizeFromCenter;

/**
 *  Return the minimum size required to display control properly for the given page count.
 *
 *  @param pageCount Number of dots that will require display
 *
 *  @return The CGSize being the minimum size required.
 */
- (CGSize)sizeForNumberOfPages:(NSInteger)pageCount;

@end

@protocol YCPageControlDelegate <NSObject>

@optional
- (void)YCPageControl:(YCPageControl *)pageControl didSelectPageAtIndex:(NSInteger)index;

@end







