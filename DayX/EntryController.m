//
//  EntryController.m
//  DayX
//
//  Created by Rutan on 7/15/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "EntryController.h"
#import "Stack.h"

@interface EntryController ()

@property (strong, nonatomic) NSArray *allEntries;

@end


@implementation EntryController

//update and retrieve
+ (EntryController *)sharedInstance {
    static EntryController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [EntryController new];
    });
    
    return sharedInstance;
}

//create (new CoreData method)

- (Entry *)createEntry {
    Entry *entry = [NSEntityDescription insertNewObjectForEntityForName:@"Entry"
                                                 inManagedObjectContext:[Stack sharedInstance].managedObjectContext];
    
    return entry;
}

//retrieve   (modify getter method of our Array property) (new CoreData method)

- (NSArray *)allEntries {
    
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Entry"];
    //maybe set some predicates
    //maybe set sort property
    
    //now execute the request on the managed object context
    NSError *error;
    
    NSArray *allEntries = [[Stack sharedInstance].managedObjectContext executeFetchRequest:request
                                                               error:&error];
    if (error) {
        NSLog(@"Error fetching objects : %@", error.localizedDescription);
    }
    
    return allEntries;
}

//update

- (void)save {
    
    [[Stack sharedInstance].managedObjectContext save:nil];
}

//delete
- (void)removeEntry:(Entry *)entry {
    
    [entry.managedObjectContext deleteObject:entry];
}


@end
