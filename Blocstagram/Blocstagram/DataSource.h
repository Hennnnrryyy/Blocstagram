//
//  DataSource.h
//  Blocstagram
//
//  Created by Henry Smith on 7/26/15.
//  Copyright (c) 2015 Henry Smith. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Media;

@interface DataSource : NSObject

+(instancetype) sharedInstance;

@property (nonatomic, strong, readonly) NSArray *mediaItems;

- (void) moveMediaItemToTop:(Media *)item;


@end
