//
//  EnterAdjectiveViewController.m
//  WordPlay
//
//  Created by Sherrie Jones on 3/10/15.
//  Copyright (c) 2015 Sherrie Jones. All rights reserved.
//

#import "EnterAdjectiveViewController.h"
#import "EnterAdverbViewController.h"

@interface EnterAdjectiveViewController ()

@property (strong, nonatomic) IBOutlet UITextField *adjectiveTextField;

@end

@implementation EnterAdjectiveViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}

// if the textfield is empty, do not continue to next ViewController
-(BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(UITextField *)sender {

    if ([self.adjectiveTextField.text isEqualToString:@""]) {

        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"No adjective entered" message:@"You must enter an adjective to proceed" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];

        [alert show];
        return NO;

    } else {
        return YES;
    }
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(UIButton *)sender {
    EnterAdverbViewController *adverbViewController = segue.destinationViewController;
    adverbViewController.name = self.name;
    adverbViewController.adjective = self.adjectiveTextField.text;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    // dismiss the keyboard
    [self.adjectiveTextField resignFirstResponder];
    return NO;
}


@end
