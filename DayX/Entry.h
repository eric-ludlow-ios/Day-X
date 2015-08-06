//
//  Entry.h
//  DayX
//
//  Created by Rutan on 8/3/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Entry : NSManagedObject

@property (nonatomic, retain) NSString * entryTitle;
@property (nonatomic, retain) NSString * bodyText;
@property (nonatomic, retain) NSDate * createdTimeStamp;
@property (nonatomic, retain) NSDate * mostRecentTimeStamp;

@end
