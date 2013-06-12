//
//  MOBadgeViewController.m
//  UICharCountingTextView
//
//  Created by an hailin on 3/6/13.
//  Copyright (c) 2013 mozat. All rights reserved.
//

#import "MOBadgeViewController.h"
#import "MOBadgeView.h"
@interface MOBadgeViewController ()

@end

@implementation MOBadgeViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
	self.tableView.rowHeight = kSessionCellHeight;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    MOSessionCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[MOSessionCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
		cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    cell.session = @"Hailin An";
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     [detailViewController release];
     */
}

@end

#define kSpaceWidth                  8
#define kPhotoWidth                  48
#define kAvatarImageViewCornerRadius 4

@interface MOSessionCell ()
@property (nonatomic, strong) UILabel *sublineLabel;
@property (nonatomic, strong) MOBadgeView *countOfUnreadMsgBadge;
@end

@implementation MOSessionCell
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        self.sublineLabel = [[UILabel alloc] initWithFrame:CGRectMake(kPhotoWidth + 2 * kSpaceWidth, 28, 0, 0)];
        self.sublineLabel.backgroundColor = [UIColor clearColor];
        self.sublineLabel.font = [UIFont systemFontOfSize:12];
		
		self.countOfUnreadMsgBadge = [[MOBadgeView alloc] initWithFrame:CGRectMake(self.contentView.frame.size.width - 100,
																				   self.contentView.frame.size.height - 8,
																				   30, 25)];
		
		self.countOfUnreadMsgBadge.backgroundColor = [UIColor grayColor];
        [self.contentView addSubview:self.sublineLabel];
		[self.contentView addSubview:self.countOfUnreadMsgBadge];
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    NSParameterAssert(self.session);
    if (self.session)
    {
		self.sublineLabel.text = self.session;
		[self.sublineLabel sizeToFit];
		
		NSInteger countOfUnreadMsg = 10;
		self.countOfUnreadMsgBadge.badgeNumber = countOfUnreadMsg;
		self.countOfUnreadMsgBadge.hidden = (countOfUnreadMsg <= 0);
		
		for (UIView *subView in self.countOfUnreadMsgBadge.subviews) {
			NSLog(@"%@", subView);
		}
    }
}

- (void)setSession:(NSString *)session
{
    if (_session != session)
    {
        _session = session;
    }
	[self setNeedsDisplay];
}

@end
