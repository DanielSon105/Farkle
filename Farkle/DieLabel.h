//
//  DieLabel.h
//  Farkle
//
//  Created by Daniel Barrido on 10/8/15.
//  Copyright © 2015 RunDMC. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DieLabel;

@protocol DieLabelDelegate <NSObject> //defined a protocol in header


-(void)dieLabel:(DieLabel *)dieLabel;
//declared a method in our protocol

@end

@interface DieLabel : UILabel

@property (weak, nonatomic)id<DieLabelDelegate>delegate; //declared a property of type 'id' that specified the protocol
@property BOOL doesDieQualifyForScoring;
@property BOOL isDieHeld;
@property BOOL isDieBankReady;
@property NSNumber *dieNumber;

- (void)roll:(id)sender;


@end
