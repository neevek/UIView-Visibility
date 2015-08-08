//
//  UIView+Visibility.m
//  UIView+Visibility
//
//  Created by neevek on 8/8/15.
//  Copyright (c) 2015 neevek. All rights reserved.
//

#import "UIView+Visibility.h"
#import "NSLayoutConstraint+Visibiltiy.h"

@implementation UIView(Visibility)

-(void)setVisibility:(UIViewVisibility)visibility {
    switch (visibility) {
        case UIViewVisibilityVisible:
            self.hidden = NO;
            [[self findConstraintFromView:self forLayoutAttribute:NSLayoutAttributeWidth] restore];
            [[self findConstraintFromView:self forLayoutAttribute:NSLayoutAttributeHeight] restore];
            break;
        case UIViewVisibilityInvisible:
            self.hidden = YES;
            break;
        case UIViewVisibilityGone:
            [[self findConstraintFromView:self forLayoutAttribute:NSLayoutAttributeWidth] clear];
            [[self findConstraintFromView:self forLayoutAttribute:NSLayoutAttributeHeight] clear];
            break;
        default:
            break;
    }
}

-(void)clearMarginForDirection:(UIViewMarginDirection)direction {
    switch (direction) {
        case UIViewMarginDirectionTop:
            [[self findConstraintFromView:self.superview forLayoutAttribute:NSLayoutAttributeTop] clear];
            break;
        case UIViewMarginDirectionLeft:
            [[self findConstraintFromView:self.superview forLayoutAttribute:NSLayoutAttributeLeading] clear];
            break;
        case UIViewMarginDirectionBottom:
            [[self findConstraintFromView:self.superview forLayoutAttribute:NSLayoutAttributeBottom] clear];
            break;
        case UIViewMarginDirectionRight:
            [[self findConstraintFromView:self.superview forLayoutAttribute:NSLayoutAttributeRight] clear];
            break;
        default:
            break;
    }
}

-(void)restoreMarginForDirection:(UIViewMarginDirection)direction {
    switch (direction) {
        case UIViewMarginDirectionTop:
            [[self findConstraintFromView:self.superview forLayoutAttribute:NSLayoutAttributeTop] restore];
            break;
        case UIViewMarginDirectionLeft:
            [[self findConstraintFromView:self.superview forLayoutAttribute:NSLayoutAttributeLeading] restore];
            break;
        case UIViewMarginDirectionBottom:
            [[self findConstraintFromView:self.superview forLayoutAttribute:NSLayoutAttributeBottom] restore];
            break;
        case UIViewMarginDirectionRight:
            [[self findConstraintFromView:self.superview forLayoutAttribute:NSLayoutAttributeRight] restore];
            break;
        default:
            break;
    }
}

-(NSLayoutConstraint *)findConstraintFromView:(UIView *)view forLayoutAttribute:(NSLayoutAttribute)layoutAttribute {
    for (NSLayoutConstraint *constraint in view.constraints) {
        if ((constraint.firstItem == self && constraint.firstAttribute == layoutAttribute) ||
            (constraint.secondItem == self && constraint.secondAttribute == layoutAttribute)) {
            return constraint;
        }
    }
    
    return nil;
}

@end
