//
//  MOViewController.h
//  ImagePickerDemo
//
//  Created by an hailin on 9/4/13.
//  Copyright (c) 2013 mozat. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^imagePickCompletionBlock)(UIImage *image, NSError *error);

@interface MOImagePickerController : NSObject <UINavigationControllerDelegate, UIImagePickerControllerDelegate>

+ (void)presentImagePickerWithPresentingViewController:(UIViewController *)presentingViewController
											sourceType:(UIImagePickerControllerSourceType)sourceType
											completion:(imagePickCompletionBlock) completionBlock;

@end
