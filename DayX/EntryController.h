//
//  EntryController.h
//  DayX
//
//  Created by Rutan on 7/15/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Entry.h"

@interface EntryController : NSObject

@property (strong, nonatomic, readonly) NSArray *allEntries;

+ (EntryController *)sharedInstance;

- (Entry *)createEntry;  //new method for CoreData

- (void)save;

- (void)removeEntry:(Entry *)entry;

@end
