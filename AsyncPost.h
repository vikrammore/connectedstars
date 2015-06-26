//
//  AsyncPost.h
//  ToDoList
//
//  Created by Vikam MORE on 20/04/15.
//  Copyright (c) 2015 Vikam MORE. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ViewController.h"

@interface AsyncPost : NSObject<DelegateHandleCalls> {
    
    NSMutableData   *buffer;
    
    NSURLConnection *connection;
    
    NSInteger success;
    
    NSString *errorString;
    
    NSDictionary * data;
    
    NSString * error;
}

@property (nonatomic) NSInteger success;
@property (nonatomic) NSDictionary* data;
@property (nonatomic) NSString* error;

@property (nonatomic, strong) NSMutableData   *buffer;

@property (nonatomic, strong) NSURLConnection *connection;

@property (nonatomic) NSString *errorString;

@end