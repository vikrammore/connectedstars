//
//  ViewController.m
//  ToDoList
//
//  Created by Vikam MORE on 12/04/15.
//  Copyright (c) 2015 Vikam MORE. All rights reserved.
//

#import "ViewController.h"
#import "NSPostAndUrlObject.h"
#import "AsyncPost.h"
#import <QuartzCore/QuartzCore.h>
#import "SecondViewController.h"
//#import <FBSDKLoginKit/FBSDKLoginKit.h>

@interface ViewController ()

@end

@implementation ViewController

@synthesize success;
@synthesize accessToken;
@synthesize profileId;
@synthesize error;
@synthesize currentUserAction;

@synthesize asyncDelegate;
@synthesize spinner;
@synthesize buttonLogin;
//@synthesize navigationController;
@synthesize textEmail;
@synthesize textPassword;
@synthesize textSingupEmail;
@synthesize textSingupPassword;
@synthesize textSignupReenterPassword;
@synthesize textSignupName;


//create a constructor to load app properties??

- (void) viewDidLoad {
    [super viewDidLoad];
    
    //facebook
    //FBSDKLoginButton *loginButton = [[FBSDKLoginButton alloc] init];
    //loginButton.center = self.view.center;
    //UIImage* image = [UIImage imageNamed:@"facebook232.png"];
    //loginButton.imageView.backgroundColor = [UIColor blackColor];
    //loginButton.imageView.image = image;
    //[self.view addSubview:loginButton];
    
    
    // Do any additional setup after loading the view, typically from a nib.
    @autoreleasepool {
        asyncDelegate = [[AsyncPost alloc] init];
        currentUserAction = nil;
        //[asyncDelegate loginViewController: self];
    }
    
    textEmail.textColor = [UIColor lightGrayColor];
    UIColor *color = [UIColor lightGrayColor];
    textEmail.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Email" attributes:@{NSForegroundColorAttributeName: color}];
    textPassword.textColor = [UIColor lightGrayColor];
    textPassword.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Password" attributes:@{NSForegroundColorAttributeName: color}];

    //spinner
    CGSize size = self.view.bounds.size;
    spinner= [[UIActivityIndicatorView alloc]initWithFrame:CGRectMake(0, 0, size.width, size.height)];
    spinner.layer.cornerRadius = 05;
    spinner.opaque = NO;
    spinner.backgroundColor = [UIColor colorWithWhite:0.0f alpha:0.6f];
    spinner.center = self.view.center;
    spinner.activityIndicatorViewStyle = UIActivityIndicatorViewStyleGray;
    [spinner setColor:[UIColor colorWithRed:0.6 green:0.8 blue:1.0 alpha:1.0]];
    spinner.hidesWhenStopped = YES;
    [self.view addSubview: spinner];
    
}

- (void) didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction) buttonLogin:(id)sender {
    @try
    {
        currentUserAction = @"buttonLogin";
        if ([[self.textEmail text] isEqualToString:@""] || [[self.textPassword text] isEqualToString:@""]){
            [self alertStatus:@"Please enter Email and Password" :@"Sign in Failed!" :0];
            
        }else{
            NSMutableURLRequest * request = [self createPostRequest: self.textEmail.text : self.textPassword.text :
                                             //@"https://dipinkrishna.com/jsonlogin.php"];
                                             @"https://dit.connectedstars.com/service/token"];
            //[UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
            //if ([self fireSyncPostRequestAndParseResponse:request]){
            //if ([self fireAsyncPostRequestAndParseResponse:request]){
            //if ([self invokeAsyncLoginCall: request : spinner]){
              //   NSLog(@"Success, connecting to the next screen: job screen");
                //[self performSegueWithIdentifier:@"login_success" sender:self];
            //}
            //[UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
            //[self invokeAsyncLoginCall: request];
            [self.spinner startAnimating];
            buttonLogin.enabled = NO;
            buttonLogin.alpha = 0.5;
            [asyncDelegate asyncPostRequestAndResponseHandler: request: self];
        }
        
        
    }
    @catch (NSException * e){
       // NSLog(@"Exception: %@", e);
        //[self alertStatus:@"Sign in Failed." :@"Error!" :0];
    }
}

