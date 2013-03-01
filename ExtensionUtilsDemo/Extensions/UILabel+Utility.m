//
//  UILabel+Utility.m
//  ControlDemo
//
//  Created by an hailin on 12/1/13.
//  Copyright (c) 2013 HailinAn. All rights reserved.
//

#import "UILabel+Utility.h"

@implementation UILabel (Utility)

- (void)adjustSizeTo:(CGSize)size {
    CGRect rect = self.frame;
    rect.size = size;
    self.frame = rect;
}

@end
