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
    NSString *playOptions = @"\nroll - Roll\nend - End Game\nquit - Quit Program";
    NSString *playOptionsRolled = @"\nroll - Roll Again\nhold # - Hold dice number #\nreset - New Round\nend - End Game\nquit - Quit Program";
    NSString *userInput = [[NSString alloc] init];
    int numRolls = 0;
    NSNumber *lowScore = @30;
    int numDice = 5;
    bool selectedDice = YES;

    
    while(play)
    {
        
        
        
        
        //Prompt User for input, show scores if user has rolled at least once
        if(hasRolled)
        {
            userInput = [playInputCollector inputWithHistoryForPrompt:[NSString stringWithFormat:@"\nScore:%@  Rolls:%d Low-Score:%@%@",[diceManager currentScore], numRolls, lowScore, playOptionsRolled]];
        }
        else
        {
            userInput = [playInputCollector inputWithHistoryForPrompt:playOptions];
        }
        //End Prompt
        
        
        //End Command
        if([userInput isEqualToString:@"end"])
        {
            NSLog(@"\nThanks for playing");
            return NO;
            play = NO;
        }
        //End End
        
        
        //Quit Command
        else if([userInput isEqualToString:@"quit"])
        {
            NSLog(@"\nThanks for playing");
            NSLog(@"\nquitting.....");
            return YES;
        }
        //End Quit
        
        
        //Roll command
        else if([userInput isEqualToString:@"roll"])
        {
            if(numRolls<numDice)
            {
                if(selectedDice)
                {
                    selectedDice = NO;
                    hasRolled = YES;
                    numRolls++;
                    [diceManager rollUnheldDice];
                }
                else
                {
                    NSLog(@"\nCan't roll, hold at least one dice before rolling agin");
                }
            }
            else
            {
                NSLog(@"\nYou've already rolled %d times, you can't roll anymore", numDice);
            }
        }
        //End Roll
        
        
        //Hold # - hold dice number
        else if([userInput hasPrefix:@"hold"] && hasRolled)
        {
            if([userInput isEqualToString:@"hold"])
            {
                userInput = [playInputCollector inputWithHistoryForPrompt:@"\nWhat dice number would you like to hold?"];
            }
            
            int i = [[userInput stringByReplacingOccurrencesOfString:@"hold " withString:@""] intValue];
            if((i!=0 || [[userInput stringByReplacingOccurrencesOfString:@"hold " withString:@""]  isEqual: @"0"]) && i < diceManager.allDice.count)
            {
                [diceManager holdDice:diceManager.allDice[i]];
                selectedDice = YES;
                
                //List held dice
                NSString *heldList = @"";
                for(int j = 0; j<diceManager.allDice.count; j++)
                {
                    if([diceManager.heldDice containsObject:diceManager.allDice[j]])
                    {
                        heldList = [heldList stringByAppendingString:[NSString stringWithFormat:@"%d ", j]];
                    }
                }
                NSLog(@"Held Dice: %@", heldList);
            }
            else
            {
                NSLog(@"\nInvalid Dice Number");
            }
        }
        //End hold dice command
        
        
        //Release command - allows user to release
        else if([userInput hasPrefix:@"release"])
        {
            if([userInput isEqualToString:@"release"])
            {
                userInput = [playInputCollector inputWithHistoryForPrompt:@"\nWhat dice number would you like to release?"];
            }
            
            int i = [[userInput stringByReplacingOccurrencesOfString:@"release " withString:@""] intValue];
            if((i!=0 || [[userInput stringByReplacingOccurrencesOfString:@"release " withString:@""]  isEqual: @"0"]) && i < diceManager.allDice.count)
            {
                //Actually Release the dice
                [diceManager releaseDice:diceManager.allDice[i]];
                
                //List held dice
                NSString *heldList = @"";
                for(int j = 0; j<diceManager.allDice.count; j++)
                {
                    if([diceManager.heldDice containsObject:diceManager.allDice[j]])
                    {
                        heldList = [heldList stringByAppendingString:[NSString stringWithFormat:@"%d ", j]];
                    }
                }
                NSLog(@"\nHeld Dice: %@", heldList);
                //end List held Dice
                
            }
            else
            {
                NSLog(@"\nInvalid Dice Number");
            }
        }
        //End Release dice command
        
        
        //Reset game command
        else if (hasRolled && ([userInput isEqualToString:@"restart"] || [userInput isEqualToString:@"reset"]))
        {
            //Update the low score if necessary
            if([lowScore isGreaterThan:[diceManager currentScore]])
            {
                lowScore = [diceManager currentScore];
            }
            
            [diceManager.heldDice removeAllObjects];
            hasRolled = NO;
            numRolls = 0;
        }
        //End Reset
        
        
        //Unrecognized command
        else
        {
            NSLog(@"\nInvalid Input");
        }
    }
    
    return NO;    
}


@end
