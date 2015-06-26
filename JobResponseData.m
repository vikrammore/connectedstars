//
//  JobResponseData.m
//  ToDoList
//
//  Created by Vikam MORE on 20/05/15.
//  Copyright (c) 2015 Vikam MORE. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JobResponseData.h"


@interface JobResponseData ()

@end

@implementation JobResponseData

@synthesize jobTitle;
@synthesize jobLocation;
@synthesize jobDescription;
@synthesize errorDesc;

//- (void) parseResponse : (NSDictionary*) input {
//
//    NSArray* jobDisplayList = [self getArrayFromDictionary : @"jobDisplayList" : input];
//    NSArray* jobArray = [jobDisplayList valueForKey:@"job"];
//    NSArray* jobTitleObject = [jobArray valueForKey:@"job_title"];
//    for (int i=0; i < jobTitleObject.count; i++){
//        NSLog(@"JobTitle:= %@", jobTitleObject[i]);
//    }
//    NSArray* jobDesc = [jobArray valueForKey:@"job_description"];
//    for (int i=0; i < jobDesc.count; i++){
//        NSLog(@"JobDesc:= %@", jobDesc[i]);
//    }
//    
//    NSArray* jobLocArray = [jobDisplayList valueForKey:@"location"];
//    NSArray* jobLocNameArray = [jobLocArray valueForKey:@"name"];
//    for (int i=0; i < jobLocNameArray.count; i++){
//        NSLog(@"JobLocName:= %@", jobLocNameArray[i]);
//    }
//
//    
////    NSEnumerator *enumerator = [input keyEnumerator];
////    id key;
////    
////    while ((key = [enumerator nextObject])) {
////        NSLog(@"Deserialized JSON Key = %@", key);
////        NSObject* object = [input objectForKey:key];
////        if ([key  isEqual: @"jobDisplayList"] && [object isKindOfClass:[NSArray class]]){
////            NSArray* array = (NSArray*)object;
////            NSObject* value = [array valueForKey:@"job"];
////            if (value != NULL && [value isKindOfClass:[NSArray class]]){
////                NSLog(@"NSArray");
////                NSArray* jobTitleObject = [value valueForKey:@"job_title"];
////                //NSLog(@"JobTitle:= %@", jobTitleObject);
////                for (int i=0; i < jobTitleObject.count; i++){
////                    NSLog(@"JobTitle:= %@", jobTitleObject[i]);
////                }
////            }
////            value = [array valueForKey:@"location"];
////            if (value != NULL && [value isKindOfClass:[NSArray class]]){
////                NSLog(@"NSArray");
////                NSArray* jobLocationObject = [value valueForKey:@"name"];
////                //NSLog(@"JobLocation:= %@", jobLocationObject);
////                for (int i=0; i < jobLocationObject.count; i++){
////                    NSLog(@"JobTitle:= %@", jobLocationObject[i]);
////                }
////            }
////        }
////    }
//}
//
//
//- (NSArray*) getArrayFromDictionary: (NSString*) keyWord : (NSDictionary*) input{
//    NSObject* object = [input objectForKey:keyWord];
//    //NSLog(@"getArrayFromDictionary Object= %@", object);
//    if (object != NULL && [object isKindOfClass:[NSArray class]]){
//        return (NSArray*)object;
//    }
//    return NULL;
//}
//
//- (NSDictionary*) getDictionaryFromDictionary: (NSString*) keyWord : (NSDictionary*) input{
//    NSObject* object = [input objectForKey:keyWord];
//    NSLog(@"getDictionaryFromDictionary Object= %@", object);
//    if (object != NULL && [object isKindOfClass:[NSDictionary class]]){
//        return (NSDictionary*)object;
//    }
//    return NULL;
//}
//
//- (NSString*) getStringFromDictionary: (NSString*) keyWord : (NSDictionary*) input{
//    NSObject* object = [input objectForKey:keyWord];
//    NSLog(@"getStringFromDictionary Object= %@", object);
//    if (object != NULL && [object isKindOfClass:[NSString class]]){
//        return (NSString*)object;
//    }
//    return NULL;
//}
//
//- (NSObject*) getObjectFromDictionary: (NSString*) keyWord : (NSDictionary*) input{
//    NSObject* object = [input objectForKey:keyWord];
//    NSLog(@"getObjectFromDictionary Object= %@", object);
//    if (object != NULL && [object isKindOfClass:[NSObject class]]){
//        return object;
//    }
//    return NULL;
//}

@end

