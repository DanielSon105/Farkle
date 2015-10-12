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

@property (weak, nonatomic) IBOutlet UILabel *userScore;
@property (weak, nonatomic) IBOutlet UIButton *rollButton;


@property NSMutableArray *dieLabels;
@property NSMutableArray *dice;

@property BOOL canRoll;

@property UITapGestureRecognizer *tapGestureRecognizer;

@property int intRollOnTurn; //An integer between 1 and 6 since the maximum possible number of rolls in a turn is six

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.dieLabels = [NSMutableArray arrayWithObjects: self.dieA, self.dieB, self.dieC, self.dieD, self.dieE, self.dieF, nil];
    for (DieLabel *dieLabel in self.dieLabels) {
        dieLabel.backgroundColor = [UIColor greenColor];
        dieLabel.delegate = self;
        dieLabel.doesDieQualifyForScoring = NO;
        dieLabel.isDieHeld = NO;
        dieLabel.isDieBankReady = NO;
    }
    self.dice = [NSMutableArray new];
    

//    return @[@"⚀",@"⚁",@"⚂",@"⚃",@"⚄",@"⚅"];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidAppear:(BOOL)animated {
//    self.dice =[[NSMutableArray alloc] init];
}


#pragma mark Scoring Rules & Methods


#pragma mark Rolling Rules & Methods
//

- (IBAction)onRollButtonPressed:(UIButton *)sender {

    for (DieLabel *dieLabel in self.dieLabels) {
        NSLog (@"Die has a label of %@ at the point of rolling", dieLabel.text);
        [dieLabel roll:sender]; //as a user I want to roll all the dice
    }
}

-(void)canPlayerRoll {
    if (self.canRoll == YES) {
        self.rollButton.enabled = YES;
    } else {
        self.rollButton.enabled = NO;
    }
}

-(void)doSelectedDiceQualify {
    //do stuff
}

-(void)advanceRollOnTurn {
    //if Farkle --- if all dice in unselectedDice == unscorable
        //if Roll 6 --- if (int rollInt == 5)
    //else


}


#pragma mark Multiplayer Rules & Methods

#pragma mark DieLabelDelegate Method

-(void)dieLabel:(DieLabel *)dieLabel {

    int numberOfOnesHeld = 0;
    int numberOfTwosHeld = 0;
    int numberOfThreesHeld = 0;
    int numberOfFoursHeld = 0;
    int numberOfFivesHeld = 0;
    int numberOfSixesHeld = 0;
    for(NSNumber *number in self.dice){
        numberOfOnesHeld += number.integerValue == 1 ? 1:0;
//        numberOfOnesHeld += ([number isEqualToNumber:[NSNumber numberWithInteger:[[NSString stringWithFormat:@"1"] integerValue]]]?1:0);
        numberOfTwosHeld += number.integerValue == 2 ? 1:0;
//        ([number isEqualToNumber:[NSNumber numberWithInteger:[[NSString stringWithFormat:@"2"] integerValue]]]?1:0);
        numberOfThreesHeld += number.integerValue == 3 ? 1:0;
//        ([number isEqualToNumber:[NSNumber numberWithInteger:[[NSString stringWithFormat:@"3"] integerValue]]]?1:0);
        numberOfFoursHeld += number.integerValue == 4 ? 1:0;
//        ([number isEqualToNumber:[NSNumber numberWithInteger:[[NSString stringWithFormat:@"4"] integerValue]]]?1:0);
        numberOfFivesHeld += number.integerValue == 5 ? 1:0;
//        ([number isEqualToNumber:[NSNumber numberWithInteger:[[NSString stringWithFormat:@"5"] integerValue]]]?1:0);
        numberOfSixesHeld += number.integerValue == 6 ? 1:0;
//        ([number isEqualToNumber:[NSNumber numberWithInteger:[[NSString stringWithFormat:@"6"] integerValue]]]?1:0);
    }
    NSLog(@"Ones: %d, Twos: %d, Threes: %d, Fours: %d, Fives: %d, Sixes: %d", numberOfOnesHeld, numberOfTwosHeld, numberOfThreesHeld, numberOfFoursHeld, numberOfFivesHeld, numberOfSixesHeld);
    NSCountedSet *countedSet = [[NSCountedSet alloc] initWithArray:self.dice];
    NSLog(@"%@", countedSet);


    if (numberOfOnesHeld + numberOfTwosHeld + numberOfThreesHeld + numberOfFoursHeld + numberOfFivesHeld + numberOfSixesHeld == 0) {
        self.canRoll = NO;
    } else {

        if (((numberOfOnesHeld == 0) || (numberOfOnesHeld == 1) || (numberOfOnesHeld == 2) || (numberOfOnesHeld == 3) || (numberOfOnesHeld == 4) || (numberOfOnesHeld == 5) || (numberOfOnesHeld == 6)) && ((numberOfTwosHeld == 0) || (numberOfTwosHeld == 3) || (numberOfTwosHeld == 4) || (numberOfTwosHeld == 5) || (numberOfTwosHeld == 6)) && ((numberOfThreesHeld == 0) || (numberOfThreesHeld == 3) || (numberOfThreesHeld == 4) ||(numberOfThreesHeld == 5) || (numberOfThreesHeld == 6)) && ((numberOfFoursHeld == 0) ||(numberOfFoursHeld == 3) || (numberOfFoursHeld == 4) || (numberOfFoursHeld == 5) ||(numberOfFoursHeld == 6)) && ((numberOfFivesHeld == 0) ||(numberOfFivesHeld == 1) ||(numberOfFivesHeld == 2) ||(numberOfFivesHeld == 3) ||(numberOfFivesHeld == 4) ||(numberOfFivesHeld == 5) ||(numberOfFivesHeld == 6)) && ((numberOfSixesHeld == 0) || (numberOfSixesHeld == 3) ||(numberOfSixesHeld == 4) ||(numberOfSixesHeld == 5) ||(numberOfSixesHeld == 6))) {

            self.canRoll = YES;
            NSLog(@"Can Roll");
        } else {
            NSLog(@"Cannot Roll");
            self.canRoll = NO;
        }

    }





        if (dieLabel.doesDieQualifyForScoring == NO) {

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
