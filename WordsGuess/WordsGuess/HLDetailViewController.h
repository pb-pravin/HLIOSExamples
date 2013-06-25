//
//  HLDetailViewController.h
//  WordsGuess
//
//  Created by an hailin on 6/22/13.
//  Copyright (c) 2013 mozat. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kWordGuessKeyQuestion   @"question"
#define kWordGuessKeyNote       @"note"
#define kWordGuessKeyAnswer     @"answer"


@interface HLDetailViewController : UIViewController
- (id)initWithItems:(NSArray *)items loadIndex:(NSUInteger)idx;
@end
