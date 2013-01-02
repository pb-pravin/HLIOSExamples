//
//  MOBarButtonItem.m
//  Mozat
//
//  Created by an hailin on 27/12/12.
//  Copyright (c) 2012 MOZAT Pte Ltd. All rights reserved.
//

#import "MOBarButtonItem.h"

@implementation MOBarButtonItem

- (id)initBackBarButtonItemWithTitle:(NSString *)title target:(id)target action:(SEL)action
{
    self = [super init];
    if (self) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(0, 0, 0, 30);
        [btn setTitle:title forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        btn.titleLabel.font = [UIFont boldSystemFontOfSize:12];
        CGSize size = [btn.titleLabel.text sizeWithFont:btn.titleLabel.font constrainedToSize:CGSizeMake(160, btn.titleLabel.frame.size.height)];
        btn.frame = CGRectMake(0, 0, size.width + 18, 30);
        
        [btn setBackgroundImage:[[UIImage imageNamed:@"NavBarDefaultBack.png"] stretchableImageWithLeftCapWidth:15 topCapHeight:0] forState:UIControlStateNormal];
        [btn setBackgroundImage:[[UIImage imageNamed:@"NavBarDefaultBackPressed.png"] stretchableImageWithLeftCapWidth:15 topCapHeight:0] forState:UIControlStateHighlighted];
        [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
        //UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
        self.customView = btn;
    }
    
    return self;
}

- (id)initDoneBarButtonItemWithTitle:(NSString *)title target:(id)target action:(SEL)action
{
    self = [super init];
    if (self) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(0, 0, 30, 30);
        [btn setTitle:title forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        btn.titleLabel.font = [UIFont boldSystemFontOfSize:12];
        CGSize size = [btn.titleLabel.text sizeWithFont:btn.titleLabel.font constrainedToSize:CGSizeMake(160, btn.titleLabel.frame.size.height)];
        btn.frame = CGRectMake(0, 0, size.width + 10, 30);
        [btn setBackgroundImage:[[UIImage imageNamed:@"NavBarDoneButton.png"] stretchableImageWithLeftCapWidth:5 topCapHeight:0] forState:UIControlStateNormal];
        [btn setBackgroundImage:[[UIImage imageNamed:@"NavBarDoneButtonPressed.png"] stretchableImageWithLeftCapWidth:5 topCapHeight:0] forState:UIControlStateHighlighted];
        [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
        self.customView = btn;
    }
    
    return self;
}



- (id)initBarButtonItemWithTitle:(NSString *)title target:(id)target action:(SEL)action
{
    self = [super init];
    if (self) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(0, 0, 30, 30);
        [btn setTitle:title forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        btn.titleLabel.font = [UIFont boldSystemFontOfSize:12];
        CGSize size = [btn.titleLabel.text sizeWithFont:btn.titleLabel.font constrainedToSize:CGSizeMake(160, btn.titleLabel.frame.size.height)];
        btn.frame = CGRectMake(0, 0, size.width + 10, 30);
        [btn setBackgroundImage:[[UIImage imageNamed:@"NavBarDefaultButton.png"] stretchableImageWithLeftCapWidth:5 topCapHeight:0] forState:UIControlStateNormal];
        [btn setBackgroundImage:[[UIImage imageNamed:@"NavBarDefaultButtonPressed.png"] stretchableImageWithLeftCapWidth:5 topCapHeight:0] forState:UIControlStateHighlighted];
        [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
        self.customView = btn;
    }
    
    return self;
}

- (id)initBarButtonItemWithImage:(UIImage *)image target:(id)target action:(SEL)action
{
    self = [super init];
    if (self) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(0, 0, 30, 30);
        [btn setImage:image forState:UIControlStateNormal];
        [btn setBackgroundImage:[[UIImage imageNamed:@"NavBarDefaultButton.png"] stretchableImageWithLeftCapWidth:5 topCapHeight:0] forState:UIControlStateNormal];
        [btn setBackgroundImage:[[UIImage imageNamed:@"NavBarDefaultButtonPressed.png"] stretchableImageWithLeftCapWidth:5 topCapHeight:0] forState:UIControlStateHighlighted];
        [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
        self.customView = btn;
    }
    
    return self;
}

@end