- (IBAction)buttonSignup:(id)sender {
    @try
    {
        currentUserAction = @"buttonSignup";
        //if ([[self.textEmail text] isEqualToString:@""] || [[self.textPassword text] isEqualToString:@""]){
           // [self alertStatus:@"Please enter Email and Password" :@"Sign in Failed!" :0];
            
        //}else{
//            NSMutableURLRequest * request = [self createPostRequest: self.textEmail.text : self.textPassword.text :
//                                             //@"https://dipinkrishna.com/jsonlogin.php"];
//                                             @"https://dit.connectedstars.com/service/token"];
//            //[UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
//            //if ([self fireSyncPostRequestAndParseResponse:request]){
//            //if ([self fireAsyncPostRequestAndParseResponse:request]){
//            //if ([self invokeAsyncLoginCall: request : spinner]){
//            //   NSLog(@"Success, connecting to the next screen: job screen");
//            //[self performSegueWithIdentifier:@"login_success" sender:self];
//            //}
//            //[UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
//            //[self invokeAsyncLoginCall: request];
//            [self.spinner startAnimating];
//            buttonLogin.enabled = NO;
//            buttonLogin.alpha = 0.5;
//            [asyncDelegate asyncPostRequestAndResponseHandler: request: self];
//        //}
        
        NSMutableDictionary * parameters = [[NSMutableDictionary alloc] init];
        [parameters setObject:@"https://dit.connectedstars.com/service/api/JobsCustomController/GetJob" forKey:@"httpUrl"];
        [parameters setObject:self.textSingupEmail.text forKey:@"textSingupEmail"];
        [parameters setObject:self.textSingupPassword.text forKey:@"textSingupPassword"];
        [parameters setObject:self.textSignupReenterPassword.text forKey:@"textSignupReenterPassword"];
        [parameters setObject:self.textSignupName.text forKey:@"textSignupName"];
        //[parameters setObject:@"Redmond, WA, United States" forKey:@"KeyWordOnLocation"];
        //[parameters setObject:self.data forKey:@"access_token"];
        //"profile_id" = "adfe2623-9af0-4492-85df-b4b9dcdb7e44";
//        [parameters setObject:@"adfe2623-9af0-4492-85df-b4b9dcdb7e44" forKey:@"ProfileId"];
//        [parameters setObject:@"true" forKey:@"IsCandidateView"];
//        [parameters setObject:@"1" forKey:@"PageNumber"];
//        [parameters setObject:@"10" forKey:@"NumberofItemsPerPage"];
//        [parameters setObject:@"" forKey:@"KeyWordAndOnAll"];
//        [parameters setObject:@"" forKey:@"KeyWordInJobTitle"];
//        [parameters setObject:@"" forKey:@"KeyWordOnLocationAdvance"];
//        [parameters setObject:@"" forKey:@"CompanyLocationId"];
//        [parameters setObject:@"" forKey:@"FilterByProfileId"];
//        [parameters setObject:@"" forKey:@"JobByMeOnly"];
//        [parameters setObject:@"-1" forKey:@"WithinDays"];
        
        NSLog(@"Parameters: %@", parameters);
        
        NSPostAndUrlObject * postUrlObject = [asyncDelegate createPostRequest: parameters];
        NSMutableURLRequest * request = [asyncDelegate createMutableRequest: postUrlObject];
        NSLog(@"Request: %@", request);
        [asyncDelegate asyncPostRequestAndResponseHandler: request: self];
        NSLog(@"Request Ended");
        
    }
    @catch (NSException * e){
        NSLog(@"Exception: %@", e);
        [self alertStatus:@"Signup Failed." :@"Error!" :0];
    }
}

- (IBAction) backgroundTap:(id)sender {
    [self.view endEditing:TRUE];
}

