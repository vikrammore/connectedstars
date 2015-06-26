//
//  SecondViewController.m
//  ToDoList
//
//  Created by Vikam MORE on 25/04/15.
//  Copyright (c) 2015 Vikam MORE. All rights reserved.
//

#import "SecondViewController.h"
#import "AsyncPost.h"
#import "JobResponseData.h"
#import "JsonResponseParser.h"
#import "JobListViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

@synthesize data;
@synthesize label;
@synthesize jobSearchTextBox;
@synthesize areaCodeTextBox;
@synthesize asyncDelegate;
@synthesize jobResponseArray;
@synthesize jobListViewController;

- (void)viewDidLoad {
    [super viewDidLoad];
    //label.text = data;
    NSLog(@"secondViewController JSON Data: %@", data);
    @autoreleasepool {
        asyncDelegate = [[AsyncPost alloc] init];
        jobListViewController = [[JobListViewController alloc] init];
    }
    
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


- (IBAction) backgroundTap:(id)sender {
    [self.view endEditing:TRUE];
}

- (IBAction)buttonJobSearch:(id)sender {
    NSLog(@"Button Clicked: %@", data);

    NSMutableDictionary * parameters = [[NSMutableDictionary alloc] init];
    [parameters setObject:@"https://dit.connectedstars.com/service/api/JobsCustomController/GetJob" forKey:@"httpUrl"];
    [parameters setObject:self.jobSearchTextBox.text forKey:@"KeyWordOrOnCompanySkillTitle"];
    [parameters setObject:self.areaCodeTextBox.text forKey:@"KeyWordOnLocation"];
    [parameters setObject:@"adfe2623-9af0-4492-85df-b4b9dcdb7e44" forKey:@"ProfileId"];
    [parameters setObject:@"true" forKey:@"IsCandidateView"];
    [parameters setObject:@"1" forKey:@"PageNumber"];
    [parameters setObject:@"10" forKey:@"NumberofItemsPerPage"];
    [parameters setObject:@"" forKey:@"KeyWordAndOnAll"];
    [parameters setObject:@"" forKey:@"KeyWordInJobTitle"];
    [parameters setObject:@"" forKey:@"KeyWordOnLocationAdvance"];
    [parameters setObject:@"" forKey:@"CompanyLocationId"];
    [parameters setObject:@"" forKey:@"FilterByProfileId"];
    [parameters setObject:@"" forKey:@"JobByMeOnly"];
    [parameters setObject:@"-1" forKey:@"WithinDays"];
    
    NSLog(@"Parameters: %@", parameters);
    
    NSPostAndUrlObject * postUrlObject = [asyncDelegate createPostRequest: parameters];
    NSMutableURLRequest * request = [asyncDelegate createMutableRequest: postUrlObject];
    NSLog(@"Request: %@", request);
    [asyncDelegate asyncPostRequestAndResponseHandler: request: self];
    NSLog(@"Request Ended");
}

- (void) handleResponseAndDelegateToScreen:(NSDictionary *)responseData : (BOOL) errorStatus{
        NSLog(@"Delegating to Second View Controller...");
    JsonResponseParser* jobResponse = [[JsonResponseParser alloc] init];
    jobResponseArray = [jobResponse parseResponse:responseData];
     NSLog(@"JobArrayCount: %ld",jobResponseArray.count);
    [self performSegueWithIdentifier:@"jobList" sender:self];
}

//// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    NSLog(@"prepareForSegue: %@", segue.identifier);
    if ([segue.identifier isEqualToString:@"jobList"]) {
        jobListViewController = [segue destinationViewController];
        jobListViewController.jobResponseList = jobResponseArray;
    }
}

@end
