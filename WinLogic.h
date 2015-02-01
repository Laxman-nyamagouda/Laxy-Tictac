//
//  WinLogic.h
//  TicTac
//
//  Created by Laxman on 14/12/14.
//  Copyright (c) 2014 New. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WinLogic : NSObject

-(NSString *) checkWinner:(NSMutableArray *)array withSize:(NSInteger)size withNumOfZeros:(NSInteger)numZero andNumOfXs:(NSInteger)numX;

@end

