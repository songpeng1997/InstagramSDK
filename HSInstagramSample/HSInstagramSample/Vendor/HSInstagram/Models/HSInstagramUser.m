//
//  HSInstagramUser.m
//  HSInstagramSample
//
//  Created by Song Peng on 1/22/14.
//  Copyright (c) 2014 Pushbits. All rights reserved.
//

#import "HSInstagramUser.h"

@implementation HSInstagramUser
@synthesize userId = _userId;
@synthesize userName = _userName;
@synthesize avatarUrl = _avatarUrl;
@synthesize posts = _posts;
@synthesize followers = _followers;
@synthesize followings= _followings;


- (id)initWithAttributes:(NSDictionary *)attributes {
    self = [super init];
    if (!self) {
        return nil;
    }
    self.userId = [attributes valueForKeyPath:@"id"];
    self.userName = [attributes valueForKeyPath:@"username"];
    self.avatarUrl = [attributes valueForKeyPath:@"profile_picture"];
    self.posts = [[[attributes objectForKey:@"counts"] valueForKey:@"media"] integerValue];
    self.followers = [[[attributes objectForKey:@"counts"] valueForKey:@"followed_by"] integerValue];
    self.followings = [[[attributes objectForKey:@"counts"] valueForKey:@"follows"] integerValue];
    
    return self;
}


+ (void)getUserWithId:(NSString*)userId
      withAccessToken:(NSString*)accessToken
                block:(void (^)(NSObject *obj))block {
    NSDictionary* params = [NSDictionary dictionaryWithObject:accessToken forKey:@"access_token"];
    NSString* path = [NSString stringWithFormat:kUserEndpoint, userId];
    
    [[HSInstagram sharedClient] getPath:path
                             parameters:params
                                success:^(AFHTTPRequestOperation *operation, id responseObject) {
                                    
                                    HSInstagramUser* user = [[HSInstagramUser alloc] initWithAttributes:[responseObject objectForKey:@"data"]];
                                    if (block) {
                                        block(user);
                                    }
                                }
                                failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                                    NSLog(@"error: %@", error.localizedDescription);
                                    if (block) {
                                        block(nil);
                                    }
                                }];
    
}



@end
