//
//  DetailViewController.h
//  DayX
//
//  Created by Rutan on 7/14/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Entry.h"

@interface DetailViewController : UIViewController <UITextFieldDelegate>

@property (strong, nonatomic) Entry *entry;

@end
