//
//  DieLabel.h
//  Farkle
//
//  Created by Daniel Barrido on 10/8/15.
//  Copyright © 2015 RunDMC. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DieLabelDelegate <NSObject> //defined a protocol in header



-(void)tappedLabel:(id)tappedLabel didTapDieLabel:(UITapGestureRecognizer *)sender; //declared a method in our protocol GUESS

@end

@interface DieLabel : UILabel

@property (nonatomic,assign)id<DieLabelDelegate>delegate; //declared a property of type 'id' that specified the protocol
@property BOOL doesDieQualifyForScoring;
@property BOOL isDieHeld;
@property NSNumber *dieNumber;

- (void)diceSelected:(UITapGestureRecognizer *)sender; //declared a method in our protocol GUESS

- (void)roll:(id)sender;

//declared a method in our protocol


@end
