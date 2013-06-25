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
@property (strong, nonatomic) IBOutlet UITextField *inputField;
@property (strong, nonatomic) IBOutlet UIButton *guessButton;
- (IBAction)guess:(id)sender;
- (IBAction)loadPreviousWordGuess:(id)sender;
- (IBAction)loadNextWordGuess:(id)sender;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *countItem;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *preButtonItem;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *nextButtonItem;
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
    [self.inputField addTarget:self
                        action:@selector(inputTextChanged:)
              forControlEvents:UIControlEventEditingChanged];
    
    [self addObserver:self forKeyPath:kItemIndexPath
              options:NSKeyValueObservingOptionNew
              context:NULL];
    self.itemIndex = self.itemIndex;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)viewDidUnload
{
    [self setQuestionLabel:nil];
    [self setNoteLabel:nil];
    [self setInputField:nil];
    [self setGuessButton:nil];
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
        self.questionLabel.text = wordGuessInfo[kWordGuessKeyQuestion];
        self.noteLabel.text = wordGuessInfo[kWordGuessKeyNote];
    }
}

- (void)inputTextChanged:(id)sender
{
    NSString *text = [self.inputField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    self.guessButton.enabled = text.length > 0;
}

- (IBAction)guess:(id)sender
{
    [self.inputField resignFirstResponder];
    NSString *answer = [self.inputField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    NSDictionary *wordGuessInfo = self.items[self.itemIndex];
    
    NSString *mesage = [answer isEqualToString:wordGuessInfo[kWordGuessKeyAnswer]] ? @"You answer is correct!" : @"Sorry, your answer is wrong, please try again!";
    [[[UIAlertView alloc] initWithTitle:nil
                                message:mesage
                               delegate:nil
                      cancelButtonTitle:nil
                      otherButtonTitles:NSLocalizedString(@"OK", nil), nil] show];
    self.inputField.text = nil;
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
