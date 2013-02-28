//
//  MOImageLoadController.m
//  ControlDemo
//
//  Created by an hailin on 11/1/13.
//  Copyright (c) 2013 HailinAn. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "MOImageLoadController.h"
#import <SDWebImage/UIImageView+WebCache.h>



@interface MOImageLoadController ()

@end

@implementation MOImageLoadController

- (id)init
{
    self = [super init];
    if (self) {
        self.title = @"ImageLoad";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    UIImage *loadingImage = [UIImage imageNamed:@"loading.gif"];
    //http://wd.vanillicon.com/d3ffaf6068cf26af45ca48e5f28ac203_100.png
    //http://we.vanillicon.com/eca62e8b1da79de98da331a1c988cb62_100.png
    //http://wb.vanillicon.com/bf382973195690635d151950348afff1_100.png
    
    // Most common usage.
    UIImageView *imageView1 = [[UIImageView alloc] initWithFrame:CGRectMake(5, 5, 100, 100)];
    NSURL *url1 = [NSURL URLWithString:@"http://wd.vanillicon.com/d3ffaf6068cf26af45ca48e5f28ac203_100.png"];
    [imageView1 setImageWithURL:url1 placeholderImage:loadingImage];
    [self.view addSubview:imageView1];
    
    UIImageView *imageView2 = [[UIImageView alloc] initWithFrame:CGRectMake(imageView1.frame.origin.x + imageView1.frame.size.width + 3, 5, 200, 100)];
    NSURL *url2 = [NSURL URLWithString:@"http://we.vanillicon.com/eca62e8b1da79de98da331a1c988cb62_100.png"];
    // Center the image, and clips to bounds.
    imageView2.contentMode = UIViewContentModeScaleAspectFill;
    imageView2.clipsToBounds = YES;
    imageView2.layer.cornerRadius = 6;
    [imageView2 setImageWithURL:url2 placeholderImage:loadingImage];
    [self.view addSubview:imageView2];
	
	// Load image from url directly.
	UIImageView *imageView3 = [[UIImageView alloc] initWithFrame:CGRectMake(imageView1.frame.origin.x, imageView1.frame.origin.y + imageView1.frame.size.height + 5, 200, 100)];
    NSURL *url3 = [NSURL URLWithString:@"http://we.vanillicon.com/eca62e8b1da79de98da331a1c988cb62_100.png"];
    // Center the image, and clips to bounds.
    imageView3.contentMode = UIViewContentModeScaleAspectFill;
    imageView3.clipsToBounds = YES;
    imageView3.layer.cornerRadius = 6;
	NSData *data = [[NSData alloc] initWithContentsOfURL:url3];
	UIImage *image = [UIImage imageWithData:data];
	imageView3.image = image;
    [self.view addSubview:imageView3];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
