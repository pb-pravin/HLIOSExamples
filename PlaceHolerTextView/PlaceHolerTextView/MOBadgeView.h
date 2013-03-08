//
//  MOBadgeView.h
//  PlaceHolerTextView
//
//  Created by an hailin on 7/3/13.
//  Copyright (c) 2013 mozat. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kMaxBadgeNumber	100

@interface MOBadgeView : UIView
@property (nonatomic, assign) NSUInteger badgeNumber;
@property (nonatomic, retain) UIFont *badgeFont;
@property (nonatomic, retain) UIColor *badgeColor;
@end
