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

typedef NS_OPTIONS(NSUInteger, UIViewMarginDirection) {
    UIViewMarginDirectionTop        = 1 << 0,
    UIViewMarginDirectionLeft       = 1 << 1,
    UIViewMarginDirectionBottom     = 1 << 2,
    UIViewMarginDirectionRight      = 1 << 3,
    UIViewMarginDirectionAll        = UIViewMarginDirectionTop|UIViewMarginDirectionLeft|UIViewMarginDirectionBottom|UIViewMarginDirectionRight
};

@interface UIView(Visibility)

-(void)setVisibility:(UIViewVisibility)visibility;
-(void)clearMarginForDirections:(UIViewMarginDirection)directions;
-(void)restoreMarginForDirections:(UIViewMarginDirection)directions;

@end
