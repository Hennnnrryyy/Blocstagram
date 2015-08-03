//
//  MediaFullScreenAnimator.h
//  Blocstagram
//
//  Created by Henry Smith on 8/3/15.
//  Copyright (c) 2015 Henry Smith. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MediaFullScreenAnimator : NSObject <UIViewControllerAnimatedTransitioning>

@property (nonatomic, assign) BOOL presenting;
@property (nonatomic, weak) UIImageView *cellImageView;

@end
