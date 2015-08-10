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

-(void)clearMarginForDirections:(UIViewMarginDirection)directions {
    if (UIViewMarginDirectionTop & directions) {
        [[self findConstraintFromView:self.superview forLayoutAttribute:NSLayoutAttributeTop] clear];
    }
    if (UIViewMarginDirectionLeft & directions) {
        [[self findConstraintFromView:self.superview forLayoutAttribute:NSLayoutAttributeLeading] clear];
    }
    if (UIViewMarginDirectionBottom & directions) {
        [[self findConstraintFromView:self.superview forLayoutAttribute:NSLayoutAttributeBottom] clear];
    }
    if (UIViewMarginDirectionRight & directions) {
        [[self findConstraintFromView:self.superview forLayoutAttribute:NSLayoutAttributeTrailing] clear];
    }
}

-(void)restoreMarginForDirections:(UIViewMarginDirection)directions {
    if (UIViewMarginDirectionTop & directions) {
        [[self findConstraintFromView:self.superview forLayoutAttribute:NSLayoutAttributeTop] restore];
    }
    if (UIViewMarginDirectionLeft & directions) {
        [[self findConstraintFromView:self.superview forLayoutAttribute:NSLayoutAttributeLeading] restore];
    }
    if (UIViewMarginDirectionBottom & directions) {
        [[self findConstraintFromView:self.superview forLayoutAttribute:NSLayoutAttributeBottom] restore];
    }
    if (UIViewMarginDirectionRight & directions) {
        [[self findConstraintFromView:self.superview forLayoutAttribute:NSLayoutAttributeTrailing] restore];
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
