//
//  EnterNounViewController.m
//  WordPlay
//
//  Created by Sherrie Jones on 3/10/15.
//  Copyright (c) 2015 Sherrie Jones. All rights reserved.
//

#import "EnterNounViewController.h"
#import "EnterNameViewController.h"
#import "EnterAdjectiveViewController.h"
#import "EnterAdverbViewController.h"
#import "ResultsViewController.h"

@interface EnterNounViewController ()
@property (strong, nonatomic) IBOutlet UITextField *nounTextField;
@end

@implementation EnterNounViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}

// if the textfield is empty, do not continue to next ViewController
-(BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(UITextField *)sender {

    if ([self.nounTextField.text isEqualToString:@""]) {

        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"No noun entered" message:@"You must enter a noun to proceed" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];

        [alert show];
        return NO;

    } else {
        return YES;
    }
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(UIButton *)sender {
    ResultsViewController *resultsViewController = segue.destinationViewController;
    resultsViewController.name = self.name;
    resultsViewController.adjective = self.adjective;
    resultsViewController.adverb = self.adverb;
    resultsViewController.noun = self.nounTextField.text;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    // dismiss the keyboard
    [self.nounTextField resignFirstResponder];
    return NO;
}



@end
