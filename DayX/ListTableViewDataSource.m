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
    
    //use this 'if' statement code if you are initializing cells with style (instead of registering cells)
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle  reuseIdentifier:entryCell];
    }
    
       //Update cellForRowAtIndexPath to set the label to the title of the Entry, use the [EntryController sharedInstance] entries array and the indexPath.row to update the label with the correct Entry
    
    Entry *entry = [EntryController sharedInstance].allEntries[indexPath.row];
    cell.textLabel.text = entry.entryTitle;
    
    return cell;
}

@end
