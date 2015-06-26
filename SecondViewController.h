//
//  SecondViewController.h
//  ToDoList
//
//  Created by Vikam MORE on 25/04/15.
//  Copyright (c) 2015 Vikam MORE. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AsyncPost.h"
#import "JobListViewController.h"

//@protocol SecondViewControllerDelegate 
//- (void)dataFromController:(NSString *)data;
//- (NSPostAndUrlObject *) createPostRequest: (NSDictionary *)parameters;
//- (NSMutableURLRequest *) createMutableRequest:(NSPostAndUrlObject *)postAndUrlObj;
//@end


@interface SecondViewController : UIViewController {
    NSString * data;
   // __weak IBOutlet UILabel *label;
    __weak IBOutlet UILabel *label;
    __weak IBOutlet UITextField *jobSearchTextBox;
    __weak IBOutlet UITextField *areaCodeTextBox;
    __weak IBOutlet UIButton *buttonJobSearch;
    JobListViewController *jobListViewController;
    NSArray* jobResponseArray;
}

@property (nonatomic) NSString*  data;
@property (nonatomic) NSArray*  jobResponseArray;
@property (weak) UILabel *label;
@property (weak) UITextField *jobSearchTextBox;
@property (weak) UITextField *areaCodeTextBox;
@property (nonatomic) JobListViewController *jobListViewController;


//@property (nonatomic, weak) id<SecondViewControllerDelegate> delegate;
- (IBAction)buttonJobSearch:(id)sender;

//- (void) data : (NSData*) input;

@property (strong) id  asyncDelegate;

- (void) handleResponseAndDelegateToScreen:(NSDictionary *)responseData : (BOOL) errorStatus;

@end
