//
//  HLDetailViewController.h
//  Master-DetailApp
//
//  Created by an hailin on 12/28/12.
//  Copyright (c) 2012 HailinAn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HLDetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
