//
//  DiceManager.m
//  Threelow
//
//  Created by Shaun Campbell on 2016-09-07.
//  Copyright © 2016 Shaun Campbell. All rights reserved.
//

#import "DiceManager.h"

@implementation DiceManager

- (instancetype)init
{
    self = [super init];
    if (self) {
        _allDice = [[NSMutableArray alloc] init];
        
        for  (int i = 0; i<5; i++)
        {
            [_allDice addObject:[[Dice alloc] init]];
        }
        
        _heldDice = [[NSMutableSet alloc] init];
    }
    return self;
}

-(void)rollUnheldDice
{
    for(int i = 0; i<self.allDice.count; i++)
    {
        if(![self.heldDice containsObject:self.allDice[i]])
        {
            NSLog(@"Dice %d rolled %@",(i), [self.allDice[i] roll]);
        }
    }
}

-(void)holdDice:(Dice *)diceToHold
{
    [self.heldDice addObject:diceToHold];
}

-(NSNumber *)currentScore
{
    int score = 0;
    for(NSNumber *diceScore in self.allDice)
    {
        score += [diceScore intValue];
    }
    
    return [NSNumber numberWithInt:score];
}



@end
