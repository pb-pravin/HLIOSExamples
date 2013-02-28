//
//  MOModalViewController.m
//  UIButtonTest
//
//  Created by an hailin on 27/12/12.
//  Copyright (c) 2012 an hailin. All rights reserved.
//

#import "MOModalViewController.h"
#import "MOTextFieldCell.h"

@interface MOModalViewController ()
@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) MOBarButtonItem *cancelBtn;
@property (strong, nonatomic) MOBarButtonItem *saveBtn;

- (IBAction)cancelEdit:(id)sender;
- (IBAction)saveEdit:(id)sender;
@end

@implementation MOModalViewController

- (IBAction)cancelEdit:(id)sender
{
    [self.presentingViewController dismissModalViewControllerAnimated:YES];
}

- (IBAction)saveEdit:(id)sender
{
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    MOTextFieldCell *cell = (MOTextFieldCell *)[self.tableView cellForRowAtIndexPath:indexPath];
    NSString *result = cell.rowTextField.text;
    if (self.delegate)
    {    
        [self.delegate modalViewController:self DidEdit:result];
    }
}

/** Lazy initialization for cancel bar button item
 */
- (UIBarButtonItem *)cancelBtn
{
    if (_cancelBtn == nil) {
        _cancelBtn = [[MOBarButtonItem alloc] initBarButtonItemWithTitle:@"Cancel"
                                                                   target:self
                                                                   action:@selector(cancelEdit:)];
    }
    return _cancelBtn;
}

/** Lazy initialization for save bar button item
 */
- (UIBarButtonItem *)saveBtn
{
    if (_saveBtn == nil) {
        _saveBtn = [[MOBarButtonItem alloc] initDoneBarButtonItemWithTitle:@"Save"
                                                                 target:self
                                                                 action:@selector(saveEdit:)];
    }
    return _saveBtn;
}

#pragma mark - UIView lifecircle

/*
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Hello";
    }
    return self;
}
*/

- (id)init
{
    self = [super init];
    if (self) {
        self.title = @"hello";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    // Create the navigation bar
    CGFloat navBarHeight = 44.f;
    UINavigationBar *navBar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 0, 320, navBarHeight)];
    // For IOS version of above 5.0
    UIImage *navBarBackgroundImage = [[UIImage imageNamed:@"NavBarBackground.png"] stretchableImageWithLeftCapWidth:0 topCapHeight:0];
    [navBar setBackgroundImage:navBarBackgroundImage forBarMetrics:UIBarMetricsDefault];
    // The navigation item
    UINavigationItem *navItem = [[UINavigationItem alloc] initWithTitle:self.title];
    UILabel *titleView = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 160, 24)];
    titleView.text = @"Add by Phone Number";
    titleView.textAlignment = UITextAlignmentCenter;
    titleView.backgroundColor = [UIColor clearColor];
    titleView.font = [UIFont boldSystemFontOfSize:20.0];
    titleView.shadowColor = [UIColor colorWithWhite:0.0 alpha:0.5];
    titleView.textColor = [UIColor blackColor];
    navItem.titleView = titleView;
    [titleView release];

    // The cancel bar button item
    navItem.leftBarButtonItem = self.cancelBtn;
    navItem.rightBarButtonItem = self.saveBtn;
    
    navBar.items = [NSArray arrayWithObject:navItem];
    [navItem release];
    [self.view addSubview:navBar];
    [navBar release];
    
    CGRect rect = self.view.frame;
    rect.origin.y = navBar.frame.origin.y + navBarHeight;
    rect.size.height -= navBarHeight;
    _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    _tableView.frame = rect;
    _tableView.delegate =  self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    MOTextFieldCell *cell = (MOTextFieldCell *)[self.tableView cellForRowAtIndexPath:indexPath];
    [cell.rowTextField becomeFirstResponder];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
	NSLog(@"#2 receive memory warning.");
}

- (void)dealloc
{
    [_tableView release], _tableView = nil;
    [_cancelBtn release], _cancelBtn = nil;
    [_saveBtn release], _saveBtn = nil;
    [super dealloc];
}

#pragma - UITableView datasource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *CellIdentifier = @"Cell";
    MOTextFieldCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[MOTextFieldCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    cell.rowTextField.placeholder = @"Input your name.";
    
    return cell;
}

#pragma - UITableView delegate



@end
