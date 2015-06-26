//
//  AsyncPost.m
//  ToDoList
//
//  Created by Vikam MORE on 20/04/15.
//  Copyright (c) 2015 Vikam MORE. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AsyncPost.h"
#import "SecondViewController.h"
#import "NSPostAndUrlObject.h"

@interface AsyncPost() 

@end

@implementation AsyncPost

@synthesize connection;
@synthesize buffer;
@synthesize success;
@synthesize data;
@synthesize error;
@synthesize errorString;


- (void) setBuffer:(NSMutableData *) input {
    buffer = input;
}

- (void) setNSURLConnection : (NSURLConnection*) input {
    connection = input;
}

- (void) setSuccess: (NSInteger) input {
    success = input;
}

- (void) setErrorString:(NSString *) input {
    errorString = input;
}

- (void) asyncPostRequestAndResponseHandler: (NSMutableURLRequest *) request : (UIViewController*) viewController {
     
     [NSURLConnection sendAsynchronousRequest:request queue:[[NSOperationQueue alloc] init] completionHandler:^(NSURLResponse *response, NSData *nsData, NSError *nsError) {
         NSError *parseError = nil;
         //NSData
         NSDictionary *jsonData = [NSJSONSerialization JSONObjectWithData:nsData options: NSJSONReadingMutableContainers error:&parseError];
         if(nsError == nil){
             //request url JSON data
             NSLog(@"Fetched JSON from %@", request.URL);
             //NSLog(@"JSON Data: %@", jsonData);
             //http response and return success
             NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
             NSLog(@"Response: %@", response);

             //no error on login
             if ([httpResponse statusCode] >= 200 && [httpResponse statusCode] < 300){
                 NSString *response = nil;
                 BOOL errorStatus = FALSE;
                 if ( nil == jsonData[@"error"]){
                     //self.success = 1;
                     //self.data = jsonData;//jsonData[@"access_token"];//[NSString stringWithFormat:@"%@", jsonData];
                     //self.error = nil ;
                     //response
                     //response = self.data;
                 }else{
                     //self.success = 0;
                     //self.data = nil;
                     //self.error = jsonData[@"error_description"] ;
                     response = self.error;
                     errorStatus = TRUE;
                 }
                 
                 if ([self isSecondViewController:viewController]){
                     NSLog(@"Delegating to Second View Controller");
                     dispatch_async(dispatch_get_main_queue(), ^{
                         //if ([self isViewController:viewController]){
                         //NSString *response = self.data[@"access_token"];
                         [((SecondViewController *)viewController) handleResponseAndDelegateToScreen : jsonData : errorStatus];
                         //}
                     });
                 }
                 
                 if ([self isViewController:viewController]){
                     dispatch_async(dispatch_get_main_queue(), ^{
                         //if ([self isViewController:viewController]){
                             //NSString *response = self.data[@"access_token"];
                             [((ViewController *)viewController) handleResponseAndDelegateToScreen : jsonData : errorStatus];
                         //}
                     });
                 }
                 
                 
             }
         }else {
             NSLog(@"Error: %@", nsError.localizedDescription);
             //self.success = 0;
             //self.data = nil;
             //self.error = jsonData[@"error_description"] ;

             dispatch_async(dispatch_get_main_queue(), ^{
                 if ([self isViewController:viewController]){
                     [((ViewController *)viewController) handleResponseAndDelegateToScreen : jsonData : TRUE];
                 }
                 
                 if ([self isSecondViewController:viewController]){
                     NSLog(@"Delegating to Second View Controller");
                     [((SecondViewController *)viewController) handleResponseAndDelegateToScreen : jsonData : TRUE];
                 }
             });
         }}];
}

- (Boolean) isViewController: (UIViewController*) viewController{
    if ([viewController isKindOfClass: [ViewController class]]){
        return TRUE;
    }
         return false;
}

- (Boolean) isSecondViewController: (UIViewController*) viewController{
    if ([viewController isKindOfClass: [SecondViewController class]]){
        return TRUE;
    }
    return false;
}

- (void)dataFromController:(NSString *)data
{
    //_label.text = data;
   // _button.enabled = NO;
}

- (NSPostAndUrlObject *) createPostRequest: (NSDictionary *)parameters {
    NSURL *url=[NSURL URLWithString:parameters[@"httpUrl"]];
    NSMutableDictionary * jsonReq = [[NSMutableDictionary alloc] init];
    //NSString *post =[[NSString alloc] init];
    for (id key in parameters) {
        //NSLog(@"There are %@ %@'s in stock", inventory[key], key);
        if (![key  isEqual: @"httpUrl"]){
//            NSString *keyString = [key stringByAppendingString:@"="];
//            NSString *keyValue = [keyString stringByAppendingString:parameters[key]];
//            if ([post length] != 0){
//                post = [post stringByAppendingString:@"&"];
//            }
//            post = [post stringByAppendingString:keyValue];
            
            [jsonReq setObject:parameters[key] forKey:key];
        }
    }
    //NSString *post =[[NSString alloc] initWithFormat:@"grant_type=password&username=%@&password=%@",userName,passWord];
    NSError *errorJson;
    NSData *postData = [NSJSONSerialization dataWithJSONObject:jsonReq options:0 error:&errorJson];
    NSString *postLength = [NSString stringWithFormat:@"%lu", [postData length]];
    //NSLog(@"There are %@ %lu in stock", jsonReq, [postData length]);
    NSPostAndUrlObject* postUrlObject = [[NSPostAndUrlObject alloc] init];
    [postUrlObject setNsUrl:url];
    [postUrlObject setPostData:postData];
    [postUrlObject setPostLength:postLength];
    return postUrlObject;
}

- (NSMutableURLRequest *) createMutableRequest:(NSPostAndUrlObject *)postAndUrlObj {
    //generate the mutable request
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:postAndUrlObj.nsURL];
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody: postAndUrlObj.postData];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request setValue:[NSString stringWithFormat:@"%lu", [postAndUrlObj.postData length]] forHTTPHeaderField:@"Content-Length"];
    return request;
}

@end