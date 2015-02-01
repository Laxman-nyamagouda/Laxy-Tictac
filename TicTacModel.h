//
//  TicTacModel.h
//  TicTac
//
//  Created by Laxman on 14/12/14.
//  Copyright (c) 2014 New. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TicTacModel : NSObject{

    NSMutableArray *ticTacList;
}
@property(strong, nonatomic) NSMutableArray *ticTacList;

-(void) createTwoDimArrayStructureWithSize:(NSInteger)size;
-(void) replaceObjectInTwoDimArrayStructureWithObject:(NSString*)result atRow:(NSInteger)row andCol:(NSInteger)col;

@end


