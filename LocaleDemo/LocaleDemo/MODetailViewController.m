//
//  MODetailViewController.m
//  LocaleDemo
//
//  Created by an hailin on 23/8/13.
//  Copyright (c) 2013 mozat. All rights reserved.
//

#import "MODetailViewController.h"

@implementation MODetailViewController
{
	int _dataType;
}

#pragma mark - Managing the detail item

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
		self.title = NSLocalizedString(@"Detail", @"Detail");
    }
    return self;
}

- (void)setItems:(NSArray *)items
{

}

- (void)setItems:(NSArray *)items dataType:(int)dataType
{
	_items = items;
	[self.tableView reloadData];
	
	_dataType = dataType;
	
	switch (dataType)
	{
		case MOItemsDataTypeCountryCode:
		{
			self.title = NSLocalizedString(@"Country Codes", nil);
		}
			break;
		case MOItemsDataTypeLanguageCode:
		{
			self.title = NSLocalizedString(@"Language Codes", nil);
		}
			break;
		case MOItemsDataTypeLocaleIdentifier:
		{
			self.title = NSLocalizedString(@"Locale Identifiers", nil);
		}
			break;
		case MOItemsDataTypeCurrencyCode:
		{
			self.title = NSLocalizedString(@"Currency Codes", nil);
		}
			break;
		case MOItemsDataTypeCommonCurrencyCode:
		{
			self.title = NSLocalizedString(@"Common Currency Codes", nil);
		}
			break;
		default:
			break;
	}
}


#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return self.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	static NSString *CellIdentifier = @"Cell";
	
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier];
    }
	
    NSString *item = self.items[indexPath.row];
    cell.textLabel.text = item;
	
	if (_dataType == MOItemsDataTypeCountryCode)
	{
		NSString *displayName = [[NSLocale currentLocale] displayNameForKey:NSLocaleCountryCode value:item];
		cell.detailTextLabel.text = displayName;
	}
	else if (_dataType == MOItemsDataTypeLanguageCode)
	{
		NSString *displayName = [[NSLocale currentLocale] displayNameForKey:NSLocaleLanguageCode value:item];
		cell.detailTextLabel.text = displayName;
	}
	else if (_dataType == MOItemsDataTypeLocaleIdentifier)
	{
		NSString *displayName = [[NSLocale currentLocale] displayNameForKey:NSLocaleIdentifier value:item];
		cell.detailTextLabel.text = displayName;
	}
	else if (_dataType == MOItemsDataTypeCurrencyCode)
	{
		NSString *displayName = [[NSLocale currentLocale] displayNameForKey:NSLocaleCurrencyCode value:item];
		cell.detailTextLabel.text = displayName;
	}
	else if (_dataType == MOItemsDataTypeCommonCurrencyCode)
	{
		NSString *displayName = [[NSLocale currentLocale] displayNameForKey:NSLocaleCurrencyCode value:item];
		cell.detailTextLabel.text = displayName;
	}
	else
	{
		cell.detailTextLabel.text = nil;
	}
	
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	NSString *item = self.items[indexPath.row];
	if (_dataType == MOItemsDataTypeLocaleIdentifier)
	{
		NSLocale *locale = [[NSLocale alloc] initWithLocaleIdentifier:item];
		
		/* Not all locale property keys have values with display name values. */
		NSString *country = [[NSLocale currentLocale] displayNameForKey:NSLocaleCountryCode value:[locale objectForKey:NSLocaleCountryCode]];
		NSString *language = [[NSLocale currentLocale] displayNameForKey:NSLocaleLanguageCode value:[locale objectForKey:NSLocaleLanguageCode]];
		NSString *currency = [[NSLocale currentLocale] displayNameForKey:NSLocaleCurrencyCode value:[locale objectForKey:NSLocaleCurrencyCode]];
		NSString *decimalSeparator = [locale objectForKey:NSLocaleDecimalSeparator];
		
		NSLog(@"country: %@ language: %@ currency: %@ decimalSeparator: %@", country, language, currency, decimalSeparator);
	}
	
}

@end
