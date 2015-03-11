//
//  EnterNameViewController.m
//  WordPlay
//
//  Created by Sherrie Jones on 3/10/15.
//  Copyright (c) 2015 Sherrie Jones. All rights reserved.
//

#import "EnterNameViewController.h"
#import "EnterAdjectiveViewController.h"

@interface EnterNameViewController ()

@property (strong, nonatomic) IBOutlet UITextField *nameTextField;

@end

@implementation EnterNameViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}

// if the textfield is empty, do not continue to next ViewController
-(BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(UITextField *)sender {

    if ([self.nameTextField.text isEqualToString:@""]) {

        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"No name entered" message:@"You must enter a name to proceed" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];

        [alert show];
        return NO;

    } else {
        return YES;
    }
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(UIButton *)sender {
    EnterAdjectiveViewController *enterAdjectiveViewController = segue.destinationViewController;
    enterAdjectiveViewController.name = self.nameTextField.text;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    // dismiss the keyboard
    [self.nameTextField resignFirstResponder];
    return NO;
}

@end
