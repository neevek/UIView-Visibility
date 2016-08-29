UIView+Visibility
=================

In iOS, there is no intuitive support for truly hiding a view with AutoLayout, setting `UIView.hidden=YES` only causes the view to be invisible, the space is still occupied by the *hidden* view, in most cases this is not desired. In Android, there is `View.setVisibility(View.GONE)` to truly hide a view, this category implements a `setVisibility` method for the same feature.

![](https://raw.githubusercontent.com/neevek/UIView-Visibility/master/images/demo.gif)

Usage
=====
```objective-c
#import "UIView+Visibility.h"

// hide the view without clearing its margins
[UIView setVisibility:UIViewVisibilityGone];

// hide the view and clear its top & bottom margins
[UIView setVisibility:UIViewVisibilityGone
        affectedMarginDirections:UIViewMarginDirectionTop|UIViewMarginDirectionBottom];
// show the view and restore its top & bottom margins
[UIView setVisibility:UIViewVisibilityVisible
        affectedMarginDirections:UIViewMarginDirectionTop|UIViewMarginDirectionBottom];
```

Following are the enums that are needed to work with the `setVisibility` method:
```objective-c
typedef NS_ENUM(NSInteger, UIViewVisibility) {
  UIViewVisibilityVisible,
  UIViewVisibilityInvisible,
  UIViewVisibilityGone
};

typedef NS_OPTIONS(NSUInteger, UIViewMarginDirection) {
    UIViewMarginDirectionNone       = 0,
    UIViewMarginDirectionTop        = 1 << 0,
    UIViewMarginDirectionLeft       = 1 << 1,
    UIViewMarginDirectionBottom     = 1 << 2,
    UIViewMarginDirectionRight      = 1 << 3,
    UIViewMarginDirectionAll        = UIViewMarginDirectionTop|UIViewMarginDirectionLeft|UIViewMarginDirectionBottom|UIViewMarginDirectionRight
};

```
Under MIT license
=================

```
Copyright (c) 2015 - 2016 neevek <i@neevek.net>
See the file license.txt for copying permission.
```
