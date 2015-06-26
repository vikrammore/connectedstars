//
//  ViewController.h
//  ToDoList
//
//  Created by Vikam MORE on 12/04/15.
//  Copyright (c) 2015 Vikam MORE. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NSPostAndUrlObject.h"
//#import <FBSDKCoreKit/FBSDKCoreKit.h>
//#import <FBSDKLoginKit/FBSDKLoginKit.h>

@class ViewController;

@protocol DelegateHandleCalls

- (void) asyncPostRequestAndResponseHandler: (NSMutableURLRequest *) request :  (UIViewController *) viewController;
- (NSPostAndUrlObject *) createPostRequest: (NSDictionary *)parameters;
- (NSMutableURLRequest *) createMutableRequest:(NSPostAndUrlObject *)postAndUrlObj;


@end

@interface ViewController : UIViewController <UITextFieldDelegate>{
    //textfield
    __weak IBOutlet UITextField *textPassword;
    __weak IBOutlet UITextField *textEmail;
    __weak IBOutlet UITextField *textSingupEmail;
    __weak IBOutlet UITextField *textSingupPassword;
    __weak IBOutlet UITextField *textSignupReenterPassword;
    __weak IBOutlet UITextField *textSignupName;
    //buttons
    //auth buttons
    __weak IBOutlet UIButton *buttonFaceBookAuth;
    __weak IBOutlet UIButton *buttonTwitterAuth;
    __weak IBOutlet UIButton *buttonGooglePlusAuth;
    __weak IBOutlet UIButton *buttonLinkedInAuth;
    //login/signup
    __weak IBOutlet UIButton *buttonLogin;
    __weak IBOutlet UIButton *buttonCreateAcct;
    __weak IBOutlet UIButton *buttonSingup;
    //spinner
    IBOutlet UIActivityIndicatorView *spinner;
    
    NSInteger success;
    NSString * error;
    NSString * accessToken;
    NSString * profileId;
   // UINavigationController *navigationController;
}

@property (weak) UITextField *textEmail;
@property (weak) UITextField *textPassword;
@property (weak) UITextField *textSingupEmail;
@property (weak) UITextField *textSingupPassword;
@property (weak) UITextField *textSignupReenterPassword;
@property (weak) UITextField *textSignupName;

@property (retain) UIActivityIndicatorView *spinner;
@property (weak) UIButton *buttonLogin;
//@property (retain, nonatomic) UINavigationController *navigationController;
@property (nonatomic) NSInteger success;
@property (nonatomic) NSString* error;
@property (nonatomic) NSString* currentUserAction;
@property (nonatomic) NSString* accessToken;
@property (nonatomic) NSString* profileId;
// define delegate property
@property (strong) id  asyncDelegate;

- (IBAction)buttonLogin:(id)sender;
- (IBAction)buttonSignup:(id)sender;
- (IBAction)backgroundTap:(id)sender;
- (IBAction)buttonCreatAcct:(id)sender;
- (IBAction)buttonFaceBookAuth:(id)sender;

- (void) alertStatus:(NSString *)msg :(NSString *)title :(int) tag;

- (NSPostAndUrlObject *) createPostQuery :(NSString *)userName : (NSString *)passWord : (NSString *)httpUrl;

- (NSMutableURLRequest *) createPostRequest: (NSString *)userName : (NSString *)passWord : (NSString *)httpUrl;

- (BOOL) fireSyncPostRequestAndParseResponse : (NSMutableURLRequest *) request;

//- (void) setSuccess:(NSInteger) input;
//
//-(void) setError:(NSString *)input;
//
//-(void) setData:(NSString *)input;

- (BOOL) fireAsyncPostRequestAndParseResponse : (NSMutableURLRequest *) request;

- (void) loadConnectedStarsProperties: (NSString *)fileName;

//-(BOOL)invokeAsyncLoginCall: (NSMutableURLRequest *) request;

- (void) renderJobScreen: (NSDictionary *)responseData;

- (void) handleResponseAndDelegateToScreen: (NSDictionary *) responseData : (BOOL) errorStatus;

@end

