//
//  JobListViewController.h
//  ToDoList
//
//  Created by Vikam MORE on 31/05/15.
//  Copyright (c) 2015 Vikam MORE. All rights reserved.
//


#import <UIKit/UIKit.h>

@interface JobListViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>{
    NSArray* jobResponseList;
}

@property (nonatomic) NSArray* jobResponseList;

-(void) setJobResponseList:(NSArray *)jobResponseListArray;

@end