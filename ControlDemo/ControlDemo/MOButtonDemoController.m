//
//  MOButtonDemoController.m
//  ControlDemo
//
//  Created by an hailin on 11/1/13.
//  Copyright (c) 2013 HailinAn. All rights reserved.
//
#import <QuartzCore/QuartzCore.h>
#import "MOButtonDemoController.h"
#import <SDWebImage/UIButton+WebCache.h>
#import "UIImage+Utility.h"
#import "MOGradientTestView.h"
#import "MOButton.h"

@interface MOButtonDemoController ()

@end

@implementation MOButtonDemoController

- (id)init
{
    self = [super init];
    if (self) {
        self.title = @"Button";
    }
    return self;
}

- (void)loadView
{
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    scrollView.contentSize = CGSizeMake(scrollView.frame.size.width, 2*scrollView.frame.size.height);
    // by default, scrollEnabled is YES
    // scrollView.scrollEnabled = YES;
    self.view = scrollView;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    // Demo all kinds of buttons
    
    // RoundRect button
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button1.frame = CGRectMake(10, 5, 300, 30);
    [button1 setTitle:@"Do Something" forState:UIControlStateNormal];
    [button1 addTarget:self action:@selector(callMe:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button1];
    
    
    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeInfoDark];
    button2.frame = CGRectMake(10, button1.frame.origin.y + button1.frame.size.height + 5, 50, 50);
    button2.backgroundColor = [UIColor brownColor];
    [self.view addSubview:button2];
    
    UIButton *button3 = [UIButton buttonWithType:UIButtonTypeInfoLight];
    button3.frame = CGRectMake(button2.frame.origin.x + button2.frame.size.width + 5, button2.frame.origin.y, 50, 50);
    button3.backgroundColor = [UIColor blackColor];
    [self.view addSubview:button3];
    
    UIButton *button4 = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
    button4.frame = CGRectMake(button3.frame.origin.x + button3.frame.size.width + 5, button2.frame.origin.y, 50, 50);
    button4.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:button4];
    
    UIButton *button5 = [UIButton buttonWithType:UIButtonTypeContactAdd];
    button5.frame = CGRectMake(button4.frame.origin.x + button4.frame.size.width + 5, button2.frame.origin.y, 50, 50);
    button5.backgroundColor = [UIColor redColor];
    [self.view addSubview:button5];
    
    // size of image is equal to the size of button
    UIImage *btnImage = [UIImage imageNamed:@"50.jpg"];
    UIButton *button6 = [UIButton buttonWithType:UIButtonTypeCustom];
    button6.frame = CGRectMake(button5.frame.origin.x + button5.frame.size.width + 5, button2.frame.origin.y, btnImage.size.width, btnImage.size.height);
    button6.backgroundColor = [UIColor clearColor];
    [button6 setImage:btnImage forState:UIControlStateNormal];
    button6.imageView.layer.cornerRadius = 6;
    [self.view addSubview:button6];
    
    // Size of btn is larger than image
    // The `imageView` property of button holds the given image, its frame could not be changed.
    // and the size of `imageView` is equal to the size of image, but not larger than the size of button
    UIButton *button7 = [UIButton buttonWithType:UIButtonTypeCustom];
    button7.frame = CGRectMake(10, button2.frame.origin.y + button2.frame.size.height + 5, 80, 80);
    button7.backgroundColor = [UIColor redColor];
    [button7 setImage:[UIImage imageNamed:@"50.jpg"] forState:UIControlStateNormal];
    //button7.imageView.layer.cornerRadius = 7;
    //button7.imageView.frame = CGRectMake(5, 5, 30, 30);
    [self.view addSubview:button7];
    
    // size of btn is smaller than image
    // the image is scaled to fit the button
    UIButton *button8 = [UIButton buttonWithType:UIButtonTypeCustom];
    button8.frame = CGRectMake(button7.frame.origin.x + button7.frame.size.width + 5, button7.frame.origin.y+20, 30, 30);
    button8.backgroundColor = [UIColor redColor];
    [button8 setImage:[UIImage imageNamed:@"50.jpg"] forState:UIControlStateNormal];
    [self.view addSubview:button8];
    
    // Can set different title for different state.
    UIButton *button9 = [UIButton buttonWithType:UIButtonTypeCustom];
    button9.frame = CGRectMake(button8.frame.origin.x + button8.frame.size.width + 5, button7.frame.origin.y, 80, 80);
    button9.backgroundColor = [UIColor redColor];
    [button9 setTitle:@"hello" forState:UIControlStateNormal];
    [button9 setTitle:@"Avatar" forState:UIControlStateHighlighted];
    [self.view addSubview:button9];
    
    // Add a UIImageView into button
    UIButton *button10 = [UIButton buttonWithType:UIButtonTypeCustom];
    button10.frame = CGRectMake(button9.frame.origin.x + button9.frame.size.width + 5, button7.frame.origin.y, 80, 80);
    button10.backgroundColor = [UIColor redColor];
    //[button10 setImage:[UIImage imageNamed:@"50.jpg"] forState:UIControlStateNormal];
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(15, 15, 50, 50)];
    // corner radius doesn't work in this case.
    //imageView.layer.cornerRadius = 10;
    imageView.image = [UIImage imageNamed:@"50.jpg"];
    [button10 addSubview:imageView];
    [self.view addSubview:button10];
    
    // Image is downloaded from internet.
    UIImage *indicatorImage = [UIImage imageNamed:@"activityIndicator.gif"];
    UIButton *button11 = [UIButton buttonWithType:UIButtonTypeCustom];
    button11.frame = CGRectMake(10, button10.frame.origin.y + button10.frame.size.height + 5, 50, 50);
    button11.backgroundColor = [UIColor clearColor];
    [button11 setImageWithURL:[NSURL URLWithString:@"http://my.opera.com/community/users/avatar.pl/838313"] forState:UIControlStateNormal placeholderImage:indicatorImage];
    //[button11 setImageWithURL:[NSURL URLWithString:@"http://my.opera.com/community/users/avatar.pl/838313"] forState:UIControlStateNormal];
    button11.imageView.layer.cornerRadius = 6;
    [self.view addSubview:button11];
    
    
    // Image is also downloaded from internet, but directly by image manager.
    UIButton *button12 = [UIButton buttonWithType:UIButtonTypeCustom];
    button12.tag = 12;
    button12.frame = CGRectMake(button11.frame.origin.x + button11.frame.size.width + 5, button11.frame.origin.y, 50, 50);
    button12.backgroundColor = [UIColor clearColor];
    [button12 setImage:indicatorImage forState:UIControlStateNormal];
    button12.imageView.layer.cornerRadius = 6;
    [self.view addSubview:button12];
    
    // This will get you success.
    NSURL *url = [NSURL URLWithString:@"http://0.gravatar.com/avatar/886d352c61a415a3df24e5d6cac4ac4c?s=50&d=http%3A%2F%2Fwww.lifewithoutpants.com%2Fwp-content%2Fthemes%2Fthesis_18%2Fcustom%2Fimages%2Fnopantsavatar.jpg%3Fs%3D50&r=G"];
    // This will get you failed.
    //NSURL *url = [NSURL URLWithString:@"http://.gravatar.com/avatar/886d352c61a415a3df24e5d6cac4ac4c?s=50&d=http%3A%2F%2Fwww.lifewithoutpants.com%2Fwp-content%2Fthemes%2Fthesis_18%2Fcustom%2Fimages%2Fnopantsavatar.jpg%3Fs%3D50&r=G"];
    
    [button12 setImageWithURL:url
                     forState:UIControlStateNormal
             placeholderImage:indicatorImage
                    completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType) {
                        if (image) {
                            //[[[UIAlertView alloc] initWithTitle:@"Tip" message:@"Succeed to download image" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil] show];
                        } else {
                            //[button12 setImage:[UIImage imageNamed:@"failed.png"]
                            //          forState:UIControlStateNormal];
                            [[[UIAlertView alloc] initWithTitle:@"Error" message:@"Failed to download image" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil] show];
                        }
    }];
    
    // When you just want the image be located at the center of the button.
    UIButton *button13 = [UIButton buttonWithType:UIButtonTypeCustom];
    button13.tag = 13;
    button13.frame = CGRectMake(button12.frame.origin.x + button12.frame.size.width + 5, button11.frame.origin.y, 100, 100);
    button13.backgroundColor = [UIColor redColor];
    
    url = [NSURL URLWithString:@"http://vanessahudgensofficial.com/wp-content/uploads/2011/08/Stewart-Shining-for-People-vanessa-hudgens-3-200x200.jpg"];
    [[SDWebImageManager sharedManager] downloadWithURL:url
                                               options:0
                                              progress:^(NSUInteger receivedSize, long long expectedSize) {
                                                  NSLog(@"%d", receivedSize);
    }
                                             completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, BOOL finished) {
                                                 
                                                 // Scale the image to 80 *80;
                                                 
                                                 if (image) {
                                                     [button13 setImage:[image scaleToSize:CGSizeMake(80, 80)] forState:UIControlStateNormal];
                                                 } else {
                                                     [button13 setImage:[UIImage imageNamed:@"failed.png"] forState:UIControlStateNormal];
                                                 }
    }];
    
    
    [self.view addSubview:button13];

	MOGradientTestView *testVeiw = [[MOGradientTestView alloc] initWithFrame:CGRectMake(button13.frame.origin.x + button13.frame.size.width + 5, button11.frame.origin.y, 100, 100)];
	[self.view addSubview:testVeiw];
	
	// Demo how to create a customized button.
	MOButton *button14 = [[MOButton alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(testVeiw.frame) + 5 , 100, 100)];
	[button14 setTitle:@"Hello"
				 image:[UIImage imageNamed:@"AttachMenuButtonIconLocation.png"]
	  highlightedImage:[UIImage imageNamed:@"AttachMenuButtonIconLocationPressed.png"]];
	[button14 addTarget:self action:@selector(button14Pressed:) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:button14];
	
}

- (void)button14Pressed:(id)sender
{
	NSLog(@"button14 was pressed.");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - Action methods


/** Demo how to open the phone application to make a dial.
 */
- (IBAction)callMe:(id)sender {
    NSString *phoneNumber = @"+6593203577";
    NSLog(@"Call %@", phoneNumber);
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"tel://%@", phoneNumber]]];
}

@end
