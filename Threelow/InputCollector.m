//
//  InputCollector.m
//  ContactList
//
//  Created by Shaun Campbell on 2016-09-06.
//  Copyright © 2016 Shaun Campbell. All rights reserved.
//

#import "InputCollector.h"

@implementation InputCollector

- (instancetype)init
{
    self = [super init];
    if (self) {
        _commandHistory = [[NSMutableArray alloc] init];
    }
    return self;
}

+(NSString *)inputForPrompt:(NSString *)promptString;
{
    char inputChars[255];
    NSLog(@"%@", promptString);
    fgets(inputChars,255,stdin);
    
    //Converts chars to String and trims the excess whitespace and new lines
    return [[NSString stringWithUTF8String:inputChars] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];

}

-(NSString *)inputWithHistoryForPrompt:(NSString *)promptString
{
    
    
    [self.commandHistory addObject:[InputCollector inputForPrompt:promptString]];
    
    return [self.commandHistory lastObject];
    
}


-(void) history
{
    for(int i = (int)self.commandHistory.count-2; i>((int)self.commandHistory.count-5) && i>=0; i--)
    {
        NSLog(@"%@\n",self.commandHistory[i]);
    }
}

@end
