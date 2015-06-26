//
//  NSPostAndUrlObject.h
//  ToDoList
//
//  Created by Vikam MORE on 16/04/15.
//  Copyright (c) 2015 Vikam MORE. All rights reserved.
//

#ifndef ToDoList_NSPostAndUrlObject_h
#define ToDoList_NSPostAndUrlObject_h


#endif

@interface NSPostAndUrlObject : NSObject {

 NSURL* nsURL;
 NSData* postData;
 NSString* postLength;
 NSDictionary* jsonData;
}

- (NSURL*) nsURL;
- (NSData*) postData;
- (NSString*) postLength;
- (NSDictionary*) jsonData;

- (void) setNsUrl : (NSURL*) input;
- (void) setPostData : (NSData*) input;
- (void) setPostLength : (NSString*) input;
- (void) setJsonData:(NSDictionary *)input;
    
@end