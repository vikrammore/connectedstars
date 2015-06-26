//
//  JobResponseData.h
//  ToDoList
//
//  Created by Vikam MORE on 01/06/15.
//  Copyright (c) 2015 Vikam MORE. All rights reserved.
//

//#ifndef ToDoList_JobResponseData_h
//#define ToDoList_JobResponseData_h
//
//
//#endif

@interface JobResponseData : NSObject{
    NSString* jobTitle;
    NSString* jobLocation;
    NSString* jobDescription;
    NSString* errorDesc;
}

@property (nonatomic) NSString* jobTitle;
@property (nonatomic) NSString* jobLocation;
@property (nonatomic) NSString* jobDescription;
@property (nonatomic) NSString* errorDesc;

@end