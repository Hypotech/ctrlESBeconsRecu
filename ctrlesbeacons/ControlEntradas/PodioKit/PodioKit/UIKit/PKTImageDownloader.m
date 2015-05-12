//
//  PKTImageDownloader.m
//  PodioKit
//
//  Created by Sebastian Rehnby on 25/06/14.
//  Copyright (c) 2014 Citrix Systems, Inc. All rights reserved.
//

#import "PKTImageDownloader.h"
#import "PKTImageCache.h"
#import "PKTFile+UIImage.h"

@implementation PKTImageDownloader

+ (AFHTTPRequestOperation *)setImageWithFile:(PKTFile *)file placeholderImage:(UIImage *)placeholderImage imageSetterBlock:(void (^)(UIImage *image))imageSetterBlock completion:(void (^)(UIImage *image, NSError *error))completion {
  NSParameterAssert(file);
  NSParameterAssert(imageSetterBlock);
  
  // Check for a cached image
  UIImage *image = [[PKTImageCache sharedCache] cachedImageForFile:file];
  if (image) {
    imageSetterBlock(image);
    return nil;
  }
  
  if (placeholderImage) {
    imageSetterBlock(placeholderImage);
  }
  
  AFHTTPRequestOperation *operation = [file downloadImageWithCompletion:^(UIImage *image, NSError *error) {
    if (image) {
      [[PKTImageCache sharedCache] setCachedImage:image forFile:file];
      imageSetterBlock(image);
    }
    
    if (completion) completion(image, error);
  }];
  
  return operation;
}

@end
