//
//  EnterAdverbViewController.m
//  WordPlay
//
//  Created by Sherrie Jones on 3/10/15.
//  Copyright (c) 2015 Sherrie Jones. All rights reserved.
//

#import "EnterAdverbViewController.h"
#import "EnterNounViewController.h"

@interface EnterAdverbViewController ()
@property (strong, nonatomic) IBOutlet UITextField *adverbTextField;
@end

@implementation EnterAdverbViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

// if the textfield is empty, do not continue to next ViewController
-(BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(UITextField *)sender {

    if ([self.adverbTextField.text isEqualToString:@""]) {

        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"No adverb entered" message:@"You must enter an adverb to proceed" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];

        [alert show];
        return NO;

    } else {
        return YES;
    }
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(UIButton *)sender {
    EnterNounViewController *nounViewController = segue.destinationViewController;
    nounViewController.name = self.name;
    nounViewController.adjective = self.adjective;
    nounViewController.adverb = self.adverbTextField.text;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    // dismiss the keyboard
    [self.adverbTextField resignFirstResponder];
    return NO;
}

@end
