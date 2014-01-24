//
//  HSInstagramUser.h
//  HSInstagramSample
//
//  Created by Song Peng on 1/22/14.
//  Copyright (c) 2014 Pushbits. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HSInstagramUser : NSObject

@property (nonatomic, strong) NSString* userName;
@property (nonatomic, strong) NSString* avatarUrl;
@property (nonatomic, strong) NSString* userId;
@property (nonatomic, assign) NSUInteger posts;
@property (nonatomic, assign) NSUInteger followers;
@property (nonatomic, assign) NSUInteger followings;


+ (void)getUserWithId:(NSString*)userId
           withAccessToken:(NSString*)accessToken
                     block:(void (^)(NSObject *obj))block;


@end
