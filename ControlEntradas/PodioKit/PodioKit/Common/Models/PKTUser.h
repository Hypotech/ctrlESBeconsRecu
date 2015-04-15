//
//  PKTUser.h
//  PodioKit
//
//  Created by Sebastian Rehnby on 30/06/14.
//  Copyright (c) 2014 Citrix Systems, Inc. All rights reserved.
//

#import "PKTObject.h"

@interface PKTUser : PKTObject

@property (nonatomic, assign, readonly) NSUInteger userID;
@property (nonatomic, copy, readonly) NSString *mail;

+ (void)fetchCurrentWithCompletion:(void (^)(PKTUser *user, NSError *error))completion;

@end
