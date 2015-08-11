//
//  UIImage+ImageUtilities.h
//  Blocstagram
//
//  Created by Henry Smith on 8/11/15.
//  Copyright (c) 2015 Henry Smith. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (ImageUtilities)

- (UIImage *) imageWithFixedOrientation;
- (UIImage *) imageResizedToMatchAspectRatioOfSize:(CGSize)size;
- (UIImage *) imageCroppedToRect:(CGRect)cropRect;

@end