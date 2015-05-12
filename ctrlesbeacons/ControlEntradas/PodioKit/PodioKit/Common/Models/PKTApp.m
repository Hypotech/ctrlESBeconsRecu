//
//  PKTApp.m
//  PodioKit
//
//  Created by Sebastian Rehnby on 03/04/14.
//  Copyright (c) 2014 Citrix Systems, Inc. All rights reserved.
//

#import "PKTApp.h"
#import "PKTAppField.h"
#import "PKTAppAPI.h"
#import "NSValueTransformer+PKTTransformers.h"

@implementation PKTApp

#pragma mark - PKTModel

+ (NSDictionary *)dictionaryKeyPathsForPropertyNames {
  return @{
           @"appID" : @"app_id",
           @"spaceID" : @"space_id",
           @"iconID" : @"config.icon_id",
           @"name": @"config.name",
           @"itemName": @"config.item_name",
           @"link" : @"link",
           @"fields" : @"fields"
  };
}

+ (NSValueTransformer *)linkValueTransformer {
  return [NSValueTransformer pkt_URLTransformer];
}

+ (NSValueTransformer *)fieldsValueTransformer {
  return [NSValueTransformer pkt_transformerWithModelClass:[PKTAppField class]];
}

#pragma mark - API

+ (void)fetchAppWithID:(NSUInteger)appID completion:(void (^)(PKTApp *app, NSError *error))completion {
  Class objectClass = [self class];
  PKTRequest *request = [PKTAppAPI requestForAppWithID:appID];
  [[self client] performRequest:request completion:^(PKTResponse *response, NSError *error) {
    PKTApp *app = nil;
    if (!error) {
      app = [[objectClass alloc] initWithDictionary:response.body];
    }
    
    if (completion) completion(app, error);
  }];
}

#pragma mark - Public

- (PKTAppField *)fieldWithExternalID:(NSString *)externalID {
  __block PKTAppField *field = nil;
  
  [self.fields enumerateObjectsUsingBlock:^(PKTAppField *currentField, NSUInteger idx, BOOL *stop) {
    if ([currentField.externalID isEqualToString:externalID]) {
      field = currentField;
      *stop = YES;
    }
  }];
  
  return field;
}

@end
