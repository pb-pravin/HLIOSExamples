//
//  HLDetailViewController.m
//  WordsGuess
//
//  Created by an hailin on 6/22/13.
//  Copyright (c) 2013 mozat. All rights reserved.
//

#import "HLDetailViewController.h"

#define kItemIndexPath @"itemIndex"

@interface HLDetailViewController ()
@property (nonatomic, readonly, strong) NSArray *items;
@property (nonatomic, assign) NSUInteger itemIndex;
@property (strong, nonatomic) IBOutlet UILabel *questionLabel;
@property (strong, nonatomic) IBOutlet UILabel *noteLabel;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *countItem;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *preButtonItem;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *nextButtonItem;
- (IBAction)loadPreviousWordGuess:(id)sender;
- (IBAction)loadNextWordGuess:(id)sender;
@end

@implementation HLDetailViewController

- (id)initWithItems:(NSArray *)items loadIndex:(NSUInteger)idx
{
    self = [super initWithNibName:@"HLDetailViewController"
                           bundle:nil];
    if (self)
    {
        _items = items;
        self.itemIndex = idx;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.preButtonItem.title = NSLocalizedString(@"Previous", nil);
    self.nextButtonItem.title = NSLocalizedString(@"Next", nil);
    
    [self addObserver:self forKeyPath:kItemIndexPath
              options:NSKeyValueObservingOptionNew
              context:NULL];
    self.itemIndex = self.itemIndex;
    
    UIBarButtonItem *answerBtn = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"answer", nil)
                                                                  style:UIBarButtonItemStylePlain
                                                                 target:self
                                                                 action:@selector(showAnswer:)];
    self.navigationItem.rightBarButtonItem = answerBtn;
    
}

- (void)showAnswer:(id)sender
{
    NSDictionary *wordGuessInfo = self.items[self.itemIndex];
    NSString *answer = wordGuessInfo[kWordGuessKeyAnswer];
    [[[UIAlertView alloc] initWithTitle:nil
                                message:answer
                               delegate:nil
                      cancelButtonTitle:nil
                      otherButtonTitles:NSLocalizedString(@"OK", nil), nil] show];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)viewDidUnload
{
    [self setQuestionLabel:nil];
    [self setNoteLabel:nil];
    [self setCountItem:nil];
    [self setPreButtonItem:nil];
    [self setNextButtonItem:nil];
    [self removeObserver:self forKeyPath:kItemIndexPath];
    [super viewDidUnload];
}

- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary *)change
                       context:(void *)context
{
    if (object == self && [keyPath isEqualToString:kItemIndexPath])
    {
        NSParameterAssert(self.itemIndex >= 0 && self.itemIndex < self.items.count);
        
        self.preButtonItem.enabled = (self.itemIndex > 0);
        self.nextButtonItem.enabled = (self.itemIndex < (self.items.count - 1));
        self.countItem.title = [NSString stringWithFormat:@"%d/%d", self.itemIndex + 1, self.items.count];
        
        NSDictionary *wordGuessInfo = self.items[self.itemIndex];
        self.questionLabel.text = self.title = wordGuessInfo[kWordGuessKeyQuestion];
        self.noteLabel.text = wordGuessInfo[kWordGuessKeyNote];
    }
}

- (IBAction)loadPreviousWordGuess:(id)sender
{
    self.itemIndex--;
}

- (IBAction)loadNextWordGuess:(id)sender
{
    self.itemIndex++;
}

@end
