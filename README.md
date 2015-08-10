UIView+Visibility
=================

In iOS with AutoLayout, there is no intuitive support for truly hiding a view, setting `UIView.hidden=YES` only causes the view to be invisible, the space is still occupied by the *hidden* view, in some cases this is not desired. In Android, we have `View.setVisibility(View.GONE)` to truly hide a view, in iOS with AutoLayout, in some cases, we may need to manually specify which directions of margins to clear or restore through the `affectedMarginDirections` argument.

![](https://raw.githubusercontent.com/neevek/UIView-Visibility/master/images/demo.gif)

Usage
=====
```objective-c
#import "UIView+Visibility.h"

// hide the view without clearing its margins
[UIView setVisibility:UIViewVisibilityGone];

// hide the view and clear its top & bottom margins
[UIView setVisibility:UIViewVisibilityGone affectedMarginDirections:UIViewMarginDirectionTop|UIViewMarginDirectionBottom];
// show the view and restore its top & bottom margins
[UIView setVisibility:UIViewVisibilityVisible affectedMarginDirections:UIViewMarginDirectionTop|UIViewMarginDirectionBottom];
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
Copyright (c) 2015 neevek <i@neevek.net>
See the file license.txt for copying permission.
```