- (IBAction)buttonCreatAcct:(id)sender {
}

- (IBAction)buttonFaceBookAuth:(id)sender {
}


- (BOOL) textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return TRUE;
}


- (void) alertStatus:(NSString *)msg :(NSString *)title :(int) tag
{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title
                                                        message:msg
                                                       delegate:self
                                              cancelButtonTitle:@"Ok"
                                              otherButtonTitles:nil, nil];
    alertView.tag = tag;
    [alertView show];
}

- (NSPostAndUrlObject *) createPostQuery:(NSString *) userName :(NSString *) passWord : (NSString *) httpUrl {
    
    NSURL *url=[NSURL URLWithString:httpUrl];
    
    NSString *post =[[NSString alloc] initWithFormat:@"grant_type=password&username=%@&password=%@",userName,passWord];
    NSLog(@"PostData: %@",post);
    NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    NSString *postLength = [NSString stringWithFormat:@"%lu", (unsigned long)[postData length]];
    
    NSPostAndUrlObject* postUrlObject = [[NSPostAndUrlObject alloc] init];
    [postUrlObject setNsUrl:url];
    [postUrlObject setPostData:postData];
    [postUrlObject setPostLength:postLength];
    return postUrlObject;
}

- (NSMutableURLRequest *) createPostRequest:(NSString *)userName : (NSString *)passWord : (NSString *) httpUrl {
    //create Post and Url object
    NSPostAndUrlObject *urlObject = [self createPostQuery: userName :passWord :httpUrl];
    //generate the mutable request
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:urlObject.nsURL];
    [request setHTTPMethod:@"POST"];
    [request setValue:urlObject.postLength forHTTPHeaderField:@"Content-Length"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPBody:urlObject.postData];
    return request;
}

- (BOOL) fireSyncPostRequestAndParseResponse : (NSMutableURLRequest *) request {
    NSError *nsError = [[NSError alloc] init];
    NSHTTPURLResponse *response = nil;
    NSData *urlData=[NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&nsError];
    NSLog(@"Response code: %ld", (long)[response statusCode]);
    
    if ([response statusCode] >= 200 && [response statusCode] < 300) {
        self.success = 0;
        NSString *responseData = [[NSString alloc]initWithData:urlData encoding:NSUTF8StringEncoding];
        NSLog(@"Response ==> %@", responseData);
        
        NSError *nsError = nil;
        NSDictionary *jsonData = [NSJSONSerialization JSONObjectWithData:urlData options:NSJSONReadingMutableContainers
                                  error:&nsError];
        
        self.success = 1;
        //self.data = [NSString stringWithFormat:@"%@", jsonData];
        self.error = nil ;
        // NSLog(@"success: %ld", success);
        NSLog(@"Success: %ld",(long)self.success);
        
        if(self.success == 1) {
            NSLog(@"Login SUCCESS");
            return true;
        } else {
            NSString *error_msg = (NSString *) jsonData[@"error_message"];
            [self alertStatus:error_msg :@"Sign in Failed!" :0];
            return false;
        }
        
    } else {
        //if (error) NSLog(@"Error: %@", error);
        [self alertStatus:@"Connection Failed" :@"Sign in Failed!" :0];
    }
    return false;
}


- (BOOL) fireAsyncPostRequestAndParseResponse : (NSMutableURLRequest *) request {
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    /* create the connection */
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:^(NSURLResponse * response, NSData *nsData, NSError *nsError)
     {  //error is null
         if(error == nil){
             NSError *parseError = nil;
             //NSData
             NSDictionary *jsonData = [NSJSONSerialization JSONObjectWithData:nsData options:
                                       NSJSONReadingMutableContainers error:&parseError];
             //request url JSON data
             NSLog(@"Fetched JSON from %@", request.URL);
             NSLog(@"JSON Data: %@", jsonData);
             //http response and return success
             NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
             if ([httpResponse statusCode] >= 200 && [httpResponse statusCode] < 300) {
                //status >=200 & < 300
                 self.success = 1;
                 //self.data = [NSString stringWithFormat:@"%@", jsonData];
                 self.error = nil ;
                 // NSLog(@"success: %ld", success);
                 [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
             }
             
         }else {
             NSLog(@"Error: %@", nsError.localizedDescription);
         }
     }];
    //success=1 return true else false
    return success == 1 ? true: false;
}

