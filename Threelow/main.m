//
//  main.m
//  Threelow
//
//  Created by Shaun Campbell on 2016-09-07.
//  Copyright © 2016 Shaun Campbell. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Dice.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSMutableSet *setOfDice = [[NSMutableSet alloc] init];
        
        
        //Dice are randomized on creation by init function
        for(int i = 0; i < 5; i++)
        {
            [setOfDice addObject:[[Dice alloc]init]];
        }
        
        NSLog(@"%@", setOfDice);
        
//        for(Dice *value in setOfDice)
//        {
//            NSLog(@"%@", value);
//        }
        
//        Dice *newDice = [[Dice alloc] init];
//        
//        NSLog(@"%@", newDice);
        
        

        
    }
    return 0;
}
