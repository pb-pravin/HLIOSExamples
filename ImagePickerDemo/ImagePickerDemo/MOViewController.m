//
//  MOViewController.m
//  ImagePickerDemo
//
//  Created by an hailin on 9/4/13.
//  Copyright (c) 2013 mozat. All rights reserved.
//
#import <MobileCoreServices/MobileCoreServices.h>
#import "MOViewController.h"

@interface MOViewController ()
@property (nonatomic, retain) IBOutlet UIImageView *imageView;
- (IBAction)buttonPressed:(id)sender;
- (IBAction)buttonPressed1:(id)sender;
- (IBAction)hideModalView:(id)sender;
@end

@implementation MOViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonPressed:(id)sender {
	NSLog(@"button was pressed.");
	[self getMediaFromSource:UIImagePickerControllerSourceTypeCamera];
}

- (IBAction)buttonPressed1:(id)sender {
	[self getMediaFromSource:UIImagePickerControllerSourceTypePhotoLibrary];
}

- (IBAction)hideModalView:(id)sender {
	[self.presentingViewController dismissModalViewControllerAnimated:YES];
}

- (void)getMediaFromSource:(UIImagePickerControllerSourceType)sourceType {
    
    NSArray *mediaTypes = [UIImagePickerController availableMediaTypesForSourceType:sourceType];
    
    if ([UIImagePickerController isSourceTypeAvailable:sourceType] && [mediaTypes count] > 0) {
        
        NSArray *mediaTypes = [[NSArray alloc] initWithObjects:(NSString *)kUTTypeImage, nil];
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        picker.mediaTypes = mediaTypes;
        picker.delegate = self;
        picker.allowsEditing = YES;
        picker.sourceType = sourceType;
        [self presentModalViewController:picker animated:YES];
        [mediaTypes release];
        [picker release];
    }
    else {
        UIAlertView *alert = [[UIAlertView alloc]
                              initWithTitle:NSLocalizedString(@"Error", @"")
                              message:NSLocalizedString(@"Device doesn’t support that media source.", @"")
                              delegate:nil
                              cancelButtonTitle:NSLocalizedString(@"OK", @"")
                              otherButtonTitles:nil];
        [alert show];
        [alert release];
    }
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
	NSLog(@"Cancel");
	[self dismissModalViewControllerAnimated:YES];
}

- (void)imagePickerController:(UIImagePickerController *)picker
didFinishPickingMediaWithInfo:(NSDictionary *)info {
	NSLog(@"picker finish selecting");
	[self dismissModalViewControllerAnimated:YES];
	
	UIImage *chosenImage = [info objectForKey:UIImagePickerControllerEditedImage];
	self.imageView.image = chosenImage;
}

@end
