//
//  MOBadgeViewController.h
//  UICharCountingTextView
//
//  Created by an hailin on 3/6/13.
//  Copyright (c) 2013 mozat. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MOBadgeViewController : UITableViewController

@end

#define kSessionCellHeight 64.f
@interface MOSessionCell : UITableViewCell
@property (nonatomic, strong) NSString *session;
@end