//
//  WinLogic.m
//  TicTac
//
//  Created by Laxman on 14/12/14.
//  Copyright (c) 2014 New. All rights reserved.
//

#import "WinLogic.h"
#import "TicTacConstants.h"

@interface WinLogic ()

-(NSString *) checkDiagonal2Win: (NSMutableArray *)array withSize: (NSInteger) size;
-(NSString *) checkDiagonal1Win: (NSMutableArray *)array withSize: (NSInteger) size;
-(NSString *) checkColumnWin:(NSMutableArray *)array withSize: (NSInteger) size;
-(NSString *) checkRowWin:(NSMutableArray *)array withSize: (NSInteger)size;

@end

@implementation WinLogic

-(NSString *) checkWinner:(NSMutableArray *)array withSize:(NSInteger)size withNumOfZeros:(NSInteger)numZero andNumOfXs:(NSInteger)numX
{
    
    //Checking winner in rows, columns and diagonals
    NSString *rowWin = [self checkRowWin:array withSize:size];
    NSString *colWin = [self checkColumnWin:array withSize:size];
    NSString *diagonal1Win = [self checkDiagonal1Win:array withSize:size];
    NSString *diagonal2Win = [self checkDiagonal2Win:array withSize:size];

    NSString *result = [[NSString alloc] init];
        
    if (![rowWin isEqualToString:ROW]) {
        
        result = [NSString stringWithFormat:@"%@ has won Play again!",rowWin];
    }else if (![colWin isEqualToString:COL]) {
        
        result = [NSString stringWithFormat:@"%@ has won Play again!",colWin];
    }else if (![diagonal1Win isEqualToString:D1]) {
        
        result = [NSString stringWithFormat:@"%@ has won Play again!",diagonal1Win];
    }else if (![diagonal2Win isEqualToString:D2]) {
        
        result = [NSString stringWithFormat:@"%@ has won Play again!",diagonal2Win];
    }else if([rowWin isEqualToString:ROW] && (numZero+numX) == (size*size)){
        
        result = [NSString stringWithFormat:@"Game has drawn"];
    }
    return result;
}

-(NSString *) checkRowWin:(NSMutableArray *)array withSize: (NSInteger)size{
    
    //Checking for Row win conditions
    NSInteger count;
    NSString *current;
    
    for (NSInteger i = 0; i< size; i++) {
        count =0;
        
        for (NSInteger j = 1; j< size; j++) {
            
            current = [[array objectAtIndex:i] objectAtIndex:0];
            NSString *toCheck = [[array objectAtIndex:i] objectAtIndex:j];
            
            if( [toCheck isEqualToString:@""])
                break;
            else if([toCheck isEqualToString:current])
                count++;
            else
                break;
        }
        if( count == size-1)
            return current;
    }
    return ROW;
}

-(NSString *) checkColumnWin:(NSMutableArray *)array withSize: (NSInteger) size {
    
    //Checking for Column win conditions
    NSInteger count;
    NSString *current;
    
    for (NSInteger i = 0; i< size; i++) {
        count =0;
        
        for (NSInteger j = 1; j< size; j++) {
            
            current = [[array objectAtIndex:0] objectAtIndex:i];
            NSString *toCheck = [[array objectAtIndex:j] objectAtIndex:i];
            
            if( [toCheck isEqualToString:@""])
                break;
            else if([toCheck isEqualToString:current])
                count++;
            else
                break;
        }
        if( count == size-1)
            return current;
    }
    return COL;
}

-(NSString *) checkDiagonal1Win: (NSMutableArray *)array withSize: (NSInteger) size{
    
    //Checking for Diagonal1 win conditions
    NSInteger count = 0;
    NSString *current;
    
    for (NSInteger j = 1; j< size; j++) {
        
        current = [[array objectAtIndex:0] objectAtIndex:0];
        NSString *toCheck = [[array objectAtIndex:j] objectAtIndex:j];
        
        if( [toCheck isEqualToString:@""])
            break;
        else if([toCheck isEqualToString:current])
            count++;
        else
            break;
    }
    if( count == size-1)
        return current;
    return D1;
}

-(NSString *) checkDiagonal2Win: (NSMutableArray *)array withSize: (NSInteger) size{
    
    //Checking for Diagonal2 win conditions
    NSInteger count=0;
    NSString *current;
    
    for (NSInteger i = 1, j = size-2; i< size; i++,j--) {
        
        current = [[array objectAtIndex:0] objectAtIndex:size-1];
        NSString *toCheck = [[array objectAtIndex:i] objectAtIndex:j];
        
        if( [toCheck isEqualToString:@""])
            break;
        else if([toCheck isEqualToString:current])
            count++;
        else
            break;
    }
    
    if( count == size-1)
        return current;
    return D2;
}

@end
