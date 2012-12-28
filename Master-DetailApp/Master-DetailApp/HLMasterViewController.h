//
//  HLMasterViewController.h
//  Master-DetailApp
//
//  Created by an hailin on 12/28/12.
//  Copyright (c) 2012 HailinAn. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HLDetailViewController;

@interface HLMasterViewController : UITableViewController

@property (strong, nonatomic) HLDetailViewController *detailViewController;

@end
