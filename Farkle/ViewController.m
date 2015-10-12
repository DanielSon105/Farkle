//
//  ViewController.m
//  Farkle
//
//  Created by Daniel Barrido on 10/8/15.
//  Copyright © 2015 RunDMC. All rights reserved.
//

#import "ViewController.h"
#import "DieLabel.h"

@interface ViewController () <DieLabelDelegate>
//@property CGPoint tappedPoint;


@property (weak, nonatomic) IBOutlet DieLabel *dieA;
@property (weak, nonatomic) IBOutlet DieLabel *dieB;
@property (weak, nonatomic) IBOutlet DieLabel *dieC;
@property (weak, nonatomic) IBOutlet DieLabel *dieD;
@property (weak, nonatomic) IBOutlet DieLabel *dieE;
@property (weak, nonatomic) IBOutlet DieLabel *dieF;

@property NSMutableArray *dieLabels;
@property NSMutableArray *dice;

@property BOOL canRoll;

@property UITapGestureRecognizer *tapGestureRecognizer;

@property int intRollOnTurn; //An integer between 1 and 6 since the maximum possible number of rolls in a turn is six
@property UIColor *heldDieColor;
@property UIColor *unheldDieColor;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.dieLabels = [NSMutableArray arrayWithObjects: self.dieA, self.dieB, self.dieC, self.dieD, self.dieE, self.dieF, nil];
    for (DieLabel *dieLabel in self.dieLabels) {
        dieLabel.backgroundColor = [UIColor greenColor];
        dieLabel.delegate = self;
        dieLabel.doesDieQualifyForScoring = YES;
    }
    self.dice = [NSMutableArray new];
    

//    return @[@"⚀",@"⚁",@"⚂",@"⚃",@"⚄",@"⚅"];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidAppear:(BOOL)animated {
    self.dice =[[NSMutableArray alloc] init];
}

- (IBAction)onRollButtonPressed:(UIButton *)sender {
//    self.dice = [NSMutableArray new];
//    NSMutableArray *diceArray = self.dice;
    for (DieLabel *dieLabel in self.dieLabels) {
        NSLog (@"Die has a label of %@ at the point of rolling", dieLabel.text);
        [dieLabel roll:sender]; //as a user I want to roll all the dice

        if (self.canRoll == NO){
        }
        }
}

-(void)tappedLabel:(DieLabel *)tappedLabel {

        NSLog (@"Die has a label of %@ and was tapped", self.dice);
               //add the selected dice to the dice array
}

-(void)diceSelected:(UITapGestureRecognizer *)sender {
    NSLog(@"PlaceHolder for diceSelected method in main view controller");
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark DieLabelDelegate Method

-(void)dieLabel:(DieLabel *)dieLabel {

    NSLog(@"Testing 123");

        if (dieLabel.doesDieQualifyForScoring == YES) {
            dieLabel.backgroundColor = [UIColor darkGrayColor]; // UI Elements shouldn't be here so should probably change to a variable and set in view controller
        if (dieLabel.isDieHeld == NO) {
            dieLabel.backgroundColor = [UIColor blueColor];
            dieLabel.dieNumber = [NSNumber numberWithInteger:[dieLabel.text integerValue]];
            NSLog(@"%@", dieLabel.dieNumber);
            [self.dice addObject:dieLabel.dieNumber];
    
            NSLog(@"%@ was added to the dice array", self.dice);
            dieLabel.isDieHeld = YES;
            for (NSNumber *number in self.dice) {
                NSLog(@"%@ is part of the dice array", number);
            }
        } else if (dieLabel.isDieHeld == YES){
            dieLabel.backgroundColor = [UIColor greenColor];
            dieLabel.dieNumber = [NSNumber numberWithInteger:[dieLabel.text integerValue]];
            [self.dice removeObject:dieLabel.dieNumber];
            dieLabel.isDieHeld = NO;
            for (NSNumber *number in self.dice) {
                NSLog(@"%@ is part of the dice array", number);
            }
        } else{
            dieLabel.isDieHeld = NO;
        }
}
}

@end
