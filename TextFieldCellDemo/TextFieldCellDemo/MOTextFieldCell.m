//
//  MOTextFieldCell.m
//  Mozat
//
//  Created by an hailin on 2/1/13.
//  Copyright (c) 2013 MOZAT Pte Ltd. All rights reserved.
//

#import "MOTextFieldCell.h"

@implementation MOTextFieldCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        CGFloat cellHeight = 44;
        
        CGFloat leftMargin = 5;
        CGFloat topMargin = 10;
        _rowTextField = [[UITextField alloc] init];
        _rowTextField.frame = CGRectMake(leftMargin,  // x
                                         topMargin,   // y
                                         300 - leftMargin * 2,    // width
                                         cellHeight - topMargin * 2);   // height
        _rowTextField.backgroundColor = [UIColor clearColor];
        _rowTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
        [self.contentView addSubview:_rowTextField];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
}

- (void)dealloc
{
    [_rowTextField release], _rowTextField = nil;
    [super dealloc];
}

@end
