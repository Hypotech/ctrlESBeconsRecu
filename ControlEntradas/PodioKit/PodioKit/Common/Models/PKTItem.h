//
//  PKTItem.h
//  PodioKit
//
//  Created by Sebastian Rehnby on 31/03/14.
//  Copyright (c) 2014 Citrix Systems, Inc. All rights reserved.
//

#import "PKTObject.h"

@class PKTFile;
@class PKTByLine;
@class PKTApp;

typedef void(^PKTItemFilteredFetchCompletionBlock)(NSArray *items, NSUInteger filteredCount, NSUInteger totalCount, NSError *error);

@interface PKTItem : PKTObject

@property (nonatomic, assign, readonly) NSUInteger itemID;
@property (nonatomic, assign, readonly) NSUInteger appID;
@property (nonatomic, assign, readonly) NSUInteger appItemID;
@property (nonatomic, strong, readonly) NSDate *createdOn;
@property (nonatomic, strong, readonly) PKTByLine *createdBy;
@property (nonatomic, strong, readonly) PKTApp *app;
@property (nonatomic, copy, readonly) NSString *title;
@property (nonatomic, copy, readonly) NSArray *fields;
@property (nonatomic, copy, readonly) NSArray *files;
@property (nonatomic, copy, readonly) NSArray *comments;

+ (instancetype)itemForAppWithID:(NSUInteger)appID;

#pragma mark - API

+ (void)fetchItemWithID:(NSUInteger)itemID completion:(void (^)(PKTItem *item, NSError *error))completion;

+ (void)fetchItemsInAppWithID:(NSUInteger)appID offset:(NSUInteger)offset limit:(NSUInteger)limit completion:(PKTItemFilteredFetchCompletionBlock)completion;

+ (void)fetchItemsInAppWithID:(NSUInteger)appID offset:(NSUInteger)offset limit:(NSUInteger)limit sortBy:(NSString *)sortBy descending:(BOOL)descending completion:(PKTItemFilteredFetchCompletionBlock)completion;

+ (void)fetchItemsInAppWithID:(NSUInteger)appID offset:(NSUInteger)offset limit:(NSUInteger)limit viewID:(NSUInteger)viewID completion:(PKTItemFilteredFetchCompletionBlock)completion;

- (void)fetchWithCompletion:(PKTRequestCompletionBlock)completion;

- (void)saveWithCompletion:(PKTRequestCompletionBlock)completion;

#pragma mark - Public

- (NSArray *)valuesForField:(NSString *)externalID;
- (void)setValues:(NSArray *)values forField:(NSString *)externalID;

- (id)valueForField:(NSString *)externalID;
- (void)setValue:(id)value forField:(NSString *)externalID;

- (void)addValue:(id)value forField:(NSString *)externalID;

- (void)removeValue:(id)value forField:(NSString *)externalID;
- (void)removeValueAtIndex:(NSUInteger)index forField:(NSString *)externalID;

- (void)addFile:(PKTFile *)file;
- (void)removeFileWithID:(NSUInteger)filefileID;

#pragma mark - Subscripting for item fields

- (id)objectForKeyedSubscript:(id <NSCopying>)key;
- (void)setObject:(id)obj forKeyedSubscript:(id <NSCopying>)key;

@end
