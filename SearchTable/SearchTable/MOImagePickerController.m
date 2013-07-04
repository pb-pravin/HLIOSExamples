//
//  MOViewController.m
//  SearchTable
//
//  Created by an hailin on 25/6/13.
//  Copyright (c) 2013 mozat. All rights reserved.
//

#import "MOViewController.h"
#import "Product.h"
#import <QuartzCore/QuartzCore.h>
#import <QuartzCore/CALayer.h>

@interface MOImagePickerController ()
@property (nonatomic, strong) IBOutlet UITableView *tableView;
@property (nonatomic, strong) CAGradientLayer *shadowLayer;
@end

@implementation MOImagePickerController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// create a filtered list that will contain products for the search results table.
	self.filteredListContent = [NSMutableArray arrayWithCapacity:[self.listContent count]];
	
	
	// Shadow layer
    self.shadowLayer = [CAGradientLayer layer];
    self.shadowLayer.frame = CGRectMake(0, 60+ CGRectGetMinX(self.tableView.frame) + CGRectGetHeight(self.searchDisplayController.searchBar.frame), CGRectGetWidth(self.view.bounds), 14);
    self.shadowLayer.colors = [NSArray arrayWithObjects:
                               (__bridge id)[UIColor colorWithWhite:0.0 alpha:0.3].CGColor,
                               (__bridge id)[UIColor colorWithWhite:0.0 alpha:0.3].CGColor,
                               (__bridge id)[UIColor colorWithWhite:0.0 alpha:0.1].CGColor,
                               (__bridge id)[UIColor colorWithWhite:0.0 alpha:0.0].CGColor, nil];
    self.shadowLayer.locations = [NSArray arrayWithObjects:
                                  [NSNumber numberWithDouble:0.0],
                                  [NSNumber numberWithDouble:1.0 / 14],
                                  [NSNumber numberWithDouble:1.0 / 14],
                                  [NSNumber numberWithDouble:1.0], nil];
	
    [self.view.layer addSublayer:self.shadowLayer];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	if (tableView == self.searchDisplayController.searchResultsTableView)
	{
		return self.filteredListContent.count;
	}
	else
	{
		return self.listContent.count;
	}
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	static NSString *kCellID = @"cellID";
	
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellID];
	if (cell == nil)
	{
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kCellID];
		cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
	}
	
	/*
	 If the requesting table view is the search display controller's table view, configure the cell using the filtered content, otherwise use the main list.
	 */
	Product *product = nil;
	if (tableView == self.searchDisplayController.searchResultsTableView)
	{
        product = [self.filteredListContent objectAtIndex:indexPath.row];
    }
	else
	{
        product = [self.listContent objectAtIndex:indexPath.row];
    }
	
	cell.textLabel.text = product.name;
	return cell;

}


#pragma mark -
#pragma mark Content Filtering

- (void)filterContentForSearchText:(NSString*)searchText scope:(NSString*)scope
{
	/*
	 Update the filtered array based on the search text and scope.
	 */
	
	[self.filteredListContent removeAllObjects]; // First clear the filtered array.
	
	/*
	 Search the main list for products whose type matches the scope (if selected) and whose name matches searchText; add items that match to the filtered array.
	 */
	for (Product *product in self.listContent)
	{
		if ([scope isEqualToString:@"All"] || [product.type isEqualToString:scope])
		{
			NSComparisonResult result = [product.name compare:searchText options:(NSCaseInsensitiveSearch|NSDiacriticInsensitiveSearch) range:NSMakeRange(0, [searchText length])];
            if (result == NSOrderedSame)
			{
				[self.filteredListContent addObject:product];
            }
		}
	}
}


#pragma mark -
#pragma mark UISearchDisplayController Delegate Methods

- (BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString
{
    [self filterContentForSearchText:searchString scope:@"All"/*
	 [[self.searchDisplayController.searchBar scopeButtonTitles] objectAtIndex:[self.searchDisplayController.searchBar selectedScopeButtonIndex]]*/];
    
    // Return YES to cause the search result table view to be reloaded.
    return YES;
}


- (BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchScope:(NSInteger)searchOption
{
    [self filterContentForSearchText:[self.searchDisplayController.searchBar text] scope:
	 [[self.searchDisplayController.searchBar scopeButtonTitles] objectAtIndex:searchOption]];
    
    // Return YES to cause the search result table view to be reloaded.
    return YES;
}

@end
