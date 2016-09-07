//
//  InputCollector.h
//  ContactList
//
//  Created by Shaun Campbell on 2016-09-06.
//  Copyright © 2016 Shaun Campbell. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface InputCollector : NSObject

@property (nonatomic, strong) NSMutableArray *commandHistory;

+(NSString *)inputForPrompt:(NSString *)promptString;
-(NSString *)inputWithHistoryForPrompt:(NSString *)promptString;
-(void) history;



@end
