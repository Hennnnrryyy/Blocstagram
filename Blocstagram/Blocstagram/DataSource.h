//
//  DataSource.h
//  Blocstagram
//
//  Created by Henry Smith on 7/26/15.
//  Copyright (c) 2015 Henry Smith. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Media;

typedef void (^NewItemCompletionBlock)(NSError *error);

@interface DataSource : NSObject

+(instancetype) sharedInstance;
+ (NSString *) instagramClientID;

@property (nonatomic, strong, readonly) NSArray *mediaItems;
@property (nonatomic, strong, readonly) NSString *accessToken;

- (void) deleteMediaItem:(Media *)item;
- (void) downloadImageForMediaItem:(Media *)mediaItem;
- (void) requestNewItemsWithCompletionHandler:(NewItemCompletionBlock)completionHandler;
- (void) requestOldItemsWithCompletionHandler:(NewItemCompletionBlock)completionHandler;

- (void) toggleLikeOnMediaItem:(Media *)mediaItem withCompletionHandler:(void (^)(void))completionHandler;
- (void) commentOnMediaItem:(Media *)mediaItem withCommentText:(NSString *)commentText;


@end
