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
    }

//    return @[@"⚀",@"⚁",@"⚂",@"⚃",@"⚄",@"⚅"];
    // Do any additional setup after loading the view, typically from a nib.
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
-(void)tappedLabel:(id)tappedLabel didTapDieLabel:(id)dieLabel {
    for (DieLabel *dieLabel in self.dieLabels) {
        NSLog (@"Die has a label of %@ and was tapped", dieLabel.text);
               //add the selected dice to the dice array
    }
}

-(void)diceSelected:(UITapGestureRecognizer *)sender {
    NSLog(@"PlaceHolder for diceSelected method in main view controller");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
