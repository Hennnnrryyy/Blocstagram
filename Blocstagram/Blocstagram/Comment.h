//
//  Comment.h
//  Blocstagram
//
//  Created by Henry Smith on 7/26/15.
//  Copyright (c) 2015 Henry Smith. All rights reserved.
//

#import <Foundation/Foundation.h>

@class User;

@interface Comment : NSObject

@property (nonatomic, strong) NSString *idNumber;
@property (nonatomic, strong) User *from;
@property (nonatomic, strong) NSString *text;

@end
