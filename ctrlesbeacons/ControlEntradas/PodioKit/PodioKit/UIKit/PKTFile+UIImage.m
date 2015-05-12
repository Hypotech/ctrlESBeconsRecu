//
//  PKTFile+UIImage.m
//  PodioKit
//
//  Created by Sebastian Rehnby on 25/06/14.
//  Copyright (c) 2014 Citrix Systems, Inc. All rights reserved.
//

#if defined(__IPHONE_OS_VERSION_MIN_REQUIRED)

#import "PKTFile+UIImage.h"
#import "PKTFileAPI.h"

@implementation PKTFile (UIImage)

- (AFHTTPRequestOperation *)downloadImageWithCompletion:(void (^)(UIImage *image, NSError *error))completion {
  NSParameterAssert(self.link);
  
  PKTRequest *request = [PKTFileAPI requestToDownloadFileWithURL:self.link];
  AFHTTPRequestOperation *operation = [[[self class] client] performRequest:request completion:^(PKTResponse *response, NSError *error) {
    if (completion) {
      if (!error) {
        // Dispatch the loading of the image from NSData to a background thread for better performance
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
          UIImage *image = [UIImage imageWithData:response.body];
          
          dispatch_async(dispatch_get_main_queue(), ^{
            completion(image, error);
          });
        });
      } else {
        completion(nil, error);
      }
    }
  }];
  
  return operation;
}

@end

#endif