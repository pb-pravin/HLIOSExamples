//
//  HLAppDelegate.h
//  CustomizedTabBarDemo
//
//  Created by an hailin on 7/1/13.
//  Copyright (c) 2013 HailinAn. All rights reserved.
//

#import <UIKit/UIKit.h>



UIImageView *serivceImg;
UIImageView *contactImg;
UIImageView *bookingImg;

#define kserviceHover @"TabIconChatsActive.png"
#define kservice @"TabIconChats.png"
#define ktabContactHover @"TabIconSocialActive.png"
#define ktabContact @"TabIconSocial.png"
#define ktabBookingHover @"TabMeMask.png"
#define ktabBooking @"TabMeMask.png"

@interface HLAppDelegate : UIResponder <UIApplicationDelegate, UITabBarControllerDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) UITabBarController *tabBarController;

@end
