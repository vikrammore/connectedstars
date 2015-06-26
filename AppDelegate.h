//
//  AppDelegate.h
//  ToDoList
//
//  Created by Vikam MORE on 12/04/15.
//  Copyright (c) 2015 Vikam MORE. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

- (NSDictionary *) loadConnectedStarsProperties:(NSString *)fileName;


@end

