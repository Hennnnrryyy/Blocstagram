//
//  UserTests.m
//  Blocstagram
//
//  Created by Henry Smith on 8/24/15.
//  Copyright (c) 2015 Henry Smith. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "User.h"
#import "Media.h"
#import "ComposeCommentView.h"

@interface UserTests : XCTestCase

@end

@implementation UserTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testThatUserInitializationWorks
{
    NSDictionary *sourceDictionary = @{@"id": @"8675309",
                                       @"username" : @"d'oh",
                                       @"full_name" : @"Homer Simpson",
                                       @"profile_picture" : @"http://www.example.com/example.jpg"};
    User *testUser = [[User alloc] initWithDictionary:sourceDictionary];
    
    XCTAssertEqualObjects(testUser.idNumber, sourceDictionary[@"id"], @"The ID number should be equal");
    XCTAssertEqualObjects(testUser.userName, sourceDictionary[@"username"], @"The username should be equal");
    XCTAssertEqualObjects(testUser.fullName, sourceDictionary[@"full_name"], @"The full name should be equal");
    XCTAssertEqualObjects(testUser.profilePictureURL, [NSURL URLWithString:sourceDictionary[@"profile_picture"]], @"The profile picture should be equal");

}

- (void)testThatMediaInitializationWorks{
    
    NSDictionary *sourceDictionary = @{
                                        @"data": @{
        @"type": @"image",
        @"users_in_photo": @[@{
            @"user": @{
                @"username": @"kevin",
                @"full_name": @"Kevin S",
                @"id": @"3",
                @"profile_picture": @"..."
            },
            @"position": @{
                @"x": @0.315,
               @"y": @0.9111
            }
        }],
        @"filter": @"Walden",
        @"tags": @[],
        @"comments": @{
            @"data": @[@{
                @"created_time": @"1279332030",
                @"text": @"Love the sign here",
                @"from": @{
                    @"username": @"mikeyk",
                    @"full_name": @"Mikey Krieger",
                    @"id": @"4",
                    @"profile_picture": @"http://distillery.s3.amazonaws.com/profiles/profile_1242695_75sq_1293915800.jpg"
                },
                @"id": @"8"
            },
                     @{
                         @"created_time": @"1279341004",
                         @"text": @"Chilako taco",
                         @"from": @{
                             @"username": @"kevin",
                             @"full_name": @"Kevin S",
                             @"id": @"3",
                             @"profile_picture": @"..."
                         },
                         @"id": @"3"
                     }],
            @"count": @2
        },
        @"caption": @"This is the caption",
        @"likes": @{
            @"count": @1,
            @"data": @[@{
                @"username": @"mikeyk",
                @"full_name": @"Mikeyk",
                @"id": @"4",
                @"profile_picture": @"..."
            }]
        },
        @"link": @"http://instagr.am/p/D/",
        @"user": @{
            @"username": @"kevin",
            @"full_name": @"Kevin S",
            @"profile_picture": @"...",
            @"id": @"3"
        },
        @"created_time": @"1279340983",
        @"images": @{
            @"low_resolution": @{
                @"url": @"http://distillery.s3.amazonaws.com/media/2010/07/16/4de37e03aa4b4372843a7eb33fa41cad_6.jpg",
                @"width": @306,
                @"height": @306
            },
            @"thumbnail": @{
                @"url": @"http://distillery.s3.amazonaws.com/media/2010/07/16/4de37e03aa4b4372843a7eb33fa41cad_5.jpg",
                @"width": @150,
                @"height": @150
            },
            @"standard_resolution": @{
                @"url": @"http://distillery.s3.amazonaws.com/media/2010/07/16/4de37e03aa4b4372843a7eb33fa41cad_7.jpg",
                @"width": @612,
                @"height": @612
            }
        },
        @"id": @"3",
        @"location": @"Nowhere",
    }
                                        };
    
    Media *media = [[Media alloc] initWithDictionary:sourceDictionary[@"data"]];
    User *tempUser = [[User alloc] initWithDictionary: sourceDictionary[@"data"]];
    
    XCTAssertEqualObjects(media.user.idNumber, tempUser.idNumber, @"Users are equal");
    XCTAssertEqualObjects(media.idNumber, sourceDictionary[@"data"][@"id"], @"The ID number should be equal");
}

- (void) testThatCommentViewWorks{
    ComposeCommentView *tempView = [ComposeCommentView new];
    [tempView setText:@"Hello there"];
    XCTAssertEqual(tempView.isWritingComment, YES, @"The user is writing a comment");
    [tempView setText:@""];
    XCTAssertEqual(tempView.isWritingComment, NO, @"The user is not writing a comment");
}

@end
