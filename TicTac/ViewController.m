//
//  ViewController.m
//  TicTac
//
//  Created by Laxman on 15/11/14.
//  Copyright (c) 2014 New. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){

    
    int row2;
}



@end

@implementation ViewController
@synthesize colView,label;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
#pragma mark UICollectionViewDataSource

-(NSInteger)numberOfSectionsInCollectionView:
(UICollectionView *)collectionView
{
    return 1;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                 cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *myCell = [colView
                                    dequeueReusableCellWithReuseIdentifier:@"Cell"
                                    forIndexPath:indexPath];
    
    label = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 20, 20)];
    
    long row1 = [indexPath row];
    [myCell addSubview:label];
   
    if (row2 == 0) {
        
        label.text  = @"0";
    }
    else if (row2 == 1) {
        
        label.text  = @"*";
    }
    //label.text  = inStr;
    return myCell;
}

-(void) collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{

    row2 = indexPath.row;
    NSString *inStr = [NSString stringWithFormat: @"%ld", (long)row2];
    
    
    
    
    [colView reloadData];
}
-(NSInteger)collectionView:(UICollectionView *)collectionView
    numberOfItemsInSection:(NSInteger)section
{
    return 9;
}

@end
