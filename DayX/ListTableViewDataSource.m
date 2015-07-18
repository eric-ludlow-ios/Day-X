//
//  ListTableViewDataSource.m
//  DayX
//
//  Created by Rutan on 7/14/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "ListTableViewDataSource.h"

static NSString *entryCell = @"entryCell";

@implementation ListTableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [EntryController sharedInstance].allEntries.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:entryCell];
    
       //Update cellForRowAtIndexPath to set the label to the title of the Entry, use the [EntryController sharedInstance] entries array and the indexPath.row to update the label with the correct Entry
    
    Entry *entry = [EntryController sharedInstance].allEntries[indexPath.row];
    cell.textLabel.text = entry.entryTitle;
    
    if (entry.mostRecentTimeStamp) {
        cell.detailTextLabel.text = [NSString stringWithFormat:@"last saved: %@", [NSDateFormatter localizedStringFromDate:entry.mostRecentTimeStamp dateStyle:NSDateFormatterShortStyle timeStyle:NSDateFormatterShortStyle]];
    } else {
        cell.detailTextLabel.text = [NSString stringWithFormat:@"created: %@", [NSDateFormatter localizedStringFromDate:entry.createdTimeStamp dateStyle:NSDateFormatterShortStyle timeStyle:NSDateFormatterShortStyle]];
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    Entry *entry = [EntryController sharedInstance].allEntries[indexPath.row];
    [[EntryController sharedInstance] removeEntry:entry];
    
    [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
}

@end
