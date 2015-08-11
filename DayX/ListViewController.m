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

@interface ListViewController ()<UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *editButton;

@end

@implementation ListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.editButton.title = @"Edit";
}

- (IBAction)editButtonTouched:(id)sender {
    
    BOOL shouldEdit;
    if (self.tableView.editing == NO) {
        shouldEdit = YES;
        self.editButton.title = @"Done";
    } else {
        shouldEdit = NO;
        self.editButton.title = @"Edit";
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

# pragma mark - table view delegate method

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (tableView.editing) {
        return UITableViewCellEditingStyleDelete;
    } else {
        
        return UITableViewCellEditingStyleNone;
    }
}

#pragma mark - memory warning method

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
