//
//  Dice.m
//  Threelow
//
//  Created by Shaun Campbell on 2016-09-07.
//  Copyright © 2016 Shaun Campbell. All rights reserved.
//

#import "Dice.h"

@interface Dice()

@property (nonatomic) NSNumber *value;

@end

@implementation Dice

-(NSNumber *)roll
{
    self.value = [NSNumber numberWithInt:(arc4random_uniform(6)+1)];
    return self.value;
}

-(NSNumber *) returnValue
{
    return self.value;
}

//Ensures the dice come into existence with a value (a random one)
- (instancetype)init
{
    self = [super init];
    if (self) {
        _value = [NSNumber numberWithInt:(arc4random_uniform(6)+1)];
    }
    return self;
}


-(NSString *)description
{
    return [self.value stringValue];
}


@end
