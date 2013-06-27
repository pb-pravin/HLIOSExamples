//
//  MOViewController.h
//  SearchTable2
//
//  Created by an hailin on 26/6/13.
//  Copyright (c) 2013 mozat. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MOViewController : UITableViewController <UISearchDisplayDelegate>
@property (nonatomic, strong) NSArray *listContent;
@property (nonatomic, strong) NSMutableArray *filteredListContent;
@end
