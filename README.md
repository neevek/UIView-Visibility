UIView+Visibility
=================

In iOS with AutoLayout, there is no intuitive support for truly hiding a view, setting `UIView.hidden=YES` only causes the view to be invisible, the space is still occupied by the *hidden* view, in some cases this is not desired. In Android, we have `View.setVisibility(View.GONE)` to truly hide a view, this project provides two methods to achieve just that. With the nature of AutoLayout, we have to manually clear the margins of the view to our needs in real use cases(either left, top, right or bottom, or any combination of them), so two method calls is needed.

![](https://raw.githubusercontent.com/neevek/UIView-Visibility/master/images/demo.gif)

Usage
=====
```objective-c
#import "UIView+Visibility.h"

[UIView setVisibility:UIViewVisibilityGone];

// optionally clearing margins for the view to achieve true hiding
[UIView clearMarginForDirection:UIViewMarginDirectionRight];

// restore margins for the view
[UIView restoreMarginForDirection:UIViewMarginDirectionRight];
```

Following are the enums that are needed to work with the above methods:
```objective-c
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
```
Under MIT license
=================

```
Copyright (c) 2015 neevek <i@neevek.net>
See the file license.txt for copying permission.
```
