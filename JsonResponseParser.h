//
//  JsonResponseParser.h
//  ToDoList
//
//  Created by Vikam MORE on 29/05/15.
//  Copyright (c) 2015 Vikam MORE. All rights reserved.
//

//#ifndef ToDoList_JsonResponseParser_h
//#define ToDoList_JsonResponseParser_h
//
//
//#endif

@interface JsonResponseParser : NSObject

- (NSArray*) parseResponse : (NSDictionary*) input ;
- (NSArray*) getArrayFromDictionary: (NSString*) keyWord : (NSDictionary*) input;
- (NSDictionary*) getDictionaryFromDictionary: (NSString*) keyWord : (NSDictionary*) input;
- (NSString*) getStringFromDictionary: (NSString*) keyWord : (NSDictionary*) input;
- (NSObject*) getObjectFromDictionary: (NSString*) keyWord : (NSDictionary*) input;

@end