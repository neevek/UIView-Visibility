//
//  UIView+Visibility.h
//  UIView+Visibility
//
//  Created by neevek on 8/8/15.
//  Copyright (c) 2015 neevek. All rights reserved.
//

#import "AppDelegate.h"

typedef NS_ENUM(NSInteger, UIViewVisibility) {
    UIViewVisibilityVisible,
    UIViewVisibilityInvisible,
    UIViewVisibilityGone
};

typedef NS_ENUM(NSInteger, UIViewMarginDirection) {
    UIViewMarginDirectionTop,
    UIViewMarginDirectionLeft,
    UIViewMarginDirectionBottom,
    UIViewMarginDirectionRight
};

@interface UIView(Visibility)

-(void)setVisibility:(UIViewVisibility)visibility;
-(void)clearMarginForDirection:(UIViewMarginDirection)direction;
-(void)restoreMarginForDirection:(UIViewMarginDirection)direction;

@end
