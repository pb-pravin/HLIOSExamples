//
//  UIPlaceHolderTextView.h
//  Mozat
//
//  Created by tao tao on 11/1/12.
//  Copyright (c) 2012 MOZAT Pte Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIPlaceHolderTextView : UITextView
{
    NSString *placeholder;
	NSUInteger maxNumberOfCharacter;
}

@property (nonatomic, retain) NSString *placeholder;
@property (nonatomic, assign) NSUInteger maxNumberOfCharacter;
@property (readwrite, retain) UIView *inputView;
-(void)textChanged:(NSNotification*)notification;

@end
