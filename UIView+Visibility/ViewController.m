//
//  ViewController.m
//  UIView+Visibility
//
//  Created by neevek on 8/8/15.
//  Copyright (c) 2015 neevek. All rights reserved.
//

#import "ViewController.h"
#import "UIView+Visibility.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *ivImage;
@property (weak, nonatomic) IBOutlet UILabel *lbFirstLine;
@property (weak, nonatomic) IBOutlet UILabel *lbSecondLine;
@property (weak, nonatomic) IBOutlet UILabel *lbThirdLine;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self delay:10 forBlock:^{
        // hide the second line
        [self.lbSecondLine setVisibility:UIViewVisibilityGone affectedMarginDirections:UIViewMarginDirectionBottom];
        
        [UIView animateWithDuration:1 animations:^{
            // the call to 'layoutIfNeeded' is NOT needed if you do not want to animate the changes.
            [self.lbSecondLine.superview layoutIfNeeded];
            
        } completion:^(BOOL finished) {
            
            [self delay:1 forBlock:^{
                // hide the image
                [self.ivImage setVisibility:UIViewVisibilityGone affectedMarginDirections:UIViewMarginDirectionLeft|UIViewMarginDirectionRight];
                
                // the call to 'layoutIfNeeded' is NOT needed if you do not want to animate the changes.
                [UIView animateWithDuration:1 animations:^{
                    [self.ivImage.superview layoutIfNeeded];
                } completion:^(BOOL finished) {
                    
                    // restore the dimension of the image and restore the margin
                    [self delay:1 forBlock:^{
                        [self.ivImage setVisibility:UIViewVisibilityVisible affectedMarginDirections:UIViewMarginDirectionLeft|UIViewMarginDirectionRight];
                        [UIView animateWithDuration:1 animations:^{
                            [self.ivImage.superview layoutIfNeeded];
                        }];
                    }];
                }];
            }];
            
        }];
    }];
}

-(void)delay:(NSInteger)timeInterval forBlock:(void(^)())block {
    // wait for 'timeInterval' seconds before executing the block
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(timeInterval * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        block();
    });
}

@end
