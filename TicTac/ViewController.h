//
//  ViewController.h
//  TicTac
//
//  Created by Laxman on 15/11/14.
//  Copyright (c) 2014 New. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TicTacModel.h"
#import "WinLogic.h"

@interface ViewController : UIViewController <UICollectionViewDelegate,UICollectionViewDataSource, UIAlertViewDelegate, UITextFieldDelegate>{
    
    TicTacModel *model;
    WinLogic *win;
}
@property (nonatomic, weak) IBOutlet UICollectionView *colView;
@property (strong, nonatomic) IBOutlet UILabel *XplayerCount;
@property (strong, nonatomic) IBOutlet UILabel *OplayerCount;
@property (strong, nonatomic) IBOutlet UITextField *textField1;
@property (nonatomic, assign) NSInteger numOfZero, numOfX, NcrossN;

@property (strong, nonatomic) TicTacModel *model;
@property (strong, nonatomic) WinLogic *win;

-(IBAction)resetButtonTapped:(id)sender;

@end

