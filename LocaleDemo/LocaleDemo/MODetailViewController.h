//
//  MODetailViewController.h
//  LocaleDemo
//
//  Created by an hailin on 23/8/13.
//  Copyright (c) 2013 mozat. All rights reserved.
//

#import <UIKit/UIKit.h>

enum
{
	MOItemsDataTypeCountryCode = 0,
	MOItemsDataTypeLanguageCode = 1,
	MOItemsDataTypeLocaleIdentifier = 2,
	MOItemsDataTypeCurrencyCode = 3,
	MOItemsDataTypeCommonCurrencyCode = 4
};


@interface MODetailViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic, readonly) NSArray *items;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

- (void)setItems:(NSArray *)items dataType:(int)dataType;

@end
