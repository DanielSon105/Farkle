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
    NSLog(@"%@ has been selected",self.text);
    [self.delegate dieLabel:self];
}

-(id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(diceSelected:)];
    [self addGestureRecognizer:tapGesture];
//    self.dice = [NSMutableArray new];
        //add code here
    return self;
}

-(void)roll:(id)sender{
//        if (self.isDieHeld == NO) {//self.isDieHeld == YES when
            self.text = [NSString stringWithFormat:@"%lu",(unsigned long)arc4random_uniform(6) + 1];//NSUInteger randomDiceNumber = arc4random_uniform(6) + 1;
//            if ([self.text  isEqual: @"6"]) {
//                self.text = @"⚅";
//            }
//        } else {
            //
//        }

}

-(void)onTapped:(UITapGestureRecognizer *)sender{
    [self.delegate dieLabel:self];

}

//-(void)tappedLabel:(id)tappedLabel didTapDieLabel:(DieLabel *)dieLabel{
//    NSLog(@"didTapDieLabel method called");
//
//    [self.delegate DieLabel:self didTapDieLabel:sender]; //called the protocol method on the delegate property
    //When the DieLabel is tapped, call the delegate-protocol method on the DieLabel’s delegate property
    //In your DieLabelDelegate protocol method implementation add the DieLabel instance to your dice array
@end
