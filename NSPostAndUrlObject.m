//
//  NSPostAndUrlObject.m
//  ToDoList
//
//  Created by Vikam MORE on 16/04/15.
//  Copyright (c) 2015 Vikam MORE. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSPostAndUrlObject.h"

@interface NSPostAndUrlObject ()

@end

@implementation NSPostAndUrlObject

- (NSURL *) nsURL {
    return nsURL;
}

-(NSData *) postData {
    return postData;
}

-(NSString *) postLength {
    return postLength;
}

-(NSDictionary *) jsonData {
    return jsonData;
}

- (void) setNsUrl : (NSURL *) input{
    nsURL = input;
}

- (void) setPostData : (NSData *) input{
    postData = input;
}

- (void) setPostLength : (NSString *) input{
    postLength = input;
}

- (void) setJsonData:(NSDictionary *)input{
    jsonData = input;
}

@end