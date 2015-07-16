//
//  EntryController.m
//  DayX
//
//  Created by Rutan on 7/15/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "EntryController.h"

static NSString *allEntriesKey = @"allEntries";

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
        sharedInstance.allEntries = @[];
        [sharedInstance loadFromPersistentStorage];
    });
    
    return sharedInstance;
}

//create (and update)
- (void)addEntry:(Entry *)entry {
    
    if (!entry) {
        return;
    }
    
    NSMutableArray *mutableEntries = [self.allEntries mutableCopy];
    [mutableEntries addObject:entry];
    self.allEntries = mutableEntries;
    
    [self saveToPersistentStorage];
}

//delete (and update)
- (void)removeEntry:(Entry *)entry {
    
    if (!entry) {
        return;
    }
    
    NSMutableArray *mutableEntries = [self.allEntries mutableCopy];
    [mutableEntries removeObject:entry];
    self.allEntries = mutableEntries;
    
    [self saveToPersistentStorage];
}

- (void)saveToPersistentStorage {
    
    //iterate through the self.entries array, create an NSDictionary representation of each Entry, add it to a temporary NSMutableArray, and save that NSMutableArray to NSUserDefaults using an 'AllEntriesKey'
    
    NSMutableArray *entryDictionariesArray = [NSMutableArray new];
    for (Entry *entry in self.allEntries) {
        [entryDictionariesArray addObject:[entry dictionaryRepresentation]];
    }
    [[NSUserDefaults standardUserDefaults] setObject:entryDictionariesArray forKey:allEntriesKey];
}

- (void)loadFromPersistentStorage {
    
    //load the array of NSDictionaries from NSUserDefaults using the AllEntriesKey, iterate through the array, initialize an Entry for each NSDictionary and add it to a NSMutableArray, and set self.entries to that NSMutableArray
    NSMutableArray *mutableEntries = [NSMutableArray new];
    
    NSArray *entryDictionariesArray = [[NSUserDefaults standardUserDefaults] objectForKey:allEntriesKey];
    for (NSDictionary *dictionary in entryDictionariesArray) {
        [mutableEntries addObject:[[Entry new] initWithDictionary:dictionary]];
        self.allEntries = mutableEntries;
    }
    
}

@end
