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
        else
        {
            NSLog(@"Dice %d held at %@", i, [self.allDice[i] returnValue]);
        }
    }
}

-(void)holdDice:(Dice *)diceToHold
{
    [self.heldDice addObject:diceToHold];
}

-(void)releaseDice:(Dice *)diceToRelease
{
    [self.heldDice removeObject:diceToRelease];
}



-(NSNumber *)currentScore
{
    int score = 0;
    for(Dice *dice in self.allDice)
    {
        int i = [[dice returnValue] intValue];
        if(i != 3)
        {
            score += i;
        }
    }
    
    return [NSNumber numberWithInt:score];
}



@end
