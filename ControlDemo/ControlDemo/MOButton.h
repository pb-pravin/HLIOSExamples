//
//  MOButton.h
//  Mozat
//
//  Created by zhenling on 28/12/12.
//  Copyright (c) 2012 MOZAT Pte Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kTitleLabelFontSize			13
#define kTitleLabelDefaultColor		[UIColor blackColor]
#define kTitleLabelHighlightedColor [UIColor whiteColor]
#define kTitleLabelHeight			(kTitleLabelFontSize + 3)
#define kTitleLabelBottomMargin		16
#define kImageViewTopMargin			12

@interface MOButton : UIControl
{
	__strong UIImage *_image;
	__strong UIImage *_highligtedImage;
}
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UILabel *titleLabel;
- (void)setTitle:(NSString *)title image:(UIImage *)image highlightedImage:(UIImage *)highlightedImage;
@end
