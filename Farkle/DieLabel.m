//
//  DieLabel.m
//  Farkle
//
//  Created by Daniel Barrido on 10/8/15.
//  Copyright © 2015 RunDMC. All rights reserved.
//

#import "DieLabel.h"

@implementation DieLabel

- (void)diceSelected:(UITapGestureRecognizer *)sender {
    NSLog(@"%@",self.text);
    if (self.doesDieQualifyForScoring == YES) {
        self.backgroundColor = [UIColor darkGrayColor]; // UI Elements shouldn't be here so should probably change to a variable and set in view controller
        //code 
    }

}

-(id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(diceSelected:)];
    [self addGestureRecognizer:tapGesture];
    [self.delegate tappedLabel:self didTapDieLabel:tapGesture];
        //add code here
    return self;
}

-(void)roll:(id)sender{
    if (self.isDieHeld == NO) {//self.isDieHeld == YES when
        self.text = [NSString stringWithFormat:@"%lu",(unsigned long)arc4random_uniform(6) + 1]; //NSUInteger randomDiceNumber = arc4random_uniform(6) + 1;
    } else {
        //
    }

}

//-(void)tappedLabel:(id)tappedLabel didTapDieLabel:(DieLabel *)dieLabel{
//    NSLog(@"didTapDieLabel method called");
//
//    [self.delegate DieLabel:self didTapDieLabel:sender]; //called the protocol method on the delegate property
    //When the DieLabel is tapped, call the delegate-protocol method on the DieLabel’s delegate property
    //In your DieLabelDelegate protocol method implementation add the DieLabel instance to your dice array
@end
