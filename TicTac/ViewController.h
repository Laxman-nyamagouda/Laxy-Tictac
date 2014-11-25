//
//  ViewController.h
//  TicTac
//
//  Created by Laxman on 15/11/14.
//  Copyright (c) 2014 New. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic, strong) IBOutlet UICollectionView *colView;
@property (strong, nonatomic) UILabel *label;
@end

