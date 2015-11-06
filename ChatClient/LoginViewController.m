//
//  LoginViewController.m
//  ChatClient
//
//  Created by Robin Wu on 11/5/15.
//  Copyright © 2015 Robin Wu. All rights reserved.
//

#import "LoginViewController.h"
#import <Parse/Parse.h>
#import "ChatViewController.h"

@interface LoginViewController ()

@property (weak, nonatomic) IBOutlet UITextField *email;

@property (weak, nonatomic) IBOutlet UITextField *password;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (IBAction)onLogin:(id)sender {
    NSLog(@"onLogin");
    
    [PFUser logInWithUsernameInBackground:@"lprobinwu" password:@"Pass4RobinWu#12"
                                    block:^(PFUser *user, NSError *error) {
                                        if (user) {
                                            // Do stuff after successful login.
                                            NSLog(@"Logged in");
                                            [self goToChatController];
                                        } else {
                                            // The login failed. Check error to see why.
                                            NSLog(@"Error when login");
                                        }
                                    }];

}

- (void) goToChatController {
    ChatViewController *chatVC = [[ChatViewController alloc] init];
    
    UINavigationController *nvc = [[UINavigationController alloc] initWithRootViewController:chatVC];
    
    [self presentViewController:nvc animated: YES completion: nil];
    
}

- (IBAction)onSignUp:(id)sender {
    PFUser *user = [PFUser user];
    
    user.username = @"lprobinwu";
    user.password = @"Pass4RobinWu#12";
    user.email = @"lprobinwu@gmail.com";
    
    // other fields can be set just like with PFObject
    user[@"phone"] = @"778-628-0546";
    
    [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (!error) {   // Hooray! Let them use the app now.
            NSLog(@"Signed up");
        } else {   NSString *errorString = [error userInfo][@"error"];   // Show the errorString somewhere and let the user try again.
            NSLog(@"Got an erorr when sign up");
        }
    }];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
