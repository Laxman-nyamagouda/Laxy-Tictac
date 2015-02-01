//
//  ViewController.m
//  TicTac
//
//  Created by Laxman on 15/11/14.
//  Copyright (c) 2014 New. All rights reserved.
//

#import "ViewController.h"
#import "TicTacCell.h"
#import "TicTacConstants.h"

@interface ViewController (){
    
    TicTacCell *cell;
    NSString *textFromTextField;
}
@property (nonatomic, assign) NSInteger cellSelectionCount;
@property (nonatomic, assign) NSInteger itemSelected;
@property (nonatomic, strong) NSMutableArray *cellSelected;

@end

@implementation ViewController
@synthesize colView, XplayerCount, OplayerCount,textField1;
@synthesize model,win, numOfZero, numOfX, NcrossN;

#pragma mark -
#pragma mark viewDidLoad
- (void)viewDidLoad {
    [super viewDidLoad];
    
    //Instantiating TicTacModel and WinLogic classes
    model = [[TicTacModel alloc] init];
    win = [[WinLogic alloc] init];
    //When App starts it creates 2-D array with size 3 by default
    [self.model createTwoDimArrayStructureWithSize:3];
    
    NcrossN = 3;
    textField1.placeholder = PLACEHOLDER;
    textFromTextField = DEFAULTVALVE;
    _cellSelectionCount = numOfZero = numOfX = 0;
    _cellSelected = [NSMutableArray arrayWithCapacity:1];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
#pragma mark UITextFieldDelegate
// This method enables or disables the processing of return key
-(BOOL) textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    textFromTextField = textField.text;
    NcrossN = [textFromTextField intValue];
    [self.model createTwoDimArrayStructureWithSize:NcrossN];
    
    //Validating UITextField
    if (NcrossN <3 || NcrossN >7) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:ALERTMESSAGE message:@""   delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        alert.tag = 200;
        [alert show];
    }else {
        [self resetButtonTapped:self];
        [self.colView reloadData];
    }
    return YES;
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
    //CollectionView cellForItemAtIndexPath
    cell = [colView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    cell.tag = indexPath.row;
    
    if (self.itemSelected == (indexPath.row+1) ) {
        if ([self.cellSelected count] % 2) {
            cell.imageCell.image = [UIImage imageNamed:@"O1.png"];
            numOfZero++;
            OplayerCount.text = [NSString stringWithFormat:@"%ld",(long)numOfZero];
            
            if (indexPath.row < NcrossN) {
                NSInteger rows = 0; NSInteger columns = indexPath.row;
                [self.model replaceObjectInTwoDimArrayStructureWithObject:@"0" atRow:rows andCol:columns];
            }else{
                
                NSInteger rows = indexPath.row/NcrossN; NSInteger columns = indexPath.row%NcrossN;
                [self.model replaceObjectInTwoDimArrayStructureWithObject:@"0" atRow:rows andCol:columns];
            }
        } else  {
            cell.imageCell.image = [UIImage imageNamed:@"X1.png"];
            numOfX++;
            XplayerCount.text = [NSString stringWithFormat:@"%ld",(long)numOfX];
            
            if (indexPath.row < NcrossN) {
                NSInteger rows = 0; NSInteger columns = indexPath.row;
                [self.model replaceObjectInTwoDimArrayStructureWithObject:@"X" atRow:rows andCol:columns];
            }else{
                
                NSInteger rows = indexPath.row/NcrossN; NSInteger columns = indexPath.row%NcrossN;
                [self.model replaceObjectInTwoDimArrayStructureWithObject:@"X" atRow:rows andCol:columns];
            }
        }
    }
    
    if(numOfZero >= NcrossN){
        [self checkGameStatus];
    }
    return cell;
}

-(void) collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    //called when user selects perticular cell of collectionview
    if ([_cellSelected containsObject:indexPath] == FALSE) {
        self.itemSelected = indexPath.row+1;
        [self.cellSelected addObject:(indexPath)];
        [self.colView  reloadItemsAtIndexPaths:@[indexPath]];
    }
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    //return the number of Rows*Columns
    return NcrossN*NcrossN;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    //You may want to create a divider to scale the size by the way..
    return CGSizeMake(colView.frame.size.width/NcrossN - 10, colView.frame.size.height/NcrossN-10);
}

- (UIEdgeInsets)collectionView:(UICollectionView*)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(5, 0, 0, 0); // top, left, bottom, right
}

#pragma mark -
#pragma mark Reset and check winner
-(IBAction)resetButtonTapped:(id)sender{
    
    //Resetting the counters and reloading the collectionview
    numOfZero = numOfX = 0;
    XplayerCount.text = [NSString stringWithFormat:@"%ld",(long)numOfX];
    OplayerCount.text = [NSString stringWithFormat:@"%ld",(long)numOfZero];
    
    [self.model createTwoDimArrayStructureWithSize:NcrossN];
    
    for (TicTacCell *cl in [self.colView subviews]) {
        if ([cl isKindOfClass:[TicTacCell class ]]) {
            cl.imageCell.image = nil;
        }
    }
    
    self.itemSelected = 0;
    [self.cellSelected removeAllObjects];
    [self.colView reloadData];
}

-(void) checkGameStatus {
    NSString *result = [self.win checkWinner:self.model.ticTacList withSize:NcrossN withNumOfZeros:numOfZero andNumOfXs:numOfX];
    if ([result length]) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:result
                                                        message:@"Reset!"   delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        alert.tag = 100;
        [alert show];
    }
}


#pragma mark -
#pragma mark UIAlertViewDelegate
-(void) alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    if (alertView.tag == 100) {
        [self resetButtonTapped:self];
    }
}

#pragma mark -
#pragma mark shouldAutorotate
- (BOOL) shouldAutorotate {
    return NO;
}
@end
