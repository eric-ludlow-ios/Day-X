//
//  DetailViewController.m
//  DayX
//
//  Created by Rutan on 7/14/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "DetailViewController.h"
#import "EntryController.h"

@interface DetailViewController () <UITextViewDelegate>

@property (weak, nonatomic) IBOutlet UITextField *textField;

@property (weak, nonatomic) IBOutlet UITextView *textView;

@property (weak, nonatomic) IBOutlet UILabel *characterCountLabel;

@property (weak, nonatomic) IBOutlet UILabel *dateSavedLabel;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.textView.delegate = self;
    
    [self updateWithEntry];
}

- (void)updateWithEntry {
    
    self.textField.text = self.entry.entryTitle;
    self.textView.text = self.entry.bodyText;
    
    [self updateDate];
    [self textViewDidChange:self.textView];
    
}

- (void)updateDate {
    
    if (self.entry.mostRecentTimeStamp) {
        self.dateSavedLabel.text = [NSString stringWithFormat:@"Saved: %@", [NSDateFormatter localizedStringFromDate:self.entry.mostRecentTimeStamp dateStyle:NSDateFormatterShortStyle timeStyle:NSDateFormatterShortStyle]];
    } else if (self.entry.createdTimeStamp){
        self.dateSavedLabel.text = [NSString stringWithFormat:@"Saved: %@", [NSDateFormatter localizedStringFromDate:self.entry.createdTimeStamp dateStyle:NSDateFormatterShortStyle timeStyle:NSDateFormatterShortStyle]];
    } else {
        self.dateSavedLabel.text = @"";
    }
}

- (void)textViewDidChange:(UITextView *)textView {
    
    self.characterCountLabel.text = [NSString stringWithFormat:@"Character Count: %i", (int)textView.text.length];
}

- (IBAction)saveBarButtonTapped:(id)sender {
    
    //In the saveButtonTapped: method, add a check to see if self.entry exists. If so, update the entry's properties in place. If not, create a new entry.
    
    if (self.entry) {
        self.entry.entryTitle = self.textField.text;
        self.entry.bodyText = self.textView.text;
        self.entry.mostRecentTimeStamp = [NSDate new];
        
        [self updateDate];
        
    } else {
        
        self.entry = [[EntryController sharedInstance] createEntry];  //changed from NSUserDefaults code to CoreData code
        
        //make it save the title, text, and date/time
        self.entry.entryTitle = self.textField.text;
        self.entry.bodyText = self.textView.text;
        self.entry.createdTimeStamp = [NSDate new];
        
        [self updateDate];
    }
    
    [[EntryController sharedInstance] save];
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    [textField resignFirstResponder];
    return YES;
}

- (IBAction)textViewDoneButtonTapped:(id)sender {
    
    [self.textView resignFirstResponder];
}


- (IBAction)clearButtonTapped:(id)sender {
    
    //icon 'undo_256' from Website: www.visualpharm.com: free commercial use license
    
    self.textField.text = @"";
    self.textView.text = @"";
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
