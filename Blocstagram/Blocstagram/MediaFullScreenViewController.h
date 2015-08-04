//
//  MediaFullScreenViewController.h
//  Blocstagram
//
//  Created by Henry Smith on 8/3/15.
//  Copyright (c) 2015 Henry Smith. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MediaTableViewCell.h"

@class Media;

@interface MediaFullScreenViewController : UIViewController

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) MediaTableViewCell *cell;

@property (nonatomic, weak) id <MediaTableViewCellDelegate> delegate;

- (instancetype) initWithMedia:(Media *)media cell:(MediaTableViewCell *)cell;



- (void) centerScrollView;

@end
