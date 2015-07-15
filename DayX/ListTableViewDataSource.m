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
    
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:entryCell];
    
    //do not use the 'if' statement code if you are not initializing cells with style (and are registering cells instead)
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle  reuseIdentifier:entryCell];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"Entry %i", (int)indexPath.row];
    
    return cell;
}

@end
