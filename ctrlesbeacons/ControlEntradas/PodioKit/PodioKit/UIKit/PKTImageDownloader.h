//
//  PKTImageDownloader.h
//  PodioKit
//
//  Created by Sebastian Rehnby on 25/06/14.
//  Copyright (c) 2014 Citrix Systems, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AFNetworking.h"

@class PKTFile;

@interface PKTImageDownloader : NSObject

+ (AFHTTPRequestOperation *)setImageWithFile:(PKTFile *)file placeholderImage:(UIImage *)placeholderImage imageSetterBlock:(void (^)(UIImage *image))imageSetterBlock completion:(void (^)(UIImage *image, NSError *error))completion;

@end
