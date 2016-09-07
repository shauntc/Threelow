//
//  GameController.m
//  Threelow
//
//  Created by Shaun Campbell on 2016-09-07.
//  Copyright © 2016 Shaun Campbell. All rights reserved.
//

#import "GameController.h"

@implementation GameController


-(void)Play
{
    InputCollector *playInputCollector = [[InputCollector alloc] init];
    DiceManager *diceManager = [[DiceManager alloc] init];
    
    
    bool play = YES;
    bool hasRolled = NO;
    NSString *playOptions = @"end - roll - reset - ";

    
    while(play)
    {
        
        //Show Score if
        if(hasRolled)
        {
            NSLog(@"Score: %@     Number of Rolls: %@", [diceManager currentScore], @1);
        }
        else
        {
            NSString *userInput = [playInputCollector inputWithHistoryForPrompt:playOptions];
        }
        
        if([userInput isEqualToString:@"end"] || [userInput isEqualToString:@"quit"])
        {
            NSLog(@"\nThanks for playing");
            play = NO;
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
            }
            else
            {
                NSLog(@"Invalid Dice Number");
            }
        }
        
        //Reset game command
        else if ([userInput isEqualToString:@"restart"] || [userInput isEqualToString:@"reset"])
        {
            //reset the game
        }
        
        //Unrecognized command
        else
        {
            NSLog(@"\nInvalid Input");
        }
        
        
        
        
        
    }
    
    
    
    
}


@end
