//
//  MOViewController.h
//  PullToRefreshDemo
//
//  Created by an hailin on 26/1/13.
//  Copyright (c) 2013 mozat. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PullTableView.h"

@interface MOImagePickerViewController : UIViewController <PullTableViewDelegate, UITableViewDataSource>
- (IBAction)doTask:(id)sender;

@property (retain, nonatomic) IBOutlet PullTableView *pullTableView;

@end
