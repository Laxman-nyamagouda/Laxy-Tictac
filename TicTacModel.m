//
//  TicTacModel.m
//  TicTac
//
//  Created by Laxman on 14/12/14.
//  Copyright (c) 2014 New. All rights reserved.
//

#import "TicTacModel.h"

@implementation TicTacModel
@synthesize ticTacList;

-(void) createTwoDimArrayStructureWithSize:(NSInteger)size {
    
    // Creating 2D Array and initializing with empty string
    ticTacList = [NSMutableArray arrayWithCapacity:size];
    for (NSInteger col = 0; col < size; col++) {
        NSMutableArray *rowList = [NSMutableArray arrayWithCapacity:size];
        for (NSInteger row = 0; row < size; row++) {
            // adding empty string here....
            [rowList addObject:@""];
        }
        [ticTacList addObject:rowList];
    }
}

-(void) replaceObjectInTwoDimArrayStructureWithObject:(NSString*)result atRow:(NSInteger)row andCol:(NSInteger)col {
    
    // Replacing emty string in 2D Array with objects
    [[ticTacList objectAtIndex:row] replaceObjectAtIndex:col withObject:result];
}

@end
        