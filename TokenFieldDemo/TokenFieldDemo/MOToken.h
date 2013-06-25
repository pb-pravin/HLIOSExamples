//
//  MOToken.h
//  TokenFieldDemo
//
//  Created by an hailin on 19/6/13.
//  Copyright (c) 2013 mozat. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kTokenFieldFontSize      14.0
#define kTokenFieldPaddingX      6.0
#define kTokenFieldPaddingY      6.0
#define kTokenFieldTokenHeight   (kTokenFieldFontSize + 4.0)
#define kTokenFieldMaxTokenWidth 260.0
#define kTokenFieldFrameKeyPath  @"frame"
#define kTokenFieldShadowHeight  14.0
#define kTokenFieldRowHeight	(kTokenFieldPaddingY * 2.0 + kTokenFieldTokenHeight)

@class MOTokenField;

@interface MOToken : UIButton
@property (nonatomic, copy) NSString *title;
@property (nonatomic, retain) id associatedObject;
@property (nonatomic, retain) MOTokenField *container;

+ (MOToken *)tokenWithTitle:(NSString *)title associatedObject:(id)obj container:(MOTokenField *)container;

@end