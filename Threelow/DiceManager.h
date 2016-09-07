//
//  DiceManager.h
//  Threelow
//
//  Created by Shaun Campbell on 2016-09-07.
//  Copyright © 2016 Shaun Campbell. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Dice.h"

@interface DiceManager : NSObject

@property NSMutableArray *allDice;
@property NSMutableSet *heldDice;

-(void)rollUnheldDice;
-(void)holdDice:(Dice *)diceToHold;
-(void)releaseDice:(Dice *)diceToRelease;

-(NSNumber *)currentScore;


@end
