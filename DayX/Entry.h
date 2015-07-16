//
//  Entry.h
//  DayX
//
//  Created by Rutan on 7/15/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Entry : NSObject

@property (strong) NSString *entryTitle;
@property (strong) NSString *bodyText;
@property (strong) NSDate *createdTimeStamp;
@property (strong) NSDate *mostRecentTimeStamp;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;
- (NSDictionary *)dictionaryRepresentation;

@end
