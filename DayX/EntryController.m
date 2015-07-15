//
//  EntryController.m
//  DayX
//
//  Created by Rutan on 7/15/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "EntryController.h"

@interface EntryController ()

@property (strong, nonatomic) NSArray *allEntries;

@end


@implementation EntryController

//retrieve
+ (EntryController *)sharedInstance {
    static EntryController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [EntryController new];
        sharedInstance.allEntries = [NSArray new];
    });
    
    return sharedInstance;
}

//create (and update)
- (void) addEntry:(Entry *)entry {
    
    if (!entry) {
        return;
    }
    
    NSMutableArray *mutableEntries = [self.allEntries mutableCopy];
    [mutableEntries addObject:entry];
    self.allEntries = mutableEntries;
}

//delete (and update)
- (void) removeEntry:(Entry *)entry {
    
    if (!entry) {
        return;
    }
    
    NSMutableArray *mutableEntries = [self.allEntries mutableCopy];
    [mutableEntries removeObject:entry];
    self.allEntries = mutableEntries;
}

@end
