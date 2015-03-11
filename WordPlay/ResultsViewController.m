//
//  ResultsViewController.m
//  WordPlay
//
//  Created by Sherrie Jones on 3/10/15.
//  Copyright (c) 2015 Sherrie Jones. All rights reserved.
//

#import "ResultsViewController.h"
#import "EnterNameViewController.h"
#import "EnterAdjectiveViewController.h"
#import "EnterAdverbViewController.h"
#import "EnterNounViewController.h"
#import "CoreText/CoreText.h"

@interface ResultsViewController ()
@property (strong, nonatomic) IBOutlet UITextView *resultsTextView;
@end

@implementation ResultsViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    NSString *stringFormat = [NSString stringWithFormat:@"One day, %@ was %@ walking into MobileMakers when he noticed how %@ his students were writing %@.", self.name, self.adjective, self.adverb, self.noun];

    // get the ranges of key words
    NSRange nameRange = [stringFormat rangeOfString:self.name];
    NSRange adjectiveRange = [stringFormat rangeOfString:self.adjective];
    NSRange adverbRange = [stringFormat rangeOfString:self.adverb];
    NSRange nounRange = [stringFormat rangeOfString:self.noun];

    NSMutableAttributedString *finalFormat = [[NSMutableAttributedString alloc]
                            initWithString:stringFormat];

    [finalFormat beginEditing];
        // name
        [finalFormat addAttribute:NSFontAttributeName
                            value:[UIFont fontWithName:@"HelveticaNeue-Bold" size:20.0]
                            range:(NSRange){nameRange.location, [self.name length]}];
        [finalFormat addAttribute:NSForegroundColorAttributeName
                        value:[UIColor yellowColor]
                        range:nameRange];

        // adjective
        [finalFormat addAttribute:NSFontAttributeName
                            value:[UIFont fontWithName:@"HelveticaNeue-Bold" size:20.0]
                            range:(NSRange){adjectiveRange.location, [self.adjective length]}];
        [finalFormat addAttribute:NSForegroundColorAttributeName
                        value:[UIColor greenColor]
                        range:adjectiveRange];

        // adverb
        [finalFormat addAttribute:NSFontAttributeName
                            value:[UIFont fontWithName:@"HelveticaNeue-Bold" size:20.0]
                            range:(NSRange){adverbRange.location, [self.adverb length]}];
        [finalFormat addAttribute:NSForegroundColorAttributeName
                        value:[UIColor blueColor]
                        range:adverbRange];

        // noun
        [finalFormat addAttribute:NSFontAttributeName
                            value:[UIFont fontWithName:@"HelveticaNeue-Bold" size:20.0]
                            range:(NSRange){nounRange.location, [self.noun length]}];
        [finalFormat addAttribute:NSForegroundColorAttributeName
                            value:[UIColor redColor]
                        range:adverbRange];
    [finalFormat endEditing];

    // set the text field view
    self.resultsTextView.attributedText = finalFormat;
}





@end
