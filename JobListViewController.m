//
//  JobListViewController.m
//  ToDoList
//
//  Created by Vikam MORE on 31/05/15.
//  Copyright (c) 2015 Vikam MORE. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JobResponseData.h"
#import "JobListViewController.h"

@interface JobListViewController ()

@end

@implementation JobListViewController

@synthesize jobResponseList;

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Initialize table data
    NSLog(@"View DidLoad Count: %ld", jobResponseList.count);
    [self loadView];
}

- (void)loadView
{
////
    CGSize size = self.view.bounds.size;
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 80, size.width, 464) style:UITableViewStylePlain];
    tableView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
    tableView.delegate = self;
    tableView.dataSource = self;
    //tableView.
    [tableView reloadData];
    self.view = tableView;////[[UIScreen mainScreen] applicationFrame]
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    // Number of rows is the number of time zones in the region for the specified section.
    
    //JobResponseData *jobResponse = [jobResponseList objectAtIndex:section];
    NSLog(@"NumOfRowsInSectionCount: %lu", (unsigned long)[jobResponseList count]);
    return [jobResponseList count];//[region.timeZoneWrappers count];
    
}





- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    //JobResponseData *jobResponse = [jobResponseList objectAtIndex:section];
   // NSLog(@"Title: %@", jobResponse.jobTitle);
    return @"Job Listing(s)";//[jobResponse jobTitle];//@"Test";//
    
}





- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *SimpleTableItem = @"SimpleTableItem";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:SimpleTableItem];
    
    if (cell == nil) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault  reuseIdentifier:SimpleTableItem];
        
    }
    
    //JobResponseData *jobResponse = [jobResponseList objectAtIndex:indexPath.section];
    
    //NSString* string = [[NSString alloc] init];
    //[string
    
    //TimeZoneWrapper *timeZoneWrapper =
    //NSLog(@"Index: %lu", indexPath.row);
    JobResponseData *jobResponse = [jobResponseList objectAtIndex:indexPath.row];
    //NSLog(@"Title: %@", jobResponse.jobTitle);
    //NSLog(@"Location: %@", jobResponse.jobLocation);
    cell.textLabel.text = jobResponse.jobTitle;//@"Testing";//[jobResponseList objectAtIndex:indexPath.row];//
    //NSLog(@"Text: %@", jobResponseList);
    return cell;
    
}

- (void) setJobResponseList:(NSArray *)jobResponseListArray {
    //[self jobResponseList jobResponseList]
   jobResponseList = jobResponseListArray;
    NSLog(@"JobResponseList Count: %ld", jobResponseList.count);
}

@end
