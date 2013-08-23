//
//  iLikeItViewController.m
//  iLikeIt
//
//  Created by Regular Berry on 3/20/11.
//  Copyright 2011 Regular Berry Software LLC. All rights reserved.
//

#import "iLikeItViewController.h"

@implementation iLikeItViewController

@synthesize titleLabel = _titleLabel;

- (void)dealloc
{
    [_titleLabel release];
    _titleLabel = nil;
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.titleLabel.text = NSLocalizedString(@"I am \"thomasan\"", nil);
	
	// Although the following code has been commented out, 'genStrings' command will create an entry
	// for these lines in Localizable.strings file.
	//[NSString stringWithFormat:NSLocalizedString(@"Oh %d push %d", nil), 1, 2];
	//[NSString stringWithFormat:NSLocalizedString(@"Oh %d pull %d", nil), 1, 2];

}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    
    self.titleLabel = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

-(IBAction)hitButton : (id)sender
{
    UIImageView *im = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ilike.png"]];
    im.transform = CGAffineTransformScale(im.transform, 0.1, 0.1);
    im.center = CGPointMake(160, 325);
    [self.view addSubview:im];
    
    [UIView animateWithDuration:1.0 animations:^(void){
        
        im.transform = CGAffineTransformIdentity;
        
    } completion:^(BOOL finished){
        
        [UIView animateWithDuration:1.0 delay:1.0 options:UIViewAnimationCurveEaseOut animations:^(void){
            im.alpha = 0.0;
        } completion:^(BOOL finished) {
            [im removeFromSuperview];
        }];
        
    }];
    
    [im release];
}

@end
