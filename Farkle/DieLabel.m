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
        //add code here
    return self;
}

-(void)roll:(id)sender{
        if (self.isDieHeld == NO) {//self.isDieHeld == YES when
            self.text = [NSString stringWithFormat:@"%lu",(unsigned long)arc4random_uniform(6) + 1];//NSUInteger randomDiceNumber = arc4random_uniform(6) + 1;
//            if ([self.text  isEqual: @"6"]) {
//                self.text = @"⚅";
//            }
        } else {
            
        }

}

-(void)onTapped:(UITapGestureRecognizer *)sender{
    [self.delegate dieLabel:self];

}

@end
