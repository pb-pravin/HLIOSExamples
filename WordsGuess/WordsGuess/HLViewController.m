//
//  HLViewController.m
//  WordsGuess
//
//  Created by an hailin on 6/22/13.
//  Copyright (c) 2013 mozat. All rights reserved.
//

#import "HLViewController.h"
#import "HLDetailViewController.h"

#define kWordGuessKey           @"word_guesses"

@interface HLViewController ()
@property (nonatomic, strong) NSArray *items;
@end

@implementation HLViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = NSLocalizedString(@"Word Guess", nil);
    NSString *path = [[NSBundle mainBundle] pathForResource:@"words_guess" ofType:@"json"];
    NSData *jsonData = [NSData dataWithContentsOfFile:path];
    NSError *error;
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:jsonData
                                                         options:kNilOptions
                                                           error:&error];
    NSAssert(error == nil, error.localizedDescription);
    if (error)
    {
        self.items = [NSArray array];
    }
    else
    {
        self.items = dict[kWordGuessKey];
    }
    
    /* Remove the repaat guesses. Don't need anymore.
    NSMutableArray *mutableArray = [NSMutableArray arrayWithArray:self.items];
    NSMutableIndexSet *toRemoveIdx = [NSMutableIndexSet indexSet];
    NSMutableSet *questions = [NSMutableSet set];
    [mutableArray enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        NSDictionary *info = (NSDictionary *)obj;
        NSString *question = info[kWordGuessKeyQuestion];
        if ([self contains:questions string:question])
        {
            [toRemoveIdx addIndex:idx];
        }
        else
        {
            [questions addObject:question];
        }
    }];
    
    [mutableArray removeObjectsAtIndexes:toRemoveIdx];

    NSDictionary *guesses = [NSDictionary dictionaryWithObject:mutableArray forKey:kWordGuessKey];
    
    if ([NSJSONSerialization isValidJSONObject:guesses]) {
        NSError *error;
        NSData *data = [NSJSONSerialization dataWithJSONObject:guesses
                                                       options:NSJSONWritingPrettyPrinted
                                                         error:&error];
        NSString *result = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        NSLog(@"%@", result);
    }
    */
    
}

//- (BOOL)contains:(NSSet *)set string:(NSString *)s
//{
//    for (NSString *str in set)
//    {
//        if ([str isEqualToString:s])
//        {
//            return YES;
//        }
//    }
//    return NO;
//}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)viewDidUnload {
    [self setTableView:nil];
    [super viewDidUnload];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"CellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1
                                      reuseIdentifier:CellIdentifier];
    }
    
    NSDictionary *wordGuessInfo = self.items[indexPath.row];
    cell.textLabel.text = wordGuessInfo[kWordGuessKeyQuestion];
    cell.detailTextLabel.text = wordGuessInfo[kWordGuessKeyNote];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    HLDetailViewController *detailVC = [[HLDetailViewController alloc] initWithItems:self.items
                                                                           loadIndex:indexPath.row];
    [self.navigationController pushViewController:detailVC animated:YES];
}

@end
