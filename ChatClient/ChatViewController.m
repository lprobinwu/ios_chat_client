//
//  ChatViewController.m
//  ChatClient
//
//  Created by Robin Wu on 11/5/15.
//  Copyright © 2015 Robin Wu. All rights reserved.
//

#import "ChatViewController.h"
#import <Parse/Parse.h>

@interface ChatViewController ()

@property (weak, nonatomic) IBOutlet UITextField *textMessage;


@end

@implementation ChatViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.title = @"Chat";
}

- (IBAction)onSendMessage:(id)sender {
    NSLog(@"sending message");
    
    PFObject *message = [PFObject objectWithClassName:@"Message"];
    message[@"text"] = @"My first message here from Robin Wu";
    [message saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (succeeded) {
            // The object has been saved.
            NSLog(@"message saved");
        } else {
            // There was a problem, check error.description
            NSLog(@"error in saving messages");
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
