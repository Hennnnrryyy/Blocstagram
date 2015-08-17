//
//  iCloudPhotoViewController.h
//  Blocstagram
//
//  Created by Henry Smith on 8/15/15.
//  Copyright (c) 2015 Henry Smith. All rights reserved.
//

#import "ImageLibraryViewController.h"

@class iCloudPhotoViewController;

@protocol iCloudPhotoViewControllerDelegate <NSObject>

- (void) iCloudPhotoViewController:(iCloudPhotoViewController *)iCloudPhotoViewController didCompleteWithImage:(UIImage *)image;

@end

@interface iCloudPhotoViewController : ImageLibraryViewController

@property (nonatomic, weak) NSObject <iCloudPhotoViewControllerDelegate> *delegate;

@end
