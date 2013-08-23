//
//  MOMasterViewController.m
//  LocaleDemo
//
//  Created by an hailin on 23/8/13.
//  Copyright (c) 2013 mozat. All rights reserved.
//

#import "MOMasterViewController.h"

#import "MODetailViewController.h"


enum
{
	kRowIndexCountryCode = 0,
	kRowIndexLanguageCode = 1,
	kRowIndexLocaleIndentifier = 2,
	kRowIndexCurrencyCode = 3,
	kRowIndexCommonCurrencyCode = 4
};

@interface MOMasterViewController () {
    NSMutableArray *_objects;
	// Demo the difference between current locale object and autoupdating current locale object.
	NSLocale *_currentLocale;
	NSLocale *_autoupdatingCurrentLocale;
}
@end

@implementation MOMasterViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        self.title = NSLocalizedString(@"Master", @"Master");
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
	_objects = [[NSMutableArray alloc] initWithObjects:
				NSLocalizedString(@"Country Codes", nil),
				NSLocalizedString(@"language Codes", nil),
				NSLocalizedString(@"Locale Identifiers", nil),
				NSLocalizedString(@"Currency Codes", nil),
				NSLocalizedString(@"Common Currency Codes", nil), nil];
	
	[[NSNotificationCenter defaultCenter] addObserver:self
											 selector:@selector(localeDidChange:)
												 name:NSCurrentLocaleDidChangeNotification object:nil];
	
	_currentLocale = [NSLocale currentLocale];
	_autoupdatingCurrentLocale = [NSLocale autoupdatingCurrentLocale];
}

- (void)localeDidChange:(NSNotification *)notification
{
	NSString *message = [NSString stringWithFormat:@"current locale: %@ autoupdatingcurrent locale: %@",
						 [_currentLocale localeIdentifier], [_autoupdatingCurrentLocale localeIdentifier]];
	
	[[[UIAlertView alloc] initWithTitle:@"Current Locale"
								message:message
							   delegate:nil
					  cancelButtonTitle:nil
					  otherButtonTitles:@"OK", nil] show];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _objects.count;
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
	
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
	
    NSDate *object = _objects[indexPath.row];
    cell.textLabel.text = [object description];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	if (!self.detailViewController)
	{
		self.detailViewController = [[MODetailViewController alloc] initWithNibName:@"MODetailViewController" bundle:nil];
	}
	
	switch (indexPath.row)
	{
		case kRowIndexCountryCode:
		{
			[self.detailViewController setItems:[NSLocale ISOCountryCodes] dataType:MOItemsDataTypeCountryCode];
		}
			break;
		case kRowIndexLanguageCode:
		{
			[self.detailViewController setItems:[NSLocale ISOLanguageCodes] dataType:MOItemsDataTypeLanguageCode];
		}
			break;
		case kRowIndexLocaleIndentifier:
		{
			[self.detailViewController setItems:[NSLocale availableLocaleIdentifiers] dataType:MOItemsDataTypeLocaleIdentifier];
		}
			break;
		case kRowIndexCurrencyCode:
		{
			[self.detailViewController setItems:[NSLocale ISOCurrencyCodes] dataType:MOItemsDataTypeCurrencyCode];
		}
			break;
		case kRowIndexCommonCurrencyCode:
		{
			[self.detailViewController setItems:[NSLocale commonISOCurrencyCodes] dataType:MOItemsDataTypeCommonCurrencyCode];
		}
			break;
		default:
			break;
	}
	
	[self.navigationController pushViewController:self.detailViewController animated:YES];
	
}

@end
