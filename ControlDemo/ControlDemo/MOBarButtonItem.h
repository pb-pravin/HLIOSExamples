//
//  MOBarButtonItem.h
//  Mozat
//
//  Created by an hailin on 27/12/12.
//  Copyright (c) 2012 MOZAT Pte Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MOBarButtonItem : UIBarButtonItem

- (id)initBackBarButtonItemWithTitle:(NSString *)title target:(id)target action:(SEL)action;
- (id)initDoneBarButtonItemWithTitle:(NSString *)title target:(id)target action:(SEL)action;
- (id)initBarButtonItemWithTitle:(NSString *)title target:(id)target action:(SEL)action;
- (id)initBarButtonItemWithImage:(UIImage *)image target:(id)target action:(SEL)action;
+ (UIButton *)customButtonWithTitle:(NSString *)title target:(id)target action:(SEL)action;

@end
