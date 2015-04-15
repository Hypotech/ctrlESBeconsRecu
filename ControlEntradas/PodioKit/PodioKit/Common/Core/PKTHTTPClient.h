//
//  PKTClient.h
//  PodioKit
//
//  Created by Sebastian Rehnby on 16/01/14.
//  Copyright (c) 2014 Citrix Systems, Inc. All rights reserved.
//

#import "AFNetworking.h"
#import "PKTRequest.h"
#import "PKTResponse.h"

typedef void(^PKTRequestCompletionBlock)(PKTResponse *response, NSError *error);

@interface PKTHTTPClient : AFHTTPRequestOperationManager

- (void)setValue:(NSString *)value forHTTPHeader:(NSString *)header;
- (void)setAuthorizationHeaderWithOAuth2AccessToken:(NSString *)accessToken;
- (void)setAuthorizationHeaderWithAPIKey:(NSString *)key secret:(NSString *)secret;

- (AFHTTPRequestOperation *)operationWithRequest:(PKTRequest *)request completion:(PKTRequestCompletionBlock)completion;

@end
