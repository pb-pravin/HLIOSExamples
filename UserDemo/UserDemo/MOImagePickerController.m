//
//  MOViewController.m
//  UserDemo
//
//  Created by an hailin on 26/2/13.
//  Copyright (c) 2013 mozat. All rights reserved.
//

#import "MOViewController.h"
#import "MOUserManager.h"
#import "MOUser.h"

@interface MOImagePickerController ()

@end

@implementation MOImagePickerController

- (void)dealloc {
	[super dealloc];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.title = @"Users List";
	[[MOUserManager sharedManager] loadUsers];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view datasource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [MOUserManager sharedManager].users.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"CellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1
									   reuseIdentifier:CellIdentifier] autorelease];
		cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
	
	MOUser *user = [[MOUserManager sharedManager].users objectAtIndex:indexPath.row];
	cell.textLabel.text = user.name;
	cell.detailTextLabel.text = user.tagline;
    return cell;
}

#pragma mark - Table view delegate

- (CGFloat)tableView:(UITableView *)tableView
heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}

@end
