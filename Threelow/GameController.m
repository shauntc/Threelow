//
//  GameController.m
//  Threelow
//
//  Created by Shaun Campbell on 2016-09-07.
//  Copyright © 2016 Shaun Campbell. All rights reserved.
//

#import "GameController.h"

@implementation GameController


-(bool)Play
{
    InputCollector *playInputCollector = [[InputCollector alloc] init];
    DiceManager *diceManager = [[DiceManager alloc] init];
    
    
    bool play = YES;
    bool hasRolled = NO;
    NSString *playOptions = @"\nend - roll - reset - ";
    NSString *userInput = [[NSString alloc] init];

    
    while(play)
    {
        
        //Prompt User for input, show score if user has rolled at least once
        if(hasRolled)
        {
            userInput = [playInputCollector inputWithHistoryForPrompt:[NSString stringWithFormat:@"\nScore:%@  Rolls:%@%@",[diceManager currentScore],@5, playOptions]];
        }
        else
        {
            userInput = [playInputCollector inputWithHistoryForPrompt:playOptions];
        }
        
        if([userInput isEqualToString:@"end"])
        {
            NSLog(@"\nThanks for playing");
            return NO;
            play = NO;
        }
        else if([userInput isEqualToString:@"quit"])
        {
            NSLog(@"\nThanks for playing");
            NSLog(@"\nquitting.....");
            return YES;
        }
        
        //Roll command
        else if([userInput isEqualToString:@"roll"])
        {
            hasRolled = YES;
            [diceManager rollUnheldDice];
        }
        
        //Hold # - hold dice number
        else if([userInput hasPrefix:@"hold"])
        {
            if([userInput isEqualToString:@"hold"])
            {
                userInput = [playInputCollector inputWithHistoryForPrompt:@"What dice number would you like to hold?"];
            }
            
            int i = [[userInput stringByReplacingOccurrencesOfString:@"hold " withString:@""] intValue];
            if((i!=0 || [[userInput stringByReplacingOccurrencesOfString:@"hold " withString:@""]  isEqual: @"0"]) && i < diceManager.allDice.count)
            {
                [diceManager holdDice:diceManager.allDice[i]];
                NSLog(@"\nDice %d is held", i);
            }
            else
            {
                NSLog(@"Invalid Dice Number");
            }
        }
        
        //Reset game command
        else if ([userInput isEqualToString:@"restart"] || [userInput isEqualToString:@"reset"])
        {
            [diceManager.heldDice removeAllObjects];
            hasRolled = NO;
        }
        
        //Unrecognized command
        else
        {
            NSLog(@"\nInvalid Input");
        }
        
        
        
        
        
    }
    
    return NO;
    
    
}


@end
