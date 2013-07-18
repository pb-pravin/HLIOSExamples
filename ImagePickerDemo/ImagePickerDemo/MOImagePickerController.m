//
//  MOViewController.m
//  ImagePickerDemo
//
//  Created by an hailin on 9/4/13.
//  Copyright (c) 2013 mozat. All rights reserved.
//
#import <MobileCoreServices/MobileCoreServices.h>
#import "MOImagePickerController.h"

@interface MOImagePickerController ()
@property (nonatomic, strong) UIViewController *presentingViewController;
@property (nonatomic, assign) UIImagePickerControllerSourceType sourceType;
@property (nonatomic, strong) imagePickCompletionBlock completionBlock;
@end

@implementation MOImagePickerController

- (id)initWithPresentingViewController:(UIViewController *)presentingViewController
                            sourceType:(UIImagePickerControllerSourceType)sourceType
                            completion:(imagePickCompletionBlock)completionBlock
{
    self = [super init];
    if (self)
    {
		self.presentingViewController = presentingViewController;
		self.sourceType = sourceType;
		self.completionBlock = completionBlock;
    }
    return self;
}

+ (void)presentImagePickerWithPresentingViewController:(UIViewController *)presentingViewController
											sourceType:(UIImagePickerControllerSourceType)sourceType
											completion:(imagePickCompletionBlock) completionBlock
{
	MOImagePickerController *imagePicker =
	[[MOImagePickerController alloc] initWithPresentingViewController:presentingViewController
															   sourceType:sourceType
															   completion:completionBlock];
	[imagePicker getMedia];
}


- (void)getMedia
{
    NSArray *mediaTypes = [UIImagePickerController availableMediaTypesForSourceType:self.sourceType];
	
    if ([UIImagePickerController isSourceTypeAvailable:self.sourceType] && [mediaTypes count] > 0)
    {
        NSArray *mediaTypes = [[NSArray alloc] initWithObjects:(NSString *)kUTTypeImage, nil];
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        picker.mediaTypes = mediaTypes;
        picker.delegate = self;
        picker.allowsEditing = YES;
        picker.sourceType = self.sourceType;
        [self.presentingViewController presentModalViewController:picker animated:YES];
        [mediaTypes release];
        [picker release];
    }
    else
    {
        UIAlertView *alert = [[UIAlertView alloc]
                              initWithTitle:NSLocalizedString(@"Error", @"")
							  message:NSLocalizedString(@"Device doesn’t support that media source.", @"")
							  delegate:nil
							  cancelButtonTitle:NSLocalizedString(@"OK", @"")
							  otherButtonTitles:nil];
        [alert show];
        [alert release];
		
		//NSError *error = [NSError errorWithDomain:nil code:0 userInfo:nil];
		self.completionBlock(nil, nil);
    }
}

#pragma mark - UIImagePickerControllerDelegate

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [self.presentingViewController dismissModalViewControllerAnimated:YES];
	self.completionBlock(nil, nil);
}

- (void)    imagePickerController:(UIImagePickerController *)picker
    didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    [self.presentingViewController dismissModalViewControllerAnimated:YES];
	
	UIImage *chosenImage = [info objectForKey:UIImagePickerControllerEditedImage];
	NSParameterAssert(chosenImage);
	self.completionBlock(chosenImage, nil);
}

@end
