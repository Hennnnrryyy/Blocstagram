//
//  ImageLibraryViewController.h
//  Blocstagram
//
//  Created by Henry Smith on 8/14/15.
//  Copyright (c) 2015 Henry Smith. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Photos/Photos.h>

@class ImageLibraryViewController;

@protocol ImageLibraryViewControllerDelegate <NSObject>

- (void) imageLibraryViewController:(ImageLibraryViewController *)imageLibraryViewController didCompleteWithImage:(UIImage *)image;

@end

@interface ImageLibraryViewController : UICollectionViewController

@property (nonatomic, weak) NSObject <ImageLibraryViewControllerDelegate> *delegate;
@property (nonatomic, strong) PHFetchResult *result;
- (void) cropControllerFinishedWithImage:(UIImage *)croppedImage;

@end
