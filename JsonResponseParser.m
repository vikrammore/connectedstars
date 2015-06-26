//
//  JsonResponseParser.m
//  ToDoList
//
//  Created by Vikam MORE on 29/05/15.
//  Copyright (c) 2015 Vikam MORE. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JsonResponseParser.h"
#import "JobResponseData.h"

@implementation JsonResponseParser


- (NSArray*) parseResponse : (NSDictionary*) input {
    NSArray* jobResponseList = [[NSArray alloc] init];
    NSArray* jobDisplayList = [self getArrayFromDictionary : @"jobDisplayList" : input];
    NSArray* jobArray = [jobDisplayList valueForKey:@"job"];
    NSArray* jobTitleObject = [jobArray valueForKey:@"job_title"];
    NSArray* jobDesc = [jobArray valueForKey:@"job_description"];
    NSArray* jobLocArray = [jobDisplayList valueForKey:@"location"];
    NSArray* jobLocNameArray = [jobLocArray valueForKey:@"name"];
    
    for (int i=0; i < jobTitleObject.count; i++){
        JobResponseData* response = [[JobResponseData alloc] init];
        [response setJobTitle:jobTitleObject[i]];
        [response setJobDescription:jobDesc[i]];
        [response setJobLocation:jobLocNameArray[i]];
        jobResponseList = [jobResponseList arrayByAddingObject:response];
    }
    return jobResponseList;
}


- (NSArray*) getArrayFromDictionary: (NSString*) keyWord : (NSDictionary*) input{
    NSObject* object = [input objectForKey:keyWord];
    if (object != NULL && [object isKindOfClass:[NSArray class]]){
        return (NSArray*)object;
    }
    return NULL;
}

- (NSDictionary*) getDictionaryFromDictionary: (NSString*) keyWord : (NSDictionary*) input{
    NSObject* object = [input objectForKey:keyWord];
    if (object != NULL && [object isKindOfClass:[NSDictionary class]]){
        return (NSDictionary*)object;
    }
    return NULL;
}

- (NSString*) getStringFromDictionary: (NSString*) keyWord : (NSDictionary*) input{
    NSObject* object = [input objectForKey:keyWord];
    NSLog(@"getStringFromDictionary Object= %@", object);
    if (object != NULL && [object isKindOfClass:[NSString class]]){
        return (NSString*)object;
    }
    return NULL;
}

- (NSObject*) getObjectFromDictionary: (NSString*) keyWord : (NSDictionary*) input{
    NSObject* object = [input objectForKey:keyWord];
    if (object != NULL && [object isKindOfClass:[NSObject class]]){
        return object;
    }
    return NULL;
}

@end