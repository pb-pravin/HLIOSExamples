//
//  MOTab.h
//  MOTabBarDemo
//
//  Created by an hailin on 7/1/13.
//  Copyright (c) 2013 HailinAn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MOTab : UIButton
{
    BOOL _active;
}

@property (nonatomic, assign, getter = isActive) BOOL active;
@property (nonatomic, retain) NSString *imageName;

- (id)initWithIconImageName:(NSString *)imageName;
@end
