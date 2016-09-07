//
//  main.m
//  Threelow
//
//  Created by Shaun Campbell on 2016-09-07.
//  Copyright © 2016 Shaun Campbell. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Dice.h"
#import "InputCollector.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        InputCollector *inputColletor = [[InputCollector alloc] init];
        
        //just some dice to use for now
        NSMutableSet *setOfDice = [[NSMutableSet alloc] init];
        for(int i = 0; i < 5; i++)
        {
            [setOfDice addObject:[[Dice alloc]init]];
        }
        
        NSString *userInput = [[NSString alloc] init];
        bool quit = NO;
        
        //Main progam loop
        while(!quit)
        {
            userInput = [inputColletor inputWithHistoryForPrompt:@"temp"];
            
            //Quit Commans
            if([userInput isEqualToString:@"quit"])
            {
                NSLog(@"quitting.....");
                quit = YES;
            }
            
            //Roll command
            else if([userInput isEqualToString:@"roll"])
            {
                for(Dice *selectedDice in setOfDice)
                {
                    [selectedDice roll];
                }
            }
            
            
            //Input is not a command
            else
            {
                NSLog(@"Invalid input");
            }
        
        
        
        
        
        
        }
        
    }
    return 0;
}
