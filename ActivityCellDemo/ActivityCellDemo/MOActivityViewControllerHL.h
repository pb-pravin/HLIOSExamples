//
//  MOActivityViewControllerHL.h
//  Mozat
//
//  Created by an hailin on 24/1/13.
//  Copyright (c) 2013 MOZAT Pte Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MOActivityCellHL;

@interface MOActivityViewControllerHL : UIViewController <UITableViewDataSource, UITableViewDelegate>





@property (nonatomic, retain) IBOutlet MOActivityCellHL *tmpCell;
@property (nonatomic, retain) UINib *cellNib;


@end