- (void)invokeAsyncLoginCall: (NSMutableURLRequest *) request {
    [asyncDelegate asyncPostRequestAndResponseHandler: request: self];
}


//- (void) setSuccess: (NSInteger) input {
//    success = input;
//}
//
//- (void) setError:(NSString *) input {
//    error = input;
//}
//
//- (void) setData:(NSString *) input {
//    data = input;
//}

- (NSDictionary *) loadConnectedStarsProperties:(NSString *)fileName {
    
    // Find out the path of recipes.plist
    NSString *path = [[NSBundle mainBundle] pathForResource:fileName ofType:@"plist"];
    
    // Load the file content and read the data into arrays
    NSDictionary *dict = [[NSDictionary alloc] initWithContentsOfFile:path];
    return dict;
}

- (void) renderJobScreen: (NSDictionary *)responseData {
     NSLog(@"Render JSON Data: %@", responseData);
    self.accessToken = responseData[@"access_token"];
    self.profileId = responseData[@"profile_id"];
    [self performSegueWithIdentifier:@"loginSuccess" sender:self];
    
    //SecondViewController *secondViewController = [[SecondViewController alloc] init];
    //secondViewController.data = self.data ; // Set the exposed property
    //[self.navigationController pushViewController:secondViewController animated:YES];
    //[self prepareForSegue:@"login_success" sender:self];
}


 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
  //Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
     //SecondViewController *secondViewController=[[SecondViewController alloc]init];
    
     //[self presentViewController:nav animated:NO completion:nil];
     //[navController initWithRootViewController:self];
     //UINavigationController * navController = (UINavigationController*)[segue destinationViewController];
     //[self addChildViewController:navController];
     //[navController initWithRootViewController:self];
     //NSArray *nsArray = (NSArray *)navigationController.viewControllers;
     
     //SecondViewController *secondViewController = (SecondViewController *)[segue destinationViewController];
     //[navController pushViewController:self animated:YES];
     
     NSLog(@"prepareForSegue: %@", segue.identifier);
     
     if ([segue.identifier isEqualToString:@"loginSuccess"]) {
         //UINavigationController *navigationController = (UINavigationController*)[segue destinationViewController];
         //SecondViewController *secondViewController = (SecondViewController *)[navigationController topViewController];
        // SecondViewController *secondViewController = [segue destinationViewController];
         //[segue.destinationViewController data:100];
         NSLog(@"SecondViewController JSON Data: %@", self.accessToken);
         SecondViewController *secondViewController = [segue destinationViewController];
         secondViewController.data = self.accessToken ; // Set the exposed property
         //secondViewController.
         //[navigationController pushViewController:self animated:YES];
         //[navigationController.viewController presentViewController:myView animated:NO completion:nil];
     }
     
     if ([segue.identifier isEqualToString:@"signUp"]) {
         NSLog(@"Rendering Connected JobSignUp Screen");
     }
 }

- (void) handleResponseAndDelegateToScreen:(NSDictionary *)responseData : (BOOL) errorStatus{
    
    if ([currentUserAction isEqualToString:@"buttonLogin"]){
        [self.spinner stopAnimating];
        self.buttonLogin.enabled = YES;
        self.buttonLogin.alpha = 1.0;
        //handle error or success
        if (errorStatus == FALSE)
            [self renderJobScreen: responseData];
        else
            [self alertStatus:responseData[@"error_description"] :@"Sign in Failed!" :0];
        
    }else if ([currentUserAction isEqualToString:@"buttonSingup"]){
    }
}


 

@end



