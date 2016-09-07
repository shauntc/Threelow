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
#import "GameController.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        InputCollector *inputColletor = [[InputCollector alloc] init];
        GameController *gameController = [[GameController alloc] init];
        
        NSString *mainMenu = @"\nMain Menu:\nplay - Play The Game\nquit - Quit Program\nhelp - Show Menu Again";
        
        bool quit = NO;
        
        NSLog(@"%@", mainMenu);
        
        //Main progam loop
        while(!quit)
        {
            NSString *userInput = [inputColletor inputWithHistoryForPrompt:@""];
            
            //Quit Command
            if([userInput isEqualToString:@"quit"])
            {
                NSLog(@"\nquitting.....");
                quit = YES;
            }
            
            //Play Command
            else if([userInput isEqualToString:@"play"])
            {
                quit = [gameController Play];
                if(!quit)
                {
                    NSLog(@"%@", mainMenu); 
                }
            }
            
            //Help/Menu Command - Display menu again
            else if ([userInput isEqualToString:@"help"] || [userInput isEqualToString:@"menu"])
            {
                NSLog(@"%@", mainMenu);
            }
            
            //Input is not a command
            else
            {
                NSLog(@"\nInvalid input%@", mainMenu);
            }
        
        
        
        
        
        
        }
        
    }
    return 0;
}
