//
//  MOTokenField.h
//  TokenFieldDemo
//
//  Created by an hailin on 19/6/13.
//  Copyright (c) 2013 mozat. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MOToken.h"


@interface MOTokenField : UIView <UITextFieldDelegate>

@property (nonatomic, retain) NSMutableArray *tokens;
@property (nonatomic, retain) UITextField *textField;
@property (nonatomic, retain) MOToken *selectedToken;

@end
