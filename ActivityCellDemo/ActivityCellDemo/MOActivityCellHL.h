//
//  MOActivityCellHL.h
//  Mozat
//
//  Created by an hailin on 24/1/13.
//  Copyright (c) 2013 MOZAT Pte Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MOActivity.h"

@interface MOActivityCellHL : UITableViewCell <SDWebImageManagerDelegate>

@property (nonatomic, retain) MOActivity *activity;
@property (nonatomic, assign) BOOL firstCell;
@property (nonatomic, assign) BOOL lastCell;

@end
