//
//  MOActivityViewControllerHL.m
//  Mozat
//
//  Created by an hailin on 24/1/13.
//  Copyright (c) 2013 MOZAT Pte Ltd. All rights reserved.
//

#import "MOActivityViewControllerHL.h"
#import "MOActivityCellHL.h"

@interface MOActivityViewControllerHL ()
@property (nonatomic, retain) UITableView *tableView;
@end

@implementation MOActivityViewControllerHL

#pragma mark - Life circle

- (id)init
{
    self = [super init];
    if (self) {
        self.title = NSLocalizedString(@"Activities", @"");
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.hidesBottomBarWhenPushed = YES;
    
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds
                                              style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.backgroundView = nil;
    
    
    [self.view addSubview:self.tableView];
    
    self.cellNib = [UINib nibWithNibName:@"MOAcitivityCell" bundle:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)dealloc {
    [_tableView release];
    [_tmpCell release];
    [super dealloc];
}

#pragma mark - Action methods

- (IBAction)back:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - Table view datasource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

static int count = 0;

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"CellIdentifier";
    MOActivityCellHL *cell = (MOActivityCellHL *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        NSArray *objs = [self.cellNib instantiateWithOwner:self options:nil];
        
        NSLog(@"load count #%d", ++count);
        
        
        NSLog(@"%@ retainCount %d", self.tmpCell, self.tmpCell.retainCount);
        
		cell = self.tmpCell;
		self.tmpCell = nil;
        int i = 0;
        for (id obj in objs) {
            NSLog(@"#%d %@ retainCount %d", ++i, obj, [obj retainCount]);
        }
        
    }
    
    //    "type": 1,
    //    "content": "http://api.mozat.net/images/80/df/dffdc176baa05c90c3db3d2d15599c99.jpg",
    //    "time": "1356333945",
    //    "userId": 100002,
    //    "name": "xxx",
    //    "avatar": "http://api.mozat.net/images/80/df/dffdc176baa05c90c3db3d2d15599c99.jpg"
    
    NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithInt:1], @"type",
                          @"http://api.mozat.net/images/80/df/dffdc176baa05c90c3db3d2d15599c99.jpg", @"content",
                          @"1356333945", @"time",
                          [NSNumber numberWithInt:100031], @"userId",
                          @"HailinText", @"name",
                          @"http://api.mozat.net/images/80/df/dffdc176baa05c90c3db3d2d15599c99.jpg", @"avatar", nil];
    cell.activity = [[[MOActivity alloc] initWithDictionary:dict] autorelease];
    
    return cell;
}

#pragma mark - Table view delegate

- (CGFloat)tableView:(UITableView *)tableView
heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 230;

}

@end
