//
//  MOLabelFieldCell.m
//  UIButtonTest
//
//  Created by an hailin on 27/12/12.
//  Copyright (c) 2012 an hailin. All rights reserved.
//

#import "MOLabelFieldCell.h"

@implementation MOLabelFieldCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        CGFloat cellHeight = 44;
        
        _rowLabel = [[UILabel alloc] init];
        
        CGFloat labelWidth = 80;
        CGFloat labelHeight = 24;
        CGFloat labelLeftMargin = 5;
        _rowLabel.frame = CGRectMake(labelLeftMargin, (cellHeight - labelHeight) / 2, labelWidth, labelHeight);
        _rowLabel.backgroundColor = [UIColor clearColor];
        _rowLabel.textAlignment = UITextAlignmentCenter;
        _rowLabel.font = [UIFont boldSystemFontOfSize:14];
        _rowLabel.adjustsFontSizeToFitWidth = YES;
        [self.contentView addSubview:_rowLabel];
        [_rowLabel release];
        
        CGFloat labelTextFieldSpace = 5;
        CGFloat textFieldHeight = 24;
        CGFloat textFieldRightMargin = 5;
        _rowTextField = [[UITextField alloc] init];
        _rowTextField.frame = CGRectMake(_rowLabel.frame.origin.x + labelWidth + labelTextFieldSpace,  // x
                                         (cellHeight - textFieldHeight) / 2,   // y
                                         300 - labelLeftMargin -labelWidth - labelTextFieldSpace - textFieldRightMargin,    // width
                                         textFieldHeight);   // height
        _rowTextField.backgroundColor = [UIColor clearColor];
        _rowTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
        [self.contentView addSubview:_rowTextField];
        [_rowTextField release];
        
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
}

- (void)dealloc
{
    [_rowLabel release], _rowLabel = nil;
    [_rowTextField release], _rowTextField = nil;
    [super dealloc];
}

@end
