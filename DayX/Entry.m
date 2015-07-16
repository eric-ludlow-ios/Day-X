//
//  Entry.m
//  DayX
//
//  Created by Rutan on 7/15/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "Entry.h"

static NSString *entryTitleKey = @"entryTitle";
static NSString *bodyTextKey = @"bodyText";
static NSString *createdTimeStampKey = @"createdTimeStamp";
static NSString *mostRecentTimeStampKey = @"mostRecentTimeStamp";

@implementation Entry

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    
    if (self) {
        self.entryTitle = [dictionary valueForKey:entryTitleKey];
        self.bodyText = [dictionary valueForKey:bodyTextKey];
        self.createdTimeStamp = [dictionary valueForKey:createdTimeStampKey];
        self.mostRecentTimeStamp = [dictionary valueForKey:mostRecentTimeStampKey];
    }
    
    return self;
}

- (NSDictionary *)dictionaryRepresentation {
    
    NSMutableDictionary *dictionary = [NSMutableDictionary new];
    
    [dictionary setValue:self.entryTitle forKey:entryTitleKey];
    [dictionary setValue:self.bodyText forKey:bodyTextKey];
    [dictionary setValue:self.createdTimeStamp forKey:createdTimeStampKey];
    [dictionary setValue:self.mostRecentTimeStamp forKey:mostRecentTimeStampKey];
    
    return dictionary;
}

@end
