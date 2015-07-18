//
//  ViewController.m
//  DayX
//
//  Created by Caleb Hicks on 4/10/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "ListViewController.h"
#import "EntryController.h"
#import "DetailViewController.h"

@interface ListViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)editButtonTouched:(id)sender {
    
    BOOL shouldEdit;
    if (self.tableView.editing == YES) {
        shouldEdit = NO;
    } else {
        shouldEdit = YES;
    }
    
    [self.tableView setEditing:shouldEdit animated:YES];
}

- (void)viewWillAppear:(BOOL)animated {
    
    [self.tableView reloadData];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"addEntry"]) {
        return;
    }
    
    if ([segue.identifier isEqualToString:@"viewEntry"]) {

        //pass the selected entry to the DetailViewController (you will need to import the DetailViewController and the EntryController, and get the IndexPath of the selected cell)

        DetailViewController *destinationViewControllerInstance = segue.destinationViewController;
        
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        
        destinationViewControllerInstance.entry = [EntryController sharedInstance].allEntries[indexPath.row];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
